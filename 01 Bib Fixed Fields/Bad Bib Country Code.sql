﻿--
-- Bad Country Code
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.country_code AS "Country Code"
FROM
	sierra_view.bib_view b
	LEFT JOIN sierra_view.country_property_myuser m ON b.country_code = m.code
WHERE m.code IS NULL
ORDER BY b.country_code;