--
-- Illegal alien Authority Summary
--
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'a'
	JOIN sierra_view.authority_record a ON a.record_id = v.record_id
		AND a.suppress_code = '-'
WHERE
	v.marc_tag = '150'
	AND v.field_content SIMILAR TO '%[Ii]llegal alien%'
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.marc_tag ASC;
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;
