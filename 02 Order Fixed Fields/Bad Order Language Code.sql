--
-- Bad Language Code
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.language_code AS "Language Code"
FROM
	sierra_view.order_view b
	LEFT JOIN sierra_view.language_property_myuser m ON b.language_code = m.code
WHERE m.code IS NULL
ORDER BY b.language_code;