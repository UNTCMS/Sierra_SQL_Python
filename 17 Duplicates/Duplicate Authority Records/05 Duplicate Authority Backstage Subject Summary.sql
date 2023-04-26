--
-- Duplicate Authority Backstage Subject Summary
--
SELECT
	lccn.index_entry AS "LCCN",
	subject.index_entry AS "Subject",
	COUNT (lccn.index_entry) AS "Count"
FROM
	sierra_view.phrase_entry lccn
	JOIN sierra_view.phrase_entry subject ON subject.record_id = lccn.record_id
		AND subject.varfield_type_code = 'd'
	JOIN sierra_view.authority_record a ON a.record_id = lccn.record_id
		AND a.code2 = '2'
WHERE
	lccn.index_tag = 'z'
GROUP BY lccn.index_entry, subject.index_entry
HAVING COUNT (lccn.index_entry) > 1;
--ORDER BY COUNT (lccn.index_entry) DESC;
--LIMIT 100;