import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/18_1-BadLCCallNumbersSummary.csv'

query = """
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield_view v
WHERE
	v.record_type_code = 'b'
	AND v.marc_tag IN ('050','090','930')
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
--	AND v.field_content NOT LIKE '%|t%|k%'
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
    rd.writerow(['Field', 'Value', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

