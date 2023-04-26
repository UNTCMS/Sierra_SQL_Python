--
-- Bad 345 $c Aspect Ratio Value Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '345'
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+:\d+'
	AND s.content NOT SIMILAR TO '\d+\.\d+:\d+'
GROUP BY s.content
ORDER BY s.content ASC;