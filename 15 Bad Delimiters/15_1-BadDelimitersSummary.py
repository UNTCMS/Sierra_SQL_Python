import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/15_1-BadDelimitersSummary.csv'

query = """
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
WHERE
	v.marc_tag NOT IN ('037','040','066','350','880','935','959','962')
	AND (v.field_content LIKE '%ǂ%'
		OR v.field_content SIMILAR TO '%\$\D%')
	AND v.field_content NOT SIMILAR TO '%http[^\|\s]*\$%'
	AND v.field_content NOT SIMILAR TO '%\$\.\d\d'
	AND v.field_content NOT SIMILAR TO '%\$\.\d\d\s%'
	AND v.field_content NOT SIMILAR TO '%\$ense%'
	AND v.field_content NOT SIMILAR TO '%Bada\$\$%'
	AND v.field_content NOT SIMILAR TO '%[Ee]conomic\$%'
	AND v.field_content NOT SIMILAR TO '%[Gg]rant\$%'
	AND v.field_content NOT SIMILAR TO '%Schitt\$%'
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.marc_tag ASC;
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Bib Record', 'Field', 'Value'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

