--
-- Bad Leader Coding
--
Select
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	l.record_status_code AS "LDR/05",
	l.record_type_code AS "LDR/06",
	l.bib_level_code AS "LDR/07",
	l.control_type_code AS "LDR/08",
	l.char_encoding_scheme_code AS "LDR/09",
	l.encoding_level_code AS "LDR/17",
	l.descriptive_cat_form_code AS "LDR/18",
	l.multipart_level_code AS "LDR/19"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE
	l.record_status_code NOT IN ('a','c','d','n','p')
	OR l.record_type_code NOT IN ('a','c','d','e','f','g','i','j','k','m','o','p','r','t')
	OR l.bib_level_code NOT IN ('a','b','c','d','i','m','s')
	OR l.control_type_code NOT IN (' ','a')
	OR l.char_encoding_scheme_code NOT IN (' ','a')
	OR l.encoding_level_code NOT IN (' ','1','2','3','4','5','7','8','I','J','K','L','M','u','z')
	OR l.descriptive_cat_form_code NOT IN (' ','a','i','L','n','u')
	OR l.multipart_level_code NOT IN (' ','a','b','c');