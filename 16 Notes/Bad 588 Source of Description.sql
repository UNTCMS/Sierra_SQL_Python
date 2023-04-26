--
-- Bad 588 Source of Description
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.marc_tag AS "MARC Tag",
	v.marc_ind1 AS "1st Indicator",
	v.field_content AS "Content"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
WHERE
	v.marc_tag = '588'
	AND v.marc_ind1 = ' '
		AND v.field_content NOT LIKE '%|aDescription%'
		AND v.field_content NOT LIKE '%|aFinal issue consulted%'
		AND v.field_content NOT LIKE '%|aLatest%'
		AND v.field_content NOT LIKE '%|aTitle from%'
ORDER BY v.marc_ind1, v.field_content, r.record_num ASC;