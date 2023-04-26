--
-- Duplicate Authority Genre 1XX Matches 4XX to Delete
--
SELECT DISTINCT ON (va.field_content)
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	a.code1 AS "Au Type",
	a.code2 AS "Au Source",
	va.varfield_type_code AS "Field Type",
	va.marc_tag AS "MARC Tag",
	va.field_content AS "Content"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.authority_record a ON a.record_id = r.id
	JOIN sierra_view.varfield va ON va.record_id = r.id
		AND va.varfield_type_code = 'h'
WHERE
	r.record_type_code = 'a'
	AND va.field_content IN (
		SELECT
			va.field_content AS "Content"
		FROM
			sierra_view.authority_record a
			JOIN sierra_view.varfield va ON va.record_id = a.record_id
				AND va.varfield_type_code = 'i'
		GROUP BY va.field_content
		)
	AND a.code2 NOT IN ('2','5')
ORDER BY va.field_content ASC, a.code2 DESC;