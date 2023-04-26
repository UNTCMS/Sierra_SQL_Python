--
-- Bad Leader/08 Summary
--
Select
	l.control_type_code AS "LDR/08",
	COUNT (l.control_type_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.control_type_code NOT IN (' ','a')
GROUP BY l.control_type_code
ORDER BY l.control_type_code ASC;