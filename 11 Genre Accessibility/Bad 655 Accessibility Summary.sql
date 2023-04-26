--
-- Bad 655 Genre Accessibility Summary
--
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
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
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.marc_tag ASC;
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;
