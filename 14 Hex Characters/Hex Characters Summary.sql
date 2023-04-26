--
-- Hex Characters Summary
--
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield_view v
WHERE
	v.record_type_code = 'b'
	AND v.field_content SIMILAR TO '%&#%'
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;