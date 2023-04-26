import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/6_13-Bad Leader_18Summary.csv'

query = """
Select
	l.descriptive_cat_form_code AS "LDR/18",
	COUNT (l.descriptive_cat_form_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
-- 'c' is a valid code, but should not be used in UNT records
-- 'L' is not a valid code, but it is used in Serials Solutions records
	l.descriptive_cat_form_code NOT IN (' ','a','i','n','u','L')
GROUP BY l.descriptive_cat_form_code
ORDER BY l.descriptive_cat_form_code ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    rd.writerow(['LDR/18', 'Count', 'c not used at UNT'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

