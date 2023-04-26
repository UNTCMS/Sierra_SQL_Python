--
-- Bad 345 Moving Image Characteristics
--
--
-- Bad 345 $2 Source Code
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
		AND s.marc_tag = '345'
		AND s.tag = '2'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'rda',
		'rdapf',
		'rdaar')
UNION
--
-- Bad 345 $a Presentation Format
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
		AND s.marc_tag = '345'
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'3D',
		'Cinemiracle',
		'Cinerama',
		'Circarama',
		'IMAX',
		'multiprojector',
		'multiscreen',
		'Panavision',
		'standard silent aperture',
		'standard sound aperture',
		'stereoscopic',
		'Techniscope')
UNION
--
-- Bad 345 $b Projection Speed
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
		AND s.marc_tag = '345'
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'24 fps')
UNION
--
-- Bad 345 $c Aspect Ratio Value
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
		AND s.marc_tag = '345'
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+:\d+'
	AND s.content NOT SIMILAR TO '\d+\.\d+:\d+'
UNION
--
-- Bad 345 $d Aspect Ratio Designation
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
		AND s.marc_tag = '345'
		AND s.tag = 'd'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'full screen',
		'mixed aspect ratio',
		'wide screen',
-- Uncontrolled terms
		'anamorphic wide screen');