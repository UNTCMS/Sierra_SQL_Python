--
-- Bad Leader 07
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.bib_level_code AS "LDR/07"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.bib_level_code NOT IN ('a','b','c','d','i','m','s');