--
-- Bad 340 $f Reduction Ratio
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	s.marc_tag AS "MARC Tag",
	s.marc_ind1 AS "Ind1",
	s.marc_ind2 AS "Ind2",
	s.tag AS "Subfield",
	s.content AS "Content"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag = 'f'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'high reduction',
		'low reduction',
		'normal reduction',
		'ultra high reduction',
		'very high reduction',
-- Uncontrolled terms
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
		'160 rpm',
		'24 fps',
		'1800 rpm')
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;