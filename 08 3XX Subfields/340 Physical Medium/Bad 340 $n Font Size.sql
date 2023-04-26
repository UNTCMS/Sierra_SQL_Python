--
-- Bad 340 $n Font Size
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
		AND s.tag = 'n'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'giant print',
		'jumbo braille',
		'large print')
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;