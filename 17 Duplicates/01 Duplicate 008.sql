--
-- Duplicate 008 Field
--
SELECT
	b.record_type_code || b.record_num || 'a' AS "Bib Record"
FROM
	sierra_view.control_field c1
	JOIN sierra_view.control_field c2 ON c2.record_id = c1.record_id
	JOIN sierra_view.bib_view b ON b.id = c1.record_id
WHERE
	c2.id > c1.id
	AND c1.control_num = '8'
	AND c2.control_num = '8'
ORDER BY b.record_num
LIMIT 100;