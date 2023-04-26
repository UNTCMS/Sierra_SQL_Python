import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/6_7-Bad Leader_08Summary.csv'

query = """
Select
	l.control_type_code AS "LDR/08",
	COUNT (l.control_type_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.control_type_code NOT IN (' ','a')
GROUP BY l.control_type_code
ORDER BY l.control_type_code ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    rd.writerow(['LDR/08', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

