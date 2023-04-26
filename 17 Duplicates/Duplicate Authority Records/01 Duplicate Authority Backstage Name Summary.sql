--
-- Duplicate Authority Backstage Name Summary
--
SELECT
	lccn.index_entry AS "LCCN",
	name.index_entry AS "Content",
	COUNT (lccn.index_entry) AS "Count"
FROM
	sierra_view.phrase_entry lccn
	JOIN sierra_view.phrase_entry name ON name.record_id = lccn.record_id
		AND name.varfield_type_code = 'a'
	JOIN sierra_view.authority_record a ON a.record_id = lccn.record_id
		AND a.code2 = '2'
WHERE
	lccn.index_tag = 'z'
GROUP BY lccn.index_entry, name.index_entry
HAVING COUNT (lccn.index_entry) > 1;
--ORDER BY COUNT (lccn.index_entry) DESC;
--LIMIT 100;