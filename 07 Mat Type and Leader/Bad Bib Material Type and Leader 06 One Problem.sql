--
-- Bad Material Type and Leader/06 One Problem
--
-- Use with the summary to find all records with one problem
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record",
	b.bcode2 AS "Mat Type",
	l.record_type_code AS "LDR/06",
	l.bib_level_code AS "LDR/07"
FROM
	sierra_view.bib_view b
	JOIN sierra_view.leader_field l ON l.record_id = b.id
WHERE 
	b.bcode1 NOT IN ('a','p','r','z')
	AND b.bcode3 = '-'
	AND b.bcode2 = 'y'
	AND l.record_type_code = 'a'
	AND l.bib_level_code IN ('i','m')
ORDER BY b.bcode2, l.record_type_code, b.record_num;