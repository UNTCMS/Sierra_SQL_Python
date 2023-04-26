--
-- Bad Leader 17
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.encoding_level_code AS "LDR/17"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.encoding_level_code NOT IN (' ','1','2','3','4','5','7','8','I','J','K','L','M','u','z');