--
-- Bad Bib Locations - Invalid Bib Locations
--
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