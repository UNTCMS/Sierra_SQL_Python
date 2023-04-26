--
-- Bad 344 $b Recording Medium Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'magnetic',
		'magneto-optical',
		'optical',
-- Uncontrolled terms
		'non-volatile flash memory')
GROUP BY s.content
ORDER BY s.content ASC;