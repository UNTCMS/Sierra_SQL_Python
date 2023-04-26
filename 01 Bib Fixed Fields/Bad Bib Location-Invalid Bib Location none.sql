--
-- Bad Bib Locations - Invalid Bib Location none
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.location_code AS "Location"
FROM
	sierra_view.bib_record_location l
	JOIN sierra_view.bib_record r ON r.record_id = l.bib_record_id
	JOIN sierra_view.bib_view b ON b.id = r.id	
WHERE
	l.location_code = 'none'
	AND b.bcode1 != '0'
	AND b.bcode3 = '-'
ORDER BY b.record_num;