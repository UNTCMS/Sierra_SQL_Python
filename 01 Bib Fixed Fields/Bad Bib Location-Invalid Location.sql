--
-- Bad Bib Locations - Invalid Locations
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.location_code AS "Location"
FROM
	sierra_view.bib_record_location l
	LEFT JOIN sierra_view.location_myuser m ON l.location_code = m.code
	JOIN sierra_view.bib_record r ON r.record_id = l.bib_record_id
	JOIN sierra_view.bib_view b ON b.id = r.id
WHERE 
	m.code IS NULL
	AND l.location_code NOT IN ('multi','none')
ORDER BY l.location_code;