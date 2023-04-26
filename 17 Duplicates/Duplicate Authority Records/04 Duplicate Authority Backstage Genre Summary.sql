--
-- Duplicate Authority Backstage Genre Summary
--
SELECT
	lccn.index_entry AS "LCCN",
	genre.index_entry AS "Genre",
	COUNT (lccn.index_entry) AS "Count"
FROM
	sierra_view.phrase_entry lccn
	JOIN sierra_view.phrase_entry genre ON genre.record_id = lccn.record_id
		AND genre.varfield_type_code = 'h'
	JOIN sierra_view.authority_record a ON a.record_id = lccn.record_id
		AND a.code2 = '2'
WHERE
	lccn.index_tag = 'z'
GROUP BY lccn.index_entry, genre.index_entry
HAVING COUNT (lccn.index_entry) > 1;
--ORDER BY COUNT (lccn.index_entry) DESC;
--LIMIT 100;