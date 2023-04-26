--
-- Bad 340 $j Generation Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'j'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'derivative master',
		'disc master',
		'duplicate negative',
		'first generation',
		'master',
		'master positive',
		'master tape',
		'mixed generation',
		'mother',
		'original',
		'original negative',
		'printing master',
		'reference print',
		'service copy',
		'stamper',
		'tape duplication master',
		'test pressing',
		'viewing copy',
-- Uncontrolled terms
		'instantaneous',
		'mass-produced')
GROUP BY s.content
ORDER BY s.content ASC;