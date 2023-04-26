--
-- Bad OPAC Message
--
SELECT
	i.record_type_code || i.record_num || 'a' AS "Item Record",
	i.opac_message_code AS "OPAC Message"
FROM
	sierra_view.item_view i
WHERE i.opac_message_code NOT IN ('-','a','r')
ORDER BY i.opac_message_code;