--
-- Bad Leader/09 Summary
--
Select
	l.char_encoding_scheme_code AS "LDR/09",
	COUNT (l.char_encoding_scheme_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.char_encoding_scheme_code NOT IN (' ','a')
GROUP BY l.char_encoding_scheme_code
ORDER BY l.char_encoding_scheme_code ASC;