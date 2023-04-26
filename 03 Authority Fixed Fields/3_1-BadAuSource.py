import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/3_1-BadAuSource.csv'

query = """
SELECT
	a.record_type_code || a.record_num || 'a' AS "Authority Record",
	a.code2 AS "Au Source"
FROM
	sierra_view.authority_view a
WHERE
	a.code2 NOT IN ('1','2','4','5')
ORDER BY a.code2;
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

