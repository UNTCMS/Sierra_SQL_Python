--
-- Bad Item Types
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.itype_code_num AS "ITYPE",
	t.name AS "Name"
FROM
	sierra_view.item_view i
	LEFT JOIN sierra_view.itype_property_myuser t ON i.itype_code_num = t.code
WHERE t.name IS NULL
ORDER BY i.itype_code_num;