--
-- Bad 588 Source of Description Summary
--
SELECT
	v.marc_tag AS "Field",
	v.marc_ind1 AS "1st Indicator",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
WHERE
	v.marc_tag = '588'
	AND (
		(v.marc_ind1 = ' '
			AND v.field_content NOT LIKE '%|aDescription%'
		 	AND v.field_content NOT LIKE '%|aFinal issue consulted%'
			AND v.field_content NOT LIKE '%|aLatest%')
		OR (v.marc_ind1 = '0'
		   	AND (v.field_content LIKE '%|aDescription%'
			OR v.field_content LIKE '%|aBased%'))
		OR (v.marc_ind1 = '1'
			AND v.field_content LIKE '%|aLatest%')
		)
GROUP BY v.marc_tag, v.marc_ind1, v.field_content
--ORDER BY v.marc_tag ASC;
ORDER BY v.marc_ind1, v.field_content ASC;
--ORDER BY COUNT (v.marc_tag) DESC;
