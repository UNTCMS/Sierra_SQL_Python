--
-- Bad Item Message
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.item_message_code AS "IMessage"
FROM
	sierra_view.item_view i
WHERE i.item_message_code NOT IN ('-','c','m','x')
ORDER BY i.item_message_code;