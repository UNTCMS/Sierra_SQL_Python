--
-- Bad 345 Moving Image Characteristics Summary
--
--
-- Bad 345 $2 Source Code Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
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
GROUP BY s.content
UNION
--
-- Bad 345 $a Presentation Format Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
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
GROUP BY s.content
UNION
--
-- Bad 345 $b Projection Speed Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '345'
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'24 fps')
GROUP BY s.content
UNION
--
-- Bad 345 $c Aspect Ratio Value Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '345'
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+:\d+'
	AND s.content NOT SIMILAR TO '\d+\.\d+:\d+'
GROUP BY s.content
UNION
--
-- Bad 345 $d Aspect Ratio Designation Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
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
		'anamorphic wide screen')
GROUP BY s.content;