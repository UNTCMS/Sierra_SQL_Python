--
-- Bad 344 $c Playing Speed Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'15/16 ips',
		'1 7/8 ips',
		'1.4 m/s',
		'3 3/4 ips',
		'7 1/2 ips',
		'8 rpm',
		'15 ips',
		'16 rpm',
		'30 ips',
		'33 1/3 rpm',
		'45 rpm',
		'76.6 rpm',
		'78 rpm',
		'120 rpm',
		'160 rpm')
GROUP BY s.content
ORDER BY s.content ASC;