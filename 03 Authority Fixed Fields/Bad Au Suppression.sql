--
-- Bad Au Suppression
--
-- - = DISPLAY; n = SUPPRESS
--
SELECT
	a.record_type_code || a.record_num || 'a' AS "Authority Record",
	a.suppress_code AS "Suppress(A)"
FROM
	sierra_view.authority_view a
WHERE
	a.suppress_code NOT IN ('-','n')
ORDER BY a.suppress_code;