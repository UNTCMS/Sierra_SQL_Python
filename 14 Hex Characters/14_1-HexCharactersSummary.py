import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/14_1-HexCharactersSummary.csv'

query = """
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield_view v
WHERE
	v.record_type_code = 'b'
	AND v.field_content SIMILAR TO '%&#%'
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Field', 'Value', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

