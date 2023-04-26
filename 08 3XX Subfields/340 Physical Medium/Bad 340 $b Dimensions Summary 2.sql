--
-- Bad 340 $b Dimensions Summary
--
SELECT
	v.field_content AS "Content",
	COUNT (v.field_content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.varfield v ON v.record_id = r.id
		AND v.marc_tag = '340'
		AND v.field_content LIKE '%|b%'
WHERE
	r.record_type_code = 'b'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sx\s\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sin\.\sx\s\d+\s\d+/\d+\sin\.'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|bin\s\w+\s\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s[cm]m\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\sx\s\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|bin\s\w+\s\d+\sx\s\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\s\d+/\d+\sx\s\d+\s\d+/\d+\sx\s\d+\s[cm]m'
	AND v.field_content NOT SIMILAR TO '%\|b\d+\-\d+\s[cm]m'
GROUP BY v.field_content
--ORDER BY v.field_content ASC;
ORDER BY COUNT (v.field_content) DESC;