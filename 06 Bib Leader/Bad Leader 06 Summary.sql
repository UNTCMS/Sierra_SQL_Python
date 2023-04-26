--
-- Bad Leader/06 Summary
--
SELECT
	l.record_type_code AS "LDR/06",
	COUNT (l.record_type_code) As "Count"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.record_type_code NOT IN ('a','c','d','e','f','g','i','j','k','m','o','p','r','t')
GROUP BY l.record_type_code
ORDER BY l.record_type_code ASC;