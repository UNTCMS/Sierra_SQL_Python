--
-- Bad 345 $d Aspect Ratio Designation Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '345'
		AND s.tag = 'd'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'full screen',
		'mixed aspect ratio',
		'wide screen',
-- Uncontrolled terms
		'anamorphic wide screen')
GROUP BY s.content
ORDER BY s.content ASC;