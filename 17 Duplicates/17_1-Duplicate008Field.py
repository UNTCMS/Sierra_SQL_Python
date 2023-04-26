import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/17_1-Duplicate008Field.csv'

query = """
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record"
FROM
	sierra_view.control_field c1
	JOIN sierra_view.control_field c2 ON c2.record_id = c1.record_id
	JOIN sierra_view.bib_view b ON b.id = c1.record_id
WHERE
	c2.id > c1.id
	AND c1.control_num = '8'
	AND c2.control_num = '8'
ORDER BY b.record_num
LIMIT 100;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Bib Record', 'Field', 'Value'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

