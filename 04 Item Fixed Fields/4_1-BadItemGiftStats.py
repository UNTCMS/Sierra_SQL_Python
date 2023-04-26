import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/4_1-BadItemGiftStats.csv'

query = """
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.icode1 AS "Gift Stats"
FROM
	sierra_view.item_view i
WHERE i.icode1 NOT IN ('0','6')
ORDER BY i.icode1;
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

