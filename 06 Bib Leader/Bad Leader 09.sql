--
-- Bad Leader 09
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.char_encoding_scheme_code AS "LDR/09"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.char_encoding_scheme_code NOT IN (' ','a');