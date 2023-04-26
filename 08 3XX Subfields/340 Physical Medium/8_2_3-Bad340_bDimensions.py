import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/8_2_3-Bad340_bDimensions.csv'

query = """
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.marc_tag AS "MARC Tag",
	v.marc_ind1 AS "Ind1",
	v.marc_ind2 AS "Ind2",
	v.field_content AS "Content"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.varfield v ON v.record_id = r.id
		AND v.marc_tag = '340'
		AND v.field_content LIKE '%|b%'
WHERE
	r.record_type_code = 'b'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sx\s\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sin\.\sx\s\d+\s\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sx\s\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\-\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|bin % \d+\s[cm]m'
--ORDER BY r.record_num ASC;
ORDER BY v.field_content ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Record Number', 'MARC Tag', 'Ind1', 'Ind2', 'Content'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

