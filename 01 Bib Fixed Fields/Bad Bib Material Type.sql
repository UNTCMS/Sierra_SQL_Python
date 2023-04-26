--
-- Bad Material Type
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.bcode2 AS "Mat Type"
FROM
	sierra_view.bib_view b
	LEFT JOIN sierra_view.user_defined_bcode2_myuser m ON b.bcode2 = m.code
WHERE m.code IS NULL
ORDER BY b.bcode2;