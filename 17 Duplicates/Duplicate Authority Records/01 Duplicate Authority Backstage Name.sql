--
-- Duplicate Authority Backstage Name
--
-- 1. Import into Sierra.
-- 2. In Global Update, review LC ARN and 1XX, and remove records with only 1 entry for each.
-- 3. In Create Lists, export: Record #, MARC Tag 010|a, NAME AUTHR, CREATED, UPDATED.
-- 4. In Excel, import data, remove duplicate 010|a, save as .txt.
-- 5. Import into Sierra and delete records.
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.phrase_entry lccn ON lccn.record_id = r.id
WHERE
	lccn.index_entry IN (
		SELECT
			lccn.index_entry AS "LCCN"
		FROM
			sierra_view.phrase_entry lccn
			JOIN sierra_view.phrase_entry name ON name.record_id = lccn.record_id
				AND name.varfield_type_code = 'a'
			JOIN sierra_view.authority_record a ON a.record_id = lccn.record_id
				AND a.code2 = '2'
			JOIN sierra_view.record_metadata r ON r.id = lccn.record_id
				AND r.record_type_code = 'a'
		WHERE
			lccn.index_tag = 'z'
		GROUP BY lccn.index_entry, name.index_entry
		HAVING COUNT (lccn.index_entry) > 1
		);
--ORDER BY COUNT (lccn.index_entry) DESC;
--LIMIT 100;