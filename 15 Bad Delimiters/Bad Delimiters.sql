--
-- Bad Delimiters
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
	AND v.field_content NOT SIMILAR TO '%U\$A%'
	AND v.field_content NOT SIMILAR TO '%Waste[wW]i\$e%'
	AND v.field_content NOT SIMILAR TO '%\$aga%'
	AND v.field_content NOT SIMILAR TO '%\$ign%'
	AND v.field_content NOT SIMILAR TO '%A\$AP%'
	AND v.field_content NOT SIMILAR TO '%\$+\s+[0-9]+%'
--	AND v.field_content NOT SIMILAR TO '%\$+\s+[0-9],[0-9]%'
--	AND v.field_content NOT SIMILAR TO '%\$+\s+[0-9][0-9],[0-9]%'
ORDER BY v.marc_tag, v.field_content, r.record_num ASC;