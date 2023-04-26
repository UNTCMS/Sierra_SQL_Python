--
-- Bad barcodes
--
SELECT
	id2reckey(b.id) || 'a' AS "Bib Record #",
	i.record_type_code || i.record_num || 'a' AS "Item Record #",
	i.barcode AS "Barcode",
	i.location_code AS "Location code",
	b.title AS "Title"
	
FROM
	sierra_view.item_view i
	JOIN sierra_view.bib_record_item_record_link l ON i.id = l.item_record_id
	JOIN sierra_view.bib_view b ON l.bib_record_id = b.id
WHERE i.barcode !~ '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	--AND i.location_code IN ('w4spe', 'xspe')
	AND i.barcode != ''
ORDER BY i.barcode;