import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/6_14-Bad Leader_18.csv'

query = """
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.descriptive_cat_form_code AS "LDR/18"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
-- 'c' is a valid code, but should not be used in UNT records
-- 'L' is not a valid code, but it is used in Serials Solutions records
	l.descriptive_cat_form_code NOT IN (' ','a','i','L','n','u');
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

