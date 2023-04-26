--
-- Bad Leader 08
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.control_type_code AS "LDR/08"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.control_type_code NOT IN (' ','a');