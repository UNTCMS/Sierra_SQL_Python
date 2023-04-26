--
-- Bad Analytical Titles
--
-- Run after: Bad Analytical Titles Missing Subfield t
--
-- To correct errors, in Global Update:
-- 		1. Add to end of variable length field |z2 of 700/710/711 Ind2 2 data |t or |k
--		2. Change variable length field 700/710/711 data |z2|z2 to |z2
-- 		3. Change variable length field 700/710/711 Ind2 from 2 to blank
--		4. Change variable length field 700/710/711 Ind2 from blank to 2 and data |z2 to blank
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
	AND v.marc_tag IN ('700','710','711')
	AND v.marc_ind2 = '2'
	AND v.field_content NOT LIKE '%|t%'
	AND v.field_content NOT LIKE '%|k%'
ORDER BY v.field_content, v.record_num ASC;