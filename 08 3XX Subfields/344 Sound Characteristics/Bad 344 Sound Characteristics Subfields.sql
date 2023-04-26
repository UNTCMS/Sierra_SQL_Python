--
-- Bad 344 Sound Characteristics Subfields
--
--
-- Bad 344 $2 Source Code Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = '2'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'rda',
		'rdatr',
		'rdarm',
		'rdagrp',
		'rdagw',
		'rdatc',
		'rdacpc',
		'rdaspc')
GROUP BY s.tag
UNION
--
-- Bad 344 $a Type of Recording Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'analog',
		'digital')
GROUP BY s.tag
UNION
--
-- Bad 344 $b Recording Medium Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'magnetic',
		'magneto-optical',
		'optical')
GROUP BY s.tag
UNION
--
-- Bad 344 $c Playing Speed Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'c'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
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
GROUP BY s.tag
UNION
--
-- Bad 344 $d Groove Pitch & Width Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'd'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'fine',
		'standard',
		'coarse groove',
		'microgroove')
GROUP BY s.tag
UNION
--
-- Bad 344 $e Track Configuration Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'e'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'centre track',
		'edge track')
GROUP BY s.tag
UNION
--
-- Bad 344 $f Tape Configuration Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'f'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'2 track',
		'4 track',
		'8 track',
		'12 track',
		'16 track')
GROUP BY s.tag
UNION
--
-- Bad 344 $g Configuration of Playback Channels Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'g'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'mono',
		'stereo',
		'quadraphonic',
		'surround')
GROUP BY s.tag
UNION
--
-- Bad 344 $h Special Playback Characteristics Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '344'
		AND s.tag = 'h'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'CCIR encoded',
		'CX encoded',
		'dbx encoded',
		'Dolby',
		'Dolby-A encoded',
		'Dolby-B encoded',
		'Dolby-C encoded',
		'LPCM',
		'NAB standard')
-- Uncontrolled terms
	AND s.content NOT IN ('2.0','5.1','Digital recording')
	AND s.content NOT SIMILAR TO '2.0 [Ss]tereo%'
	AND s.content NOT SIMILAR TO '5.1 [Ss]urround%'
	AND s.content NOT SIMILAR TO '%[Dd]olby%'
	AND s.content NOT SIMILAR TO '%DTS%'
	AND s.content NOT SIMILAR TO '%PCM%'
	AND s.content NOT SIMILAR TO '%SACD%'
GROUP BY s.tag;