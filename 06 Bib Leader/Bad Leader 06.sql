--
-- Bad Leader 06
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.record_type_code AS "LDR/06"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.record_type_code NOT IN ('a','c','d','e','f','g','i','j','k','m','o','p','r','t');