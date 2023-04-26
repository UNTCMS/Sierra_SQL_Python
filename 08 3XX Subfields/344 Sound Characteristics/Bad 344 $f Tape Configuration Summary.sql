--
-- Bad 344 $f Tape Configuration Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'f'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
-- Uncontrolled terms
		'1 track',
		'2 track',
		'4 track',
		'8 track',
		'12 track',
		'16 track')
GROUP BY s.content
ORDER BY s.content ASC;