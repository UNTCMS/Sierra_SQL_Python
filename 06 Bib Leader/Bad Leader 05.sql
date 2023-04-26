--
-- Bad Leader 05
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.record_status_code AS "LDR/05"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.record_status_code NOT IN ('a','c','d','n','p');