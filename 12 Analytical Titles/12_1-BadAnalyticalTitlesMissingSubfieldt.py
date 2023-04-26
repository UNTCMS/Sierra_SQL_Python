import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/12_1-BadAnalyticalTitlesMissingSubfieldt.csv'

query = """
SELECT
	v.record_type_code || v.record_num || 'a' AS "Bib Record",
	v.marc_tag AS "Field",
	v.field_content AS "Value"
FROM
	sierra_view.varfield_view v
WHERE
	v.record_type_code = 'b'
	AND v.marc_tag IN ('700','710','711')
	AND v.marc_ind2 = '2'
	AND v.field_content NOT LIKE '%|t%'
	AND v.field_content NOT LIKE '%|k%'
ORDER BY v.record_num ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Record Number', 'Field', 'Value'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

