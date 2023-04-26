--
-- Bad Analytical Titles Container of
--
SELECT
	v.record_type_code || v.record_num || 'a' AS "Bib Record",
	v.marc_tag AS "Field",
	v.field_content AS "Value"
FROM
	sierra_view.varfield_view v
	JOIN sierra_view.bib_record b ON b.record_id = v.record_id
		AND b.bcode3 = '-'
WHERE
	v.record_type_code = 'b'
	AND v.marc_tag IN ('700','710','711','730')
	AND v.marc_ind2 != '2'
	AND (v.field_content LIKE '%|iContainer%'
		 OR v.field_content LIKE '%|iContains%')
ORDER BY v.field_content, v.record_num ASC;