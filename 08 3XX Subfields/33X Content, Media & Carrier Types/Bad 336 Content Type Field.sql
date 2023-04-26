--
-- Bad 336 Content Type
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.marc_tag AS "MARC Tag",
	v.marc_ind1 AS "Ind1",
	v.marc_ind2 AS "Ind2",
	v.field_content AS "Content"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.varfield v ON v.record_id = r.id
		AND v.marc_tag = '336'
WHERE
	r.record_type_code = 'b'
	AND (v.marc_ind1 != ' '
		OR v.marc_ind2 != ' '
		OR (v.field_content NOT LIKE '%|acartographic dataset|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic image|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic moving image|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic tactile image|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic tactile three-dimensional form|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic three-dimensional form|2rdacontent%'
			AND v.field_content NOT LIKE '%|acomputer dataset|2rdacontent%'
			AND v.field_content NOT LIKE '%|acomputer program|2rdacontent%'
			AND v.field_content NOT LIKE '%|anotated movement|2rdacontent%'
			AND v.field_content NOT LIKE '%|anotated music|2rdacontent%'
			AND v.field_content NOT LIKE '%|aperformed movement|2rdacontent%'
			AND v.field_content NOT LIKE '%|aperformed music|2rdacontent%'
			AND v.field_content NOT LIKE '%|asounds|2rdacontent%'
			AND v.field_content NOT LIKE '%|aspoken word|2rdacontent%'
			AND v.field_content NOT LIKE '%|astill image|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile image|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile notated movement|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile notated music|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile text|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile three-dimensional form|2rdacontent%'
			AND v.field_content NOT LIKE '%|atext|2rdacontent%'
			AND v.field_content NOT LIKE '%|athree-dimensional form|2rdacontent%'
			AND v.field_content NOT LIKE '%|athree-dimensional moving image|2rdacontent%'
			AND v.field_content NOT LIKE '%|atwo-dimensional moving image|2rdacontent%'
			AND v.field_content NOT LIKE '%|aother|2rdacontent%'
			AND v.field_content NOT LIKE '%|aunspecified|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic dataset|bcrd|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic image|bcri|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic moving image|bcrm|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic tactile image|bcrt|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic tactile three-dimensional form|bcrn|2rdacontent%'
			AND v.field_content NOT LIKE '%|acartographic three-dimensional form|bcrf|2rdacontent%'
			AND v.field_content NOT LIKE '%|acomputer dataset|bcod|2rdacontent%'
			AND v.field_content NOT LIKE '%|acomputer program|bcop|2rdacontent%'
			AND v.field_content NOT LIKE '%|anotated movement|bntv|2rdacontent%'
			AND v.field_content NOT LIKE '%|anotated music|bntm|2rdacontent%'
			AND v.field_content NOT LIKE '%|aperformed music|bprm|2rdacontent%'
			AND v.field_content NOT LIKE '%|asounds|bsnd|2rdacontent%'
			AND v.field_content NOT LIKE '%|aspoken word|bspw|2rdacontent%'
			AND v.field_content NOT LIKE '%|astill image|bsti|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile image|btci|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile notated movement|btcm|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile notated music|btcn|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile text|btct|2rdacontent%'
			AND v.field_content NOT LIKE '%|atactile three-dimensional form|btcf|2rdacontent%'
			AND v.field_content NOT LIKE '%|atext|btxt|2rdacontent%'
			AND v.field_content NOT LIKE '%|athree-dimensional form|btdf|2rdacontent%'
			AND v.field_content NOT LIKE '%|athree-dimensional moving image|btdm|2rdacontent%'
			AND v.field_content NOT LIKE '%|atwo-dimensional moving image|btdi|2rdacontent%'
			AND v.field_content NOT LIKE '%|aother|bxxx|2rdacontent%'
			AND v.field_content NOT LIKE '%|aunspecified|bzzz|2rdacontent%'))
--ORDER BY r.record_num ASC;
ORDER BY v.field_content ASC;