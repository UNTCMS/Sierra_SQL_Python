--
-- Bad 382 $e $n $r $s $t Number
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
		AND s.marc_tag = '382'
		AND s.tag IN ('e','n','r','s','t')
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+'
	AND s.content NOT SIMILAR TO '\d+-\d+'
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;