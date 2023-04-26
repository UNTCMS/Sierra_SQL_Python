--
-- Bad 380 Form of Work
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
		AND v.marc_tag = '380'
WHERE
	r.record_type_code = 'b'
	AND v.field_content NOT SIMILAR TO '\|a[A-Z0-9][^\|]+[^\.]\|2lcgft'
	AND v.field_content NOT LIKE '|aAvant-garde (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aAve Maria (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aBig band music|2lcsh'
	AND v.field_content NOT LIKE '|aBlocks (Toys)|2lcsh'
	AND v.field_content NOT LIKE '|aCakewalk (Dance)|2lcsh'
	AND v.field_content NOT LIKE '|aCanons, fugues, etc.|2lcsh' -- OR USE |aCanons (Music)|2lcgft OR |aFugues|2lcgft
	AND v.field_content NOT SIMILAR TO '\|aChildren_s songs\|2lcsh'
	AND v.field_content NOT LIKE '|aChristian rock music|2lcsh'
	AND v.field_content NOT LIKE '|aComputer adventure games|2lcsh'
	AND v.field_content NOT LIKE '|aComputer music|2lcsh'
	AND v.field_content NOT LIKE '|aGames|2lcsh'
	AND v.field_content NOT LIKE '|aGloria in excelsis Deo (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aKyrie eleison (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aLEGO toys|2lcsh'
	AND v.field_content NOT LIKE '|aMagnificat (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aMonographic series|2lcsh'
	AND v.field_content NOT LIKE '|aSalve Regina (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aStabat Mater dolorosa (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aTabletop games|2gttg'
	AND v.field_content NOT LIKE '|aTe Deum laudamus (Music)|2lcsh'
	AND v.field_content NOT LIKE '|aVideo games|2olacvggt'
	AND v.field_content NOT LIKE '|aWorld music|2lcsh'
--ORDER BY r.record_num ASC;
ORDER BY v.field_content ASC;