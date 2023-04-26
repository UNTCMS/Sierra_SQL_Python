--
-- Bad Leader/19 Summary
--
Select
	l.multipart_level_code AS "LDR/19",
	COUNT (l.multipart_level_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.multipart_level_code NOT IN (' ','a','b','c')
GROUP BY l.multipart_level_code
ORDER BY l.multipart_level_code ASC;