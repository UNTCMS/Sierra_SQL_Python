--
-- $4 Summary
--
SELECT
	s.content AS "$4 Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.subfield s
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
WHERE
	r.record_type_code = 'b'
	AND s.tag = '4'
GROUP BY s.content
ORDER BY s.content ASC;