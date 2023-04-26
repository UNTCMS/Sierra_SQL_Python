import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/13_11-BadSubfield0URIToDelete.csv'

query = """
SELECT
	r.record_type_code || r.record_num || 'a' AS "Bib Record",
	s.marc_tag AS "Field",
	s.tag AS "Subfield",
	s.content AS "Value"
FROM
	sierra_view.subfield s
	LEFT JOIN sierra_view.varfield v ON v.record_id = s.record_id
		AND v.marc_tag = '937'
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
		AND r.record_type_code = 'b'
WHERE
	s.marc_tag NOT IN ('033','251','385','753','856','880')
	AND s.tag = '0'
	AND s.content LIKE 'http%'
	AND (v.field_content IS NULL
		OR v.field_content NOT LIKE '|aBACKSTAGE%|c%')
ORDER BY r.record_num ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Bib Record', 'Field', 'Subfield', 'Value'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

