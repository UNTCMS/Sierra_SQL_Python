--
-- Bad Item Suppression
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.icode2 AS "SUPPRESS(I)"
FROM
	sierra_view.item_view i
	LEFT JOIN sierra_view.user_defined_icode2_myuser m ON i.icode2 = m.code
WHERE m.code IS NULL
ORDER BY i.icode2;