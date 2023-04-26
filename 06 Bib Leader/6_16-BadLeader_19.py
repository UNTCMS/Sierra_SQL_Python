import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/6_16-Bad Leader_19.csv'

query = """
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.multipart_level_code AS "LDR/19"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.multipart_level_code NOT IN (' ','a','b','c');
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

