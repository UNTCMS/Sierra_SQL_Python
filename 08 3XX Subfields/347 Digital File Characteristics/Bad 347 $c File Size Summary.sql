--
-- Bad 347 $c File Size Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '347'
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+\sbytes'
	AND s.content NOT SIMILAR TO '\d{1,3}\,\d{3}\sbytes'
	AND s.content NOT SIMILAR TO '\d+\s[GKM]B'
	AND s.content NOT SIMILAR TO '\d+\.\d+\s[GKM]B'
	AND s.content NOT SIMILAR TO '\d{1,3}\,\d{3}\s[GKM]B'
GROUP BY s.content
ORDER BY s.content ASC;