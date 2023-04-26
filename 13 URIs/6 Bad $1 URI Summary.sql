--
-- Bad $1 URI Summary
--
SELECT
	s.content AS "$1 Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.subfield s
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
		AND r.record_type_code = 'b'
WHERE
	s.tag = '1'
--	AND s.content NOT LIKE 'http%'
GROUP BY s.content
ORDER BY s.content ASC;