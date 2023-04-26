--
-- Bad LC Call Numbers Summary
--
SELECT
	v.marc_tag AS "Field",
	v.field_content AS "Value",
	COUNT (v.marc_tag) AS "Count"
FROM
	sierra_view.varfield_view v
WHERE
	v.record_type_code = 'b'
	AND v.marc_tag IN ('050','090','930')
	AND (
		v.field_content NOT SIMILAR TO '\|a[A-Z]%'
		OR (v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9]%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z]')
		OR (v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9][A-Z0-9\|\.]%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z]'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9]'
			AND v.field_content NOT SIMILAR TO '\|aAB%Test')
		OR (v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9][A-Z0-9][0-9\|\.]%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z]'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9]'
			AND v.field_content NOT SIMILAR TO '\|aAB%Test'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][A-Z0-9][A-Z0-9]'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][0-9]\|b%'
			AND v.field_content NOT SIMILAR TO '\|a[A-Z][0-9]\.[A-Z0-9]%'
			AND v.field_content NOT SIMILAR TO '\|aPOS%'
			AND v.field_content NOT SIMILAR TO '\|aJ65a%'
			AND v.field_content NOT SIMILAR TO '\|aP23 19[67][13]%')
		)
--	AND v.field_content NOT LIKE '%|t%|k%'
GROUP BY v.marc_tag, v.field_content
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.marc_tag) DESC;