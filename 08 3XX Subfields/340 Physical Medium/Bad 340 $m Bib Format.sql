--
-- Bad 340 $m Bib Format
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
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;