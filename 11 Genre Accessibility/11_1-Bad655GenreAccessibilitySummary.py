import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/11_1-Bad655GenreAccessibilitySummary.csv'

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
	v.marc_tag = '655'
	AND (
		(v.field_content SIMILAR TO '%hearing impaired%'
			AND v.field_content NOT LIKE '|aVideo recordings for the hearing impaired.|2lcgft%'
			AND v.field_content NOT LIKE '|aVideo recordings for the hearing impaired.|2fast%')
		OR (v.field_content SIMILAR TO '%visual disabilities%'
			AND v.field_content NOT LIKE '|aVideo recordings for people with visual disabilities.|2lcgft%'
			AND v.field_content NOT LIKE '|aVideo recordings for people with visual disabilities.|2fast%'
			AND v.field_content NOT LIKE '|aCartographic materials for people with visual disabilities.|2lcgft%'
			AND v.field_content NOT LIKE '|aCartographic materials for people with visual disabilities.|2fast%')
		)
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
  #  rd.writerow(['Field', 'Value', 'Count'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

