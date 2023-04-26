--
-- Bad $1 URI To Delete
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Bib Record",
	s.marc_tag AS "Field",
	s.tag AS "Subfield",
	s.content AS "Value"
FROM
	sierra_view.subfield s
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
		AND r.record_type_code = 'b'
WHERE
	s.marc_tag NOT IN ('251','388','758')
	AND s.tag = '1'
	AND s.content LIKE 'http%'
ORDER BY r.record_num ASC;