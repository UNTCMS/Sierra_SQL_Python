import psycopg2
import csv
from postgresql_password import postgresql_password

report = 'I:/SQL Queries/Code verification working files/4_5-BadItemLocations-InvalidItemLocation.csv'

query = """
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.location_code AS "Location"
FROM
	sierra_view.item_view i
WHERE
	i.location_code NOT IN ('czm','czmrf','czmrs','czwww','d','dcare','dfic','djuv','dmed','dref','dresv','fip','fl','flrs','flmak','flind','flix','frsco','gwww','jlf','kmats','kmatt','kpacs','kpeb','law','lawcl','lawh','lawrf','lawrs','lawtx','lawww','lwww','mwww','none','pwww','r','rfbks','rmak','rst','rzzpb','rzzrf','rzzrs','s','s1fdc','s1ndc','scbg','sckit','scmc','sd1dc','sdai','sdbi','sdcd','sdmc','sdmp','sdnb','sdndc','sdov','sdtov','sdtx','sdus','sdvf','sdzmr','sdzrf','sdzrs','sdzsd','sfin','sjbg','sjuv','smls','spe','swr','szmp','szzov','szzrf','szzrs','szzsd','test','w1fdc','w1grs','w1gwt','w1ia','w1idl','w1ind','w1mak','w1mdc','w1mls','w1ndc','w1prs','w1upr','w2awt','w2lan','w3','w3big','w3grn','w3lab','w3mfa','w3per','w433a','w4422','w4438','w4fil','w4lok','w4m','w4mai','w4mau','w4mav','w4mbg','w4mfb','w4mft','w4mla','w4moc','w4mov','w4mr1','w4mr2','w4mr3','w4mrb','w4mrf','w4mrs','w4mrx','w4mts','w4mwf','w4mwr','w4spc','w4spe','w4srf','wex','wgrc','wlbig','wlper','x','xcmc','xdmic','xdmp','xdoc','xjuv','xmau','xmed','xmic','xmus','xprsv','xspc','xspe','xts')
ORDER BY i.location_code;
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

