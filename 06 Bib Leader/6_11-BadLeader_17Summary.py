import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/6_11-Bad Leader_17Summary.csv'

query = """
Select
	l.encoding_level_code AS "LDR/17",
	COUNT (l.encoding_level_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.encoding_level_code NOT IN (' ','1','2','3','4','5','7','8','I','J','K','L','M','u','z')
GROUP BY l.encoding_level_code
ORDER BY l.encoding_level_code ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    rd.writerow(['LDR/17', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

