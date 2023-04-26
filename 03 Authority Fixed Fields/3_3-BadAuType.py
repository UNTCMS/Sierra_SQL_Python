import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/3_3-BadAuType.csv'

query = """
SELECT
	a.record_type_code || a.record_num || 'a' AS "Authority Record",
	a.code1 AS "Au Type"
FROM
	sierra_view.authority_view a
WHERE
	a.code1 NOT IN ('a','d','j')
ORDER BY a.code1;
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
