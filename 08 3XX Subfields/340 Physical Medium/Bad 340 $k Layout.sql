--
-- Bad 340 $k Layout
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	s.marc_tag AS "MARC Tag",
	s.marc_ind1 AS "Ind1",
	s.marc_ind2 AS "Ind2",
	s.tag AS "Subfield",
	s.content AS "Content"
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
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;