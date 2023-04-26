--
-- Bad $4
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
--	s.marc_tag = '935'
	s.tag = '4'
	AND s.content NOT SIMILAR TO '[a-z][a-z][a-z]'
	AND s.content NOT LIKE 'http://id.loc.gov/vocabulary/relators/___'
	AND s.content NOT LIKE 'https://id.loc.gov/vocabulary/relators/___'
--	AND s.content SIMILAR TO '[a-z][a-z][a-z]\.'
--	AND s.content LIKE '%.%'
--	AND s.content LIKE '%,%'
--	s.content LIKE '%DELETE'
ORDER BY r.record_num ASC;