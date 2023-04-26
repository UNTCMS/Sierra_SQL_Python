--
-- Bad Au Source
--
-- 1 = OCLC; 2 = BACKSTAGE; 4 = LOCAL INPUT; 5 = UNT LOCAL
--
SELECT
	a.record_type_code || a.record_num || 'a' AS "Authority Record",
	a.code2 AS "Au Source"
FROM
	sierra_view.authority_view a
WHERE
	a.code2 NOT IN ('1','2','4','5')
ORDER BY a.code2;