--
-- Bad Leader 18
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.descriptive_cat_form_code AS "LDR/18"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
-- 'c' is a valid code, but should not be used in UNT records
-- 'L' is not a valid code, but it is used in Serials Solutions records
	l.descriptive_cat_form_code NOT IN (' ','a','i','L','n','u');