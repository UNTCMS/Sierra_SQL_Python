--
-- Duplicate MARC Tag by Location
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v1.marc_tag AS "MARC Tag",
	v1.field_content AS "Field Content 1",
	v2.field_content AS "Field Content 2",
	l.location_code AS "Location"
FROM
	sierra_view.varfield v1
	JOIN sierra_view.varfield v2 ON v2.record_id = v1.record_id
	JOIN sierra_view.record_metadata r ON r.id = v1.record_id
		AND r.record_type_code = 'b'
--		AND r.record_num < '4000001'
--		AND r.record_num > '3999999'
	JOIN sierra_view.bib_record_location l ON l.bib_record_id = v1.record_id
	JOIN sierra_view.bib_record b ON b.record_id = v1.record_id
		AND b.bcode1 NOT IN ('0','s')
WHERE
	v2.id > v1.id
	AND v1.marc_tag = v2.marc_tag
	--Includes all non-repeatable MARC fields + 050, 090, 092 (excludes 930)
	AND v1.marc_tag IN ('001','003','005','008','010','018','036','038','040','042','044','045','050','066','090','092','100','110','111','130','240','243','245','254','256','263','306','310','357','507','514','841','842','844','882')
--	AND v1.marc_tag IN ('090')
ORDER BY v1.marc_tag;