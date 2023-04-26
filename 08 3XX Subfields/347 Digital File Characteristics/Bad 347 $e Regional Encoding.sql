--
-- Bad 347 $e Regional Encoding
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
		AND s.marc_tag = '347'
		AND s.tag = 'e'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'all regions',
		'region 1',
		'region 2',
		'region 3',
		'region 4',
		'region 5',
		'region 6',
		'region 7',
		'region 8',
		'region A',
		'region B',
		'region C (Blu-ray)',
		'region C (video game)',
		'region J',
		'region U/C',
-- Uncontrolled terms
		'USA')
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;