import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/1_4-BadBibLocations-InvalidBibLocations.csv'

query = """
    SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.location_code AS "Location"
FROM
	sierra_view.bib_record_location l
	JOIN sierra_view.bib_record r ON r.record_id = l.bib_record_id
	JOIN sierra_view.bib_view b ON b.id = r.id	
WHERE

	l.location_code NOT IN ('czm','czwww','d','fip','frsco','gwww','kmatt','kpacs','kpeb','law','lawww','lwww','multi','mwww','none','r','rmak','s','scmc','sd','sjuv','test','w','w1mak','w4m','w4mrb','w4spe','x','xmic','xts','pwww','flrs','fl','flind','flmak')
--The following location codes should not be used in bib records, but will be corrected when link maintenance is implemented
	AND l.location_code NOT IN ('hscfw','sdnb','w3lab','w4mts','wlmic')
ORDER BY l.location_code;
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
