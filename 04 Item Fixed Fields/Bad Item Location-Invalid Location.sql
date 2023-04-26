--
-- Bad Item Locations - Invalid Locations
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.location_code AS "Location"
FROM
	sierra_view.item_view i
	LEFT JOIN sierra_view.location_myuser m ON i.location_code = m.code
WHERE 
	m.code IS NULL
	AND i.location_code != 'none'
ORDER BY i.location_code;