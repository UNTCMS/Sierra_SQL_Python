--
-- Bad Item Status
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.item_status_code AS "Status"
FROM
	sierra_view.item_view i
	LEFT JOIN sierra_view.item_status_property_myuser m ON i.item_status_code = m.code
WHERE m.code IS NULL
ORDER BY i.item_status_code;