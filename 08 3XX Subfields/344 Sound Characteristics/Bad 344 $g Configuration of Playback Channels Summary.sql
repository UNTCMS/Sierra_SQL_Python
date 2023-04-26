--
-- Bad 344 $g Configuration of Playback Channels Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'g'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'mono',
		'stereo',
		'quadraphonic',
		'surround')
GROUP BY s.content
ORDER BY s.content ASC;