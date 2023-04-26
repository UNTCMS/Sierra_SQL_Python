--
-- Bad 340 $o Polarity Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'o'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'positive',
		'negative',
		'mixed polarity')
GROUP BY s.content
ORDER BY s.content ASC;