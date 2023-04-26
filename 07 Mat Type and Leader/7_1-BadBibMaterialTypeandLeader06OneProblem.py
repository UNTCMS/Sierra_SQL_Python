import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/7_1-BadBibMaterialTypeandLeader06OneProblem.csv'

query = """
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.bcode2 AS "Mat Type",
	l.record_type_code AS "LDR/06",
	l.bib_level_code AS "LDR/07"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE 
	b.bcode1 NOT IN ('a','p','r','z')
	AND b.bcode3 = '-'
	AND b.bcode2 = 'y'
	AND l.record_type_code = 'a'
	AND l.bib_level_code IN ('i','m')
ORDER BY b.bcode2, l.record_type_code, b.record_num;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    rd.writerow(['Bib Record', 'MatType', 'LDR/06', 'LDR/07'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

