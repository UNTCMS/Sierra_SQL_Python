--
-- Bad 340 $a, $c, $e Material Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '340'
		AND s.tag IN ('a','c','e')
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'acetate',
		'acrylic paint',
		'aluminium',
		'Bristol board',
		'canvas',
		'cardboard',
		'ceramic',
		'chalk',
		'charcoal',
		'diacetate',
		'diazo emulsion',
		'dye',
		'glass',
		'gouache',
		'graphite',
		'hardboard',
		'illustration board',
		'ink',
		'ivory',
		'lacquer',
		'leather',
		'magnetic particles',
		'metal',
		'nitrate',
		'oil paint',
		'paper',
		'parchment',
		'pastel',
		'plaster',
		'plastic',
		'polyester',
		'porcelain',
		'rubber',
		'safety base',
		'shellac',
		'silver halide emulsion',
		'skin',
		'stone',
		'synthetic',
		'tempera',
		'textile',
		'triacetate',
		'vellum',
		'vesicular emulsion',
		'vinyl',
		'watercolour',
		'wax',
		'wood',
-- Uncontrolled terms
		'cardstock',
		'cloth')
GROUP BY s.content
ORDER BY s.content ASC;