--
-- Bad Leader/05 Summary
--
Select
	l.record_status_code AS "LDR/05",
	COUNT (l.record_status_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.record_status_code NOT IN ('a','c','d','n','p')
GROUP BY l.record_status_code
ORDER BY l.record_status_code ASC;