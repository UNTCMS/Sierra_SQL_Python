--
-- Bad 340 Physical Medium
--
--
-- Bad 340 $2 Source Code
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
		AND s.tag = '2'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'rda',
		'rdamat',
		'rdapm',
		'rdarr',
		'rdacc',
		'rdagen',
		'rdalay',
		'rdabf',
		'rdafs',
		'rdapo')
UNION
--
-- Bad 340 $a, $c, $e Material
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
UNION
--
-- Bad 340 $b Dimensions
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
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+\sin\.'
	AND s.content NOT SIMILAR TO '\d+\s\d/\d\sin\.'
	AND s.content NOT SIMILAR TO '\d/\d\sin\.'
	AND s.content NOT SIMILAR TO '\d+\scm'
	AND s.content NOT SIMILAR TO '\d+\smm'
	AND s.content NOT SIMILAR TO '\d+\sx\s\d+\scm'
	AND s.content NOT SIMILAR TO '\d+\sx\s\d+\sx\s\d+\scm'
UNION
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
UNION
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
		'160 rpm')
UNION
--
-- Bad 340 $g Colour Content
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
		AND s.tag = 'g'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'monochrome',
		'polychrome')
UNION
--
-- Bad 340 $j Generation
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
		AND s.tag = 'j'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'derivative master',
		'disc master',
		'duplicate negative',
		'first generation',
		'master',
		'master positive',
		'master tape',
		'mixed generation',
		'mother',
		'original',
		'original negative',
		'printing master',
		'reference print',
		'service copy',
		'stamper',
		'tape duplication master',
		'test pressing',
		'viewing copy',
-- Uncontrolled terms
		'mass-produced')
UNION
--
-- Bad 340 $k Layout
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
		AND s.tag = 'k'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'back to back',
		'bar by bar',
		'bar over bar',
		'both sides',
		'double line spacing',
		'double sided',
		'line by line',
		'line over line',
		'melody chord system',
		'open score',
		'outline',
		'paragraph',
		'section by section',
		'short form scoring',
		'single line',
		'single sided',
		'vertical score')
UNION
--
-- Bad 340 $m Bib Format
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
		AND s.tag = 'm'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'128mo',
		'12mo',
		'16mo',
		'18mo',
		'24mo',
		'32mo',
		'36mo',
		'48mo',
		'4to',
		'64mo',
		'72mo',
		'8vo',
		'96mo',
		'folio',
		'full-sheet')
UNION
--
-- Bad 340 $n Font Size
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
		AND s.tag = 'n'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'giant print',
		'jumbo braille',
		'large print')
UNION
--
-- Bad 340 $o Polarity
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
		AND s.tag = 'o'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'positive',
		'negative',
		'mixed polarity');