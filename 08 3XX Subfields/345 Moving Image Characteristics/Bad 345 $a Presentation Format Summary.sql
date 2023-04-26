--
-- Bad 345 $a Presentation Format Summary
--
SELECT
	s.content AS "Content",
	COUNT (s.content) AS "Count"
FROM
	sierra_view.record_metadata r
	JOIN sierra_view.subfield s ON s.record_id = r.id
		AND s.marc_tag = '345'
		AND s.tag = 'a'
WHERE
	r.record_type_code = 'b'
	AND s.content NOT IN (
		'3D',
		'Cinemiracle',
		'Cinerama',
		'Circarama',
		'IMAX',
		'multiprojector',
		'multiscreen',
		'Panavision',
		'standard silent aperture',
		'standard sound aperture',
		'stereoscopic',
		'Techniscope')
GROUP BY s.content
ORDER BY s.content ASC;