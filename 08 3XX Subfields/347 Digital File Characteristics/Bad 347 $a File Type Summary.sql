--
-- Bad 347 $a File Type Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '347'
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'audio file',
		'data file',
		'image file',
		'program file',
		'text file',
		'video file')
GROUP BY s.content
ORDER BY s.content ASC;