import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/18_2-BadLCCallNumbers.csv'

query = """
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.varfield_type_code AS "Field Tag",
	v.marc_tag AS "MARC Tag",
	v.field_content AS "Content"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
WHERE
	v.marc_tag IN ('050','090','930')
	AND (
		v.field_content NOT SIMILAR TO '\|a[A-Z]%'
		OR (v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9]%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z]')
		OR (v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9][A-Z0-9\|\.]%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z]'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9]'
			AND v.field_content NOT SIMILAR TO '\|aAB%Test')
		OR (v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9][A-Z0-9][0-9\|\.]%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z]'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9]'
			AND v.field_content NOT SIMILAR TO '\|aAB%Test'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9][A-Z0-9]'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][0-9]\|b%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][0-9]\.[A-Z0-9]%'
			AND v.field_content NOT SIMILAR TO '\|aPOS%'
			AND v.field_content NOT SIMILAR TO '\|aJ65a%'
			AND v.field_content NOT SIMILAR TO '\|aP23 19[67][13]%')
		)
ORDER BY v.field_content, v.marc_tag, r.record_num ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Record Number', 'Field Tag', 'MARC Tag', 'Content'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

