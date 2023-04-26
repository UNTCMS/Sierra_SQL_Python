--
-- Bad Item Locations - Invalid Item Location none
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.location_code AS "Location"
FROM
	sierra_view.item_view i
WHERE
	i.location_code = 'none'
	AND i.icode2 != 'w'
ORDER BY i.location_code;