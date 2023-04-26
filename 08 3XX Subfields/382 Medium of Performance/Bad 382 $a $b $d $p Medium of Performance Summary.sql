--
-- Bad 382 $a $b $d $p Medium of Performance Summary
--
SELECT
	s.marc_tag AS "MARC Field",
	s.tag AS "MARC Subfield",
	s.content AS "Subfield Content",
	COUNT (s.marc_tag) AS "Count"
FROM
	sierra_view.subfield s
	JOIN sierra_view.record_metadata r ON s.record_id = r.id
WHERE
	r.record_type_code = 'b'
	AND s.marc_tag = '382'
	AND s.tag IN ('a','b','d','p')
	AND (s.content SIMILAR TO '\d'
		 OR s.content SIMILAR TO '\d%'
		 OR s.content SIMILAR TO '%\d'
		 OR s.content SIMILAR TO '%\d%')
GROUP BY s.marc_tag, s.tag, s.content
ORDER BY s.marc_tag, s.tag, s.content ASC;