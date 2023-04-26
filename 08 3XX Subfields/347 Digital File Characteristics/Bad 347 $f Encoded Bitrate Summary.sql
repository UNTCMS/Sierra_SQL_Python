--
-- Bad 347 $f Encoding Bitrate Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '347'
		AND s.tag = 'f'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+\sKbps'
GROUP BY s.content
ORDER BY s.content ASC;