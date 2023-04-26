--
-- Bad 346 Video Characteristics Subfields
--
--
-- Bad 346 $2 Source Code Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '346'
		AND s.tag = '2'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'rda',
		'rdavf',
		'rdabs')
GROUP BY s.tag
UNION
--
-- Bad 346 $a Video Format Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '346'
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'8 mm',
		'Betacam',
		'Betacam SP',
		'Betamax',
		'CED',
		'D-2',
		'EIAJ',
		'Hi-8 mm',
		'laser optical',
		'M-II',
		'Quadruplex',
		'Super-VHS',
		'Type C',
		'U-matic',
		'VHS')
GROUP BY s.tag
UNION
--
-- Bad 346 $b Broadcast Standard Count
--
SELECT
	s.tag AS "Subfield",
	COUNT (s.tag) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '346'
		AND s.tag = 'b'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'HDTV',
		'NTSC',
		'PAL',
		'SECAM')
GROUP BY s.tag;