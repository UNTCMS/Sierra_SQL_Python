--
-- Bad 655 Genre Accessibility
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.varfield_type_code AS "Field Tag",
	v.marc_tag AS "MARC Tag",
	v.field_content AS "Content"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
WHERE
	v.marc_tag = '655'
	AND (
		(v.field_content SIMILAR TO '%hearing impaired%'
			AND v.field_content NOT LIKE '|aVideo recordings for the hearing impaired.|2lcgft%'
			AND v.field_content NOT LIKE '|aVideo recordings for the hearing impaired.|2fast%')
		OR (v.field_content SIMILAR TO '%visual disabilities%'
			AND v.field_content NOT LIKE '|aVideo recordings for people with visual disabilities.|2lcgft%'
			AND v.field_content NOT LIKE '|aVideo recordings for people with visual disabilities.|2fast%'
			AND v.field_content NOT LIKE '|aCartographic materials for people with visual disabilities.|2lcgft%'
			AND v.field_content NOT LIKE '|aCartographic materials for people with visual disabilities.|2fast%')
		)
ORDER BY v.field_content, v.marc_tag, r.record_num ASC;