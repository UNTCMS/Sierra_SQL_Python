--
-- Bad 340 $k Layout Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'k'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'back to back',
		'bar by bar',
		'bar over bar',
		'both sides',
		'double line spacing',
		'double sided',
		'line by line',
		'line over line',
		'melody chord system',
		'open score',
		'outline',
		'paragraph',
		'section by section',
		'short form scoring',
		'single line',
		'single sided',
		'vertical score')
GROUP BY s.content
ORDER BY s.content ASC;