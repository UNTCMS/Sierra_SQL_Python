--
-- Duplicate Authority Series Summary
--
SELECT
	va.field_content AS "Content",
	COUNT (va.field_content) AS "Count"
FROM
	sierra_view.authority_record a
	JOIN sierra_view.varfield va ON va.record_id = a.record_id
		AND va.varfield_type_code = 'j'
GROUP BY va.field_content
HAVING COUNT (va.field_content) > 1;