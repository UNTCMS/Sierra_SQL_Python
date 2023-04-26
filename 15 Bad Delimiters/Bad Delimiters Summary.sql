--
-- Bad Delimiters Summary
--
-- Comments from Stacey:
-- Adding space after \$\D may help to eliminate false hits (except in 505)
-- Maybe \-\$\D to account for 505 fields
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
	v.marc_tag NOT IN ('037','040','066','350','880','935','959','962')
	AND (v.field_content LIKE '%ǂ%'
		OR v.field_content SIMILAR TO '%\$\D%')
	AND v.field_content NOT SIMILAR TO '%http[^\|\s]*\$%'
	AND v.field_content NOT SIMILAR TO '%\$\.\d\d'
	AND v.field_content NOT SIMILAR TO '%\$\.\d\d\s%'
	AND v.field_content NOT SIMILAR TO '%\$ense%'
	AND v.field_content NOT SIMILAR TO '%Bada\$\$%'
	AND v.field_content NOT SIMILAR TO '%[Ee]conomic\$%'
	AND v.field_content NOT SIMILAR TO '%[Gg]rant\$%'
	AND v.field_content NOT SIMILAR TO '%Schitt\$%'
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.marc_tag ASC;
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;