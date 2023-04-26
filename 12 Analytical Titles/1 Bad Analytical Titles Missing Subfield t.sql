--
-- Bad Analytical Titles Missing Subfield t
--
-- Run before: Bad Analytical Titles
--
SELECT
	v.record_type_code || v.record_num || 'a' AS "Bib Record",
	v.marc_tag AS "Field",
	v.field_content AS "Value"
FROM
	sierra_view.varfield_view v
WHERE
	v.record_type_code = 'b'
	AND v.marc_tag IN ('700','710','711')
	AND v.marc_ind2 = '2'
	AND v.field_content NOT LIKE '%|t%'
	AND v.field_content NOT LIKE '%|k%'
ORDER BY v.record_num ASC;