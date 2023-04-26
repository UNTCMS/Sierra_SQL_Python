--
-- Bad 340 $j Generation
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
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;