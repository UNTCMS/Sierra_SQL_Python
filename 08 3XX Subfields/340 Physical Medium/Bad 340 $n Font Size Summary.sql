--
-- Bad 340 $n Font Size Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'n'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'giant print',
		'jumbo braille',
		'large print')
GROUP BY s.content
ORDER BY s.content ASC;