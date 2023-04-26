--
-- Bad Bib Suppression
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.bcode3 AS "SUPPRESS(B)"
FROM
	sierra_view.bib_view b
	LEFT JOIN sierra_view.user_defined_bcode3_myuser m ON b.bcode3 = m.code
WHERE m.code IS NULL
ORDER BY b.bcode3;