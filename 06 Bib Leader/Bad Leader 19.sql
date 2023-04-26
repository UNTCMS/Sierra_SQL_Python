--
-- Bad Leader 19
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.multipart_level_code AS "LDR/19"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.multipart_level_code NOT IN (' ','a','b','c');