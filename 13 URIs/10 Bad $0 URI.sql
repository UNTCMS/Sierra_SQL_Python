--
-- Bad $0 URI
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
	s.tag = '0'
	AND s.content NOT LIKE 'http%'
	AND s.content NOT LIKE '(OCoLC)fst%'
ORDER BY r.record_num ASC;