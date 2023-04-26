--
-- Bad 347 $d Resolution Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '347'
		AND s.tag = 'd'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+\spixels'
	AND s.content NOT SIMILAR TO '\d+x\d+\spixels'
	AND s.content NOT IN (
		'1080p',
		'1080p high definition',
		'1920x1080p',
		'480i')
GROUP BY s.content
ORDER BY s.content ASC;