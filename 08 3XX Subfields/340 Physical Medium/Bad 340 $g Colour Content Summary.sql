--
-- Bad 340 $g Colour Content Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'g'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'monochrome',
		'polychrome')
GROUP BY s.content
ORDER BY s.content ASC;