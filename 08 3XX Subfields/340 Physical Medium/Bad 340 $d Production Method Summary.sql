--
-- Bad 340 $d Production Method Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
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
GROUP BY s.content
ORDER BY s.content ASC;