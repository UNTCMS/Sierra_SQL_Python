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
	AND s.content NOT SIMILAR TO '\d+/\d+\sin\.'
	AND s.content NOT SIMILAR TO '\d+\s\d+/\d+\sin\.'
	AND s.content NOT SIMILAR TO '\d+\sx\s\d+\sin\.'
	AND s.content NOT SIMILAR TO '\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\sin\.'
	AND s.content NOT SIMILAR TO '\d+\s\d+/\d+\sin\.\sx\s\d+\s\d+/\d+\sin\.'
	AND s.content NOT SIMILAR TO '\d+\s[cm]m'
	AND s.content NOT SIMILAR TO '\d+\sx\s\d+\s[cm]m'
	AND s.content NOT SIMILAR TO '\d+\sx\s\d+\sx\s\d+\s[cm]m'
	AND s.content NOT SIMILAR TO '\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\sx\s\d+\s[cm]m'
	AND s.content NOT SIMILAR TO '\d+\-\d+\s[cm]m'
--ORDER BY r.record_num ASC;
ORDER BY s.content ASC;