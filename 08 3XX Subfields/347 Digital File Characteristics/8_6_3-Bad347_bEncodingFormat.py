import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/8_6_3-Bad347_bEncodingFormat.csv'

query = """
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	s.marc_tag AS "MARC Tag",
	s.marc_ind1 AS "Ind1",
	s.marc_ind2 AS "Ind2",
	s.tag AS "Subfield",
	s.content AS "Content"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '347'
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
-- Audio encoding formats
		'AAC',
		'ACELP',
		'AIFF',
		'Blu-ray audio',
		'CD audio',
		'DAISY',
		'DSD',
		'DVD audio',
		'HDCD',
		'HFPA',
		'MP3',
		'RealAudio',
		'SACD',
		'WAV',
-- Data encoding formats
		'Access',
		'Excel',
		'Lotus',
		'Max patch (7.2.1)',
		'XML',
-- Image encoding formats
		'BMP',
		'GIF',
		'JPEG',
		'JPEG2000',
		'PNG',
		'TIFF',
-- Spatial data encoding formats
		'ArcInfo',
		'BIL',
		'BSQ',
		'CAD',
		'DEM',
		'E00',
		'MID/MIF',
-- Text encoding formats
		'ASCII',
		'HTML',
		'Megadots',
		'MS Word',
		'PDF',
		'RTF',
		'SGML',
		'TeX',
		'Word Perfect',
		'XHTML',
		'XML',
-- Video encoding formats
		'Blu-ray',
		'DVD video',
		'Flash',
		'FLV',
		'HD-DVD',
		'Ultra HD Blu-ray',
		'M4V',
		'MOV',
		'MPEG-4',
		'MPG',
		'QuickTime',
		'RealVideo',
		'SVCD',
		'VCD',
		'Windows media',
		'WMV')
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;
    """

conn = psycopg2.connect(host="sierra-db.library.unt.edu", port="1032", database="iii", user="swolf", password=postgresql_password)

cur = conn.cursor()
cur.execute(query)

report_data = cur.fetchall()

with open(report, 'w', newline='') as csvfile:
    rd = csv.writer(csvfile)
  #  rd.writerow(['Record Number', 'MARC Tag', 'Ind1', 'Ind2', 'Content'])
    for row in report_data:
        rd.writerow(row)

print('csv file generation complete')

