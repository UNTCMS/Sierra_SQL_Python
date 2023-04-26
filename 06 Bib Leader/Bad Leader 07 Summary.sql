--
-- Bad Leader/07 Summary
--
Select
	l.bib_level_code AS "LDR/07",
	COUNT (l.bib_level_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.bib_level_code NOT IN ('a','b','c','d','i','m','s')
GROUP BY l.bib_level_code
ORDER BY l.bib_level_code ASC;