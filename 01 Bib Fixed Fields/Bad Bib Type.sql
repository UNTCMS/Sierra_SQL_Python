--
-- Bad Bib Type
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.bcode1 AS "Bib Type"
FROM
	sierra_view.bib_view b
	LEFT JOIN sierra_view.user_defined_bcode1_myuser m ON b.bcode1 = m.code
WHERE m.code IS NULL
ORDER BY b.bcode1;