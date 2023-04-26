--
-- Bad 346 $a Video Format Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '346'
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'8 mm',
		'Betacam',
		'Betacam SP',
		'Betamax',
		'CED',
		'D-2',
		'EIAJ',
		'Hi-8 mm',
		'laser optical',
		'M-II',
		'Quadruplex',
		'Super-VHS',
		'Type C',
		'U-matic',
		'VHS')
GROUP BY s.content
ORDER BY s.content ASC;