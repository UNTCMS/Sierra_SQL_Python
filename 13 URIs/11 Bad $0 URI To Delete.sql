--
-- Bad $0 URI To Delete
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Bib Record",
	s.marc_tag AS "Field",
	s.tag AS "Subfield",
	s.content AS "Value"
FROM
	sierra_view.subfield s
	LEFT JOIN sierra_view.varfield v ON v.record_id = s.record_id
		AND v.marc_tag = '937'
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
		AND r.record_type_code = 'b'
WHERE
	s.marc_tag NOT IN ('033','251','385','753','856','880')
	AND s.tag = '0'
	AND s.content LIKE 'http%'
	AND (v.field_content IS NULL
		OR v.field_content NOT LIKE '|aBACKSTAGE%|c%')
ORDER BY r.record_num ASC;