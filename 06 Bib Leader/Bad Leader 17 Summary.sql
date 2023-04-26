--
-- Bad Leader/17 Summary
--
Select
	l.encoding_level_code AS "LDR/17",
	COUNT (l.encoding_level_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.encoding_level_code NOT IN (' ','1','2','3','4','5','7','8','I','J','K','L','M','u','z')
GROUP BY l.encoding_level_code
ORDER BY l.encoding_level_code ASC;