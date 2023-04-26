import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/4_9-BadItemSuppression.csv'

query = """
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.icode2 AS "SUPPRESS(I)"
FROM
	sierra_view.item_view i
	LEFT JOIN sierra_view.user_defined_icode2_myuser m ON i.icode2 = m.code
WHERE m.code IS NULL
ORDER BY i.icode2;
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

