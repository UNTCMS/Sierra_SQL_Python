import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/8_1_3-Bad337MediaType.csv'

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
		AND v.marc_tag = '337'
WHERE
	r.record_type_code = 'b'
	AND (v.marc_ind1 != ' '
		OR v.marc_ind2 != ' '
		OR (v.field_content NOT LIKE '%|aaudio|2rdamedia%'
			AND v.field_content NOT LIKE '%|acomputer|2rdamedia%'
			AND v.field_content NOT LIKE '%|amicroform|2rdamedia%'
			AND v.field_content NOT LIKE '%|amicroscopic|2rdamedia%'
			AND v.field_content NOT LIKE '%|aprojected|2rdamedia%'
			AND v.field_content NOT LIKE '%|astereographic|2rdamedia%'
			AND v.field_content NOT LIKE '%|aunmediated|2rdamedia%'
			AND v.field_content NOT LIKE '%|avideo|2rdamedia%'
			AND v.field_content NOT LIKE '%|aother|2rdamedia%'
			AND v.field_content NOT LIKE '%|aunspecified|2rdamedia%'
			AND v.field_content NOT LIKE '%|aaudio|bs|2rdamedia%'
			AND v.field_content NOT LIKE '%|acomputer|bc|2rdamedia%'
			AND v.field_content NOT LIKE '%|amicroform|bh|2rdamedia%'
			AND v.field_content NOT LIKE '%|amicroscopic|bp|2rdamedia%'
			AND v.field_content NOT LIKE '%|aprojected|bg|2rdamedia%'
			AND v.field_content NOT LIKE '%|astereographic|be|2rdamedia%'
			AND v.field_content NOT LIKE '%|aunmediated|bn|2rdamedia%'
			AND v.field_content NOT LIKE '%|avideo|bv|2rdamedia%'
			AND v.field_content NOT LIKE '%|aother|bx|2rdamedia%'
			AND v.field_content NOT LIKE '%|aunspecified|bz|2rdamedia%'))
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

