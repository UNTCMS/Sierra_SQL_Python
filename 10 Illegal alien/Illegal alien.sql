--
-- Illegal alien
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	b.bcode1 AS "Bib Type",
	b.bcode2 AS "Mat Type",
	v.varfield_type_code AS "Field Tag",
	v.marc_tag AS "MARC Tag",
	v.field_content AS "Content"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
	JOIN sierra_view.bib_record b ON b.record_id = v.record_id
		AND b.bcode3 = '-'
WHERE
	v.marc_tag = '650'
	AND v.field_content SIMILAR TO '%[Ii]llegal alien%'
ORDER BY v.field_content, v.marc_tag, r.record_num ASC;