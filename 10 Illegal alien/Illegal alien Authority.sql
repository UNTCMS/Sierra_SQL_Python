--
-- Illegal alien Authority
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.varfield_type_code AS "Field Tag",
	v.marc_tag AS "MARC Tag",
	v.field_content AS "Content"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'a'
	JOIN sierra_view.authority_record a ON a.record_id = v.record_id
		AND a.suppress_code = '-'
WHERE
	v.marc_tag = '150'
--	v.marc_tag IN ('150','550')
	AND v.field_content SIMILAR TO '%[Ii]llegal alien%'
ORDER BY v.field_content, v.marc_tag, r.record_num ASC;