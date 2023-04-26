import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/7_2-BadBibMaterialTypeandLeader06Summary.csv'

query = """
SELECT
	b.bcode2 AS "Mat Type",
	l.record_type_code AS "LDR/06",
	l.bib_level_code AS "LDR/07",
	COUNT (b.bcode2) AS "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE 
	b.bcode1 NOT IN ('a','p','r','z')
	AND b.bcode3 = '-'
	AND (
		(b.bcode2 = '-')
	OR (b.bcode2 = 'a' AND (l.record_type_code != 'a' OR l.bib_level_code = 's'))
	OR (b.bcode2 = 'b' AND l.record_type_code NOT IN ('a','c','d','e','f','g','i','j','k','m','t'))
	OR (b.bcode2 = 'c' AND l.record_type_code NOT IN ('c','d'))
	OR (b.bcode2 = 'e' AND l.record_type_code NOT IN ('e','f'))
	OR (b.bcode2 = 'g' AND l.record_type_code != 'g')
	OR (b.bcode2 = 'i' AND l.record_type_code != 'i')
	OR (b.bcode2 = 'j' AND l.record_type_code != 'j')
	OR (b.bcode2 = 'k' AND l.record_type_code != 'k')
	OR (b.bcode2 = 'm' AND l.record_type_code != 'm')
	OR (b.bcode2 = 'n' AND (l.record_type_code != 'a' OR l.bib_level_code = 's'))
	OR (b.bcode2 = 'o' AND l.record_type_code != 'o')
	OR (b.bcode2 = 'p' AND l.record_type_code != 'p')
	OR (b.bcode2 = 'q' AND (l.record_type_code != 'a' OR l.bib_level_code NOT IN ('b','s')))
	OR (b.bcode2 = 'r' AND l.record_type_code != 'r')
	OR (b.bcode2 = 's' AND l.record_type_code NOT IN ('c','d'))
	OR (b.bcode2 = 't' AND (l.record_type_code != 't' OR l.bib_level_code = 's'))
-- NOTE: If bcode 2 = 'y', exclude records with 001 fields beginning with ssib or ssj
--	OR (b.bcode2 = 'y' AND (l.record_type_code != 'a' OR l.bib_level_code != 's'))
	OR (b.bcode2 = 'z' AND l.record_type_code NOT IN ('a','t'))
	OR (l.record_type_code = 'a' AND b.bcode2 NOT IN ('a','b','n','q','y','z'))
	OR (l.record_type_code IN ('c','d') AND b.bcode2 NOT IN ('b','c','s'))
	OR (l.record_type_code IN ('e','f') AND b.bcode2 NOT IN ('b','e'))
	OR (l.record_type_code = 'g' AND b.bcode2 NOT IN ('b','g'))
	OR (l.record_type_code = 'i' AND b.bcode2 NOT IN ('b','i'))
	OR (l.record_type_code = 'j' AND b.bcode2 NOT IN ('b','j'))
	OR (l.record_type_code = 'k' AND b.bcode2 NOT IN ('b','k'))
	OR (l.record_type_code = 'm' AND b.bcode2 NOT IN ('b','m'))
	OR (l.record_type_code = 'o' AND b.bcode2 != 'o')
	OR (l.record_type_code = 'p' ANd b.bcode2 != 'p')
	OR (l.record_type_code = 'r' AND b.bcode2 != 'r')
	OR (l.record_type_code = 't' AND b.bcode2 NOT IN ('b','t','z'))
	)
GROUP BY b.bcode2, l.record_type_code, l.bib_level_code
ORDER BY b.bcode2, l.record_type_code, l.bib_level_code;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
    rd.writerow(['MatType', 'LDR/06', 'LDR/07', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

