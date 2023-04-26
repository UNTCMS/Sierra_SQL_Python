--
-- Bad Au Type
--
-- a = NAME/TITLE; d = SUBJECT/GENRE; j = SERIES TITLE
--
SELECT
	a.record_type_code || a.record_num || 'a' AS "Authority Record",
	a.code1 AS "Au Type"
FROM
	sierra_view.authority_view a
WHERE
	a.code1 NOT IN ('a','d','j')
ORDER BY a.code1;