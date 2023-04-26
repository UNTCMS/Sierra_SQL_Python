--
-- Bad 347 Digital File Characteristics
--
--
-- Bad 347 $2 Source Code
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
		AND s.tag = '2'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'rda',
		'rdaft',
		'rdare')
UNION
--
-- Bad 347 $a File Type
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
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'audio file',
		'data file',
		'image file',
		'program file',
		'text file',
		'video file')
UNION
--
-- Bad 347 $b Encoding Format
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
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
-- Audio encoding formats
		'AAC',
		'ACELP',
		'AIFF',
		'Blu-ray audio',
		'CD audio',
		'DAISY',
		'DSD',
		'DVD audio',
		'HDCD',
		'HFPA',
		'MP3',
		'RealAudio',
		'SACD',
		'WAV',
-- Data encoding formats
		'Access',
		'Excel',
		'Lotus',
		'Max patch (7.2.1)',
		'XML',
-- Image encoding formats
		'BMP',
		'GIF',
		'JPEG',
		'JPEG2000',
		'PNG',
		'TIFF',
-- Spatial data encoding formats
		'ArcInfo',
		'BIL',
		'BSQ',
		'CAD',
		'DEM',
		'E00',
		'MID/MIF',
-- Text encoding formats
		'ASCII',
		'HTML',
		'Megadots',
		'MS Word',
		'PDF',
		'RTF',
		'SGML',
		'TeX',
		'Word Perfect',
		'XHTML',
		'XML',
-- Video encoding formats
		'Blu-ray',
		'DVD video',
		'Flash',
		'HD-DVD',
		'M4V',
		'MPEG-4',
		'MPG',
		'QuickTime',
		'RealVideo',
		'SVCD',
		'VCD',
		'Windows media')
UNION
--
-- Bad 347 $c File Size
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
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+\s[GKM]B'
	AND s.content NOT SIMILAR TO '\d+\.\d+\s[GKM]B'
UNION
--
-- Bad 347 $d Resolution
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
		AND s.tag = 'd'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT SIMILAR TO '\d+\spixels'
	AND s.content NOT IN (
		'1080p',
		'1080p high definition',
		'1920x1080p',
		'480i')
UNION
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
UNION
--
-- Bad 347 $f Encoded Bitrate
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
		AND s.tag = 'f'
WHERE
	r.record_type_code = 'b';
--	AND s.content NOT IN ('')