--
-- Duplicate Barcodes
--
SELECT
	p.index_entry AS "Barcode",
	COUNT (p.index_entry) AS "Count"
FROM
	sierra_view.phrase_entry p
WHERE
	p.index_tag = 'b'
GROUP BY p.index_entry
HAVING COUNT (p.index_entry) > 1;