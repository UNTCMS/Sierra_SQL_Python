import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/4_2-BadItemIMessage.csv'

query = """
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.item_message_code AS "IMessage"
FROM
	sierra_view.item_view i
WHERE i.item_message_code NOT IN ('-','c','m','x')
ORDER BY i.item_message_code;
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

