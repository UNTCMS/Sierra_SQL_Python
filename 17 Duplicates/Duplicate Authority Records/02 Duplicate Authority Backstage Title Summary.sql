--
-- Duplicate Authority Backstage Title Summary
--
SELECT
	lccn.index_entry AS "LCCN",
	title.index_entry AS "Title",
	COUNT (lccn.index_entry) AS "Count"
FROM
	sierra_view.phrase_entry lccn
	JOIN sierra_view.phrase_entry title ON title.record_id = lccn.record_id
		AND title.varfield_type_code = 't'
	JOIN sierra_view.authority_record a ON a.record_id = lccn.record_id
		AND a.code2 = '2'
WHERE
	lccn.index_tag = 'z'
GROUP BY lccn.index_entry, title.index_entry
HAVING COUNT (lccn.index_entry) > 1;
--ORDER BY COUNT (lccn.index_entry) DESC;
--LIMIT 100;