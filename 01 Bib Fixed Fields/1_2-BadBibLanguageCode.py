import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/1_2-BadBibLanguageCode.csv'

query = """
    SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.language_code AS "Language Code"
FROM
	sierra_view.bib_view b
	LEFT JOIN sierra_view.language_property_myuser m ON b.language_code = m.code
WHERE m.code IS NULL
ORDER BY b.language_code;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    #rd.writerow(['Bib Record', 'Language Code'])
    for row in range(len(report_data)):
        rd.writerow(report_data[row])

print('csv file generation complete')
