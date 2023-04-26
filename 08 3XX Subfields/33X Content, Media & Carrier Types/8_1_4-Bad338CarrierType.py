import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/8_1_4-Bad338CarrierType.csv'

query = """
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.marc_tag AS "MARC Tag",
	v.marc_ind1 AS "Ind1",
	v.marc_ind2 AS "Ind2",
	v.field_content AS "Content"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.varfield v ON v.record_id = r.id
		AND v.marc_tag = '338'
WHERE
	r.record_type_code = 'b'
	AND (v.marc_ind1 != ' '
		OR v.marc_ind2 != ' '
		OR (v.field_content NOT LIKE '%|aaperture card|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio belt|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio cylinder|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio disc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio roll|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio wire reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudiocassette|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudiotape reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acard|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer card|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer chip cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer disc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer disc cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer tape cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer tape cassette|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer tape reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm cassette|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm roll|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilmslip|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilmstrip|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilmstrip cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aflipchart|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofiche|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofiche cassette|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm cassette|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm roll|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm slip|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicroopaque|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicroscope slide|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aobject|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aonline resource|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aoverhead transparency|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aroll|2rdacarrier%'
			AND v.field_content NOT LIKE '%|asheet|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aslide|2rdacarrier%'
			AND v.field_content NOT LIKE '%|asound-track reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|astereograph card|2rdacarrier%'
			AND v.field_content NOT LIKE '%|astereograph disc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideo cartridge|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideocassette|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideodisc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideotape reel|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avolume|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaperture card|bha|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio belt|bsb|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio cartridge|bsg|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio cylinder|bse|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio disc|bsd|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio roll|bsq|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudio wire reel|bsw|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudiocassette|bss|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aaudiotape reel|bst|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acard|bno|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer card|bck|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer chip cartridge|bcb|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer disc|bcd|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer disc cartridge|bce|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer tape cartridge|bca|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer tape cassette|bcf|2rdacarrier%'
			AND v.field_content NOT LIKE '%|acomputer tape reel|bch|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm cartridge|bmc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm cassette|bmf|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm reel|bmr|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilm roll|bmo|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilmslip|bgd|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilmstrip|bgf|2rdacarrier%'
			AND v.field_content NOT LIKE '%|afilmstrip cartridge|bgc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aflipchart|bnn|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofiche|bhe|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofiche cassette|bhf|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm cartridge|bhb|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm cassette|bhc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm reel|bhd|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm roll|bhj|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicrofilm slip|bhh|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicroopaque|bhg|2rdacarrier%'
			AND v.field_content NOT LIKE '%|amicroscope slide|bpp|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aobject|bnr|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aonline resource|bcr|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bcz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bez|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bhz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bmz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bnz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bpz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bsz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aother|bvz|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aoverhead transparency|bgt|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aroll|bna|2rdacarrier%'
			AND v.field_content NOT LIKE '%|asheet|bnb|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aslide|bgs|2rdacarrier%'
			AND v.field_content NOT LIKE '%|asound-track reel|bsi|2rdacarrier%'
			AND v.field_content NOT LIKE '%|astereograph card|beh|2rdacarrier%'
			AND v.field_content NOT LIKE '%|astereograph disc|bes|2rdacarrier%'
			AND v.field_content NOT LIKE '%|aunspecified|bzu|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideo cartridge|bvc|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideocassette|bvf|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideodisc|bvd|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avideotape reel|bvr|2rdacarrier%'
			AND v.field_content NOT LIKE '%|avolume|bnc|2rdacarrier%'))
--ORDER BY r.record_num ASC;
ORDER BY v.field_content ASC;
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

