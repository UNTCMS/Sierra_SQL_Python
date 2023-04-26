--
-- Bad Gift Stats
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.icode1 AS "Gift Stats"
FROM
	sierra_view.item_view i
WHERE i.icode1 NOT IN ('0','6')
ORDER BY i.icode1;