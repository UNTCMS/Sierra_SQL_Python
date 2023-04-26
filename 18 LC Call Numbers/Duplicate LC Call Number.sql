--
-- Duplicate LC Call Number
--
SELECT DISTINCT ON (r.id)
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	p.index_entry AS "Indexed Call Number",
--	v092.field_content AS "092 Call Number",
--	v099.field_content AS "099 Call Number",
	v930.field_content AS "930 Call Number"
FROM
	sierra_view.record_metadata r
--	JOIN sierra_view.bib_record b ON b.record_id = r.id
--		AND b.bcode1 IN ('-','b','d','2','4')
--		AND b.bcode2 NOT IN ('q','y')
--		AND b.bcode3 = '-'
	LEFT JOIN sierra_view.phrase_entry p ON p.record_id = r.id
		AND p.index_tag = 'c'
	LEFT JOIN sierra_view.varfield v092 ON v092.record_id = r.id
		AND v092.marc_tag = '092'
	LEFT JOIN sierra_view.varfield v099 ON v099.record_id = r.id
		AND v099.marc_tag = '099'
	LEFT JOIN sierra_view.varfield v930 ON v930.record_id = r.id
		AND v930.marc_tag = '930'
WHERE
	r.record_type_code = 'b'
	AND p.record_id IS NOT NULL
	AND v930.record_id IS NOT NULL
ORDER BY r.id, r.record_num;
--LIMIT 1000;