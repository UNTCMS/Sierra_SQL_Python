--
-- Bad 344 $h Special Playback Characteristics
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
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;