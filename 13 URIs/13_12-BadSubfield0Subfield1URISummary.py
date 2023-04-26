import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/13_12-BadSubfield0Subfield1URISummary.csv'

query = """
SELECT
	s.marc_tag AS "MARC Field",
	s.tag AS "Subfield",
	s.content AS "$0/$1 Content",
	COUNT (s.marc_tag) AS "Count"
FROM
	sierra_view.subfield s
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
WHERE
	r.record_type_code = 'b'
	AND s.tag IN ('0','1')
	AND s.content NOT LIKE 'http://id.loc.gov%'
	AND s.content NOT LIKE 'http://rdaregistry.info%'
	AND s.content NOT LIKE 'http://vocab.getty.edu/aat%'
	AND s.content NOT LIKE '(OCoLC)fst%'
GROUP BY s.marc_tag, s.tag, s.content
ORDER BY s.marc_tag, s.tag, s.content ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['MARC Field', 'Subfield', '$0/$1 Content', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

