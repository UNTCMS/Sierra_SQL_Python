--
-- Hex Characters
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
	AND v.field_content SIMILAR TO '%&#%'
ORDER BY v.record_num, v.field_content ASC;