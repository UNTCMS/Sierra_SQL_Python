--
-- Bad $0 $1 URI Summary
--
SELECT
	s.marc_tag AS "MARC Field",
	s.tag AS "Subfield",
	s.content AS "$0/$1 Content",
	COUNT (s.marc_tag) AS "Count"
FROM
	sierra_view.subfield s
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
WHERE
	r.record_type_code = 'b'
	AND s.tag IN ('0','1')
	AND s.content NOT LIKE 'http://id.loc.gov%'
	AND s.content NOT LIKE 'http://rdaregistry.info%'
	AND s.content NOT LIKE 'http://vocab.getty.edu/aat%'
	AND s.content NOT LIKE '(OCoLC)fst%'
GROUP BY s.marc_tag, s.tag, s.content
ORDER BY s.marc_tag, s.tag, s.content ASC;