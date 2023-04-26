--
-- Bad 340 $m Bib Format Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'm'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'128mo',
		'12mo',
		'16mo',
		'18mo',
		'24mo',
		'32mo',
		'36mo',
		'48mo',
		'4to',
		'64mo',
		'72mo',
		'8vo',
		'96mo',
		'folio',
		'full-sheet')
GROUP BY s.content
ORDER BY s.content ASC;