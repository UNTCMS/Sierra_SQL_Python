﻿--
-- Duplicate Field Content
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v1.marc_tag AS "MARC Tag",
	v1.field_content AS "Field Content"
FROM
	sierra_view.varfield v1
	JOIN sierra_view.varfield v2 ON v2.record_id = v1.record_id
	JOIN sierra_view.record_metadata r ON r.id = v1.record_id
		AND r.record_type_code = 'b'
--		AND r.record_num > '2000001'
--		AND r.record_num > '4000001'
--		AND r.record_num > '3999999' OR < '6000001'
--		AND r.record_num > '6000001'
WHERE
	v2.id > v1.id
	AND v1.marc_tag = v2.marc_tag
	AND v1.marc_ind1 = v2.marc_ind1
	AND v1.marc_ind2 = v2.marc_ind2
	AND v1.field_content = v2.field_content
ORDER BY r.record_num;
--ORDER BY v1.marc_tag, v1.field_content;