--
-- Bad 340 $d Production Method
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
		AND s.tag = 'd'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'blueline process',
		'blueprint process',
		'burning',
		'collotype',
		'daguerreotype process',
		'embossing',
		'engraving',
		'etching',
		'inscribing',
		'lithography',
		'photocopying',
		'photoengraving',
		'photogravure process',
		'printing',
		'solid dot',
		'stamping',
		'swell paper',
		'thermoform',
		'white print process',
		'woodcut making',
-- Uncontrolled terms
		'handwritten',
		'holograph',
		'manuscript',
		'pressed',
		'typescript')
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;