--
-- Bad 347 $b Encoding Format Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
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
		'FLV',
		'HD-DVD',
		'Ultra HD Blu-ray',
		'M4V',
		'MOV',
		'MPEG-4',
		'MPG',
		'QuickTime',
		'RealVideo',
		'SVCD',
		'VCD',
		'Windows media',
		'WMV')
GROUP BY s.content
ORDER BY s.content ASC;