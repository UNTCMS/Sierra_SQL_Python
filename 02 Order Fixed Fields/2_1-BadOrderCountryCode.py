import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/2_1-BadOrderCountryCode.csv'

query = """
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.country_code AS "Country Code"
FROM
	sierra_view.order_view b
	LEFT JOIN sierra_view.country_property_myuser m ON b.country_code = m.code
WHERE m.code IS NULL
ORDER BY b.country_code;
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
