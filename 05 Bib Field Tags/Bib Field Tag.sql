--
-- Bad Bib Field Tag
--
SELECT
	r.record_type_code || r.record_num || 'a' AS "Record Number",
	v.varfield_type_code AS "Field Tag",
	v.marc_tag AS "MARC Tag"
FROM
	sierra_view.varfield v
	JOIN sierra_view.record_metadata r ON r.id = v.record_id
		AND r.record_type_code = 'b'
WHERE
	((v.varfield_type_code = 'a' AND v.marc_tag NOT IN ('100','110','111'))
	OR (v.varfield_type_code = 'b' AND v.marc_tag NOT IN ('700','710','711'))
	OR (v.varfield_type_code = 'c' AND v.marc_tag NOT IN ('050','090','092','099'))
	OR (v.varfield_type_code = 'd' AND v.marc_tag NOT IN ('600','610','611','630','647','648','650','651','653','654','655','656','657','658','662','690','691','692'))
	OR (v.varfield_type_code = 'e' AND v.marc_tag NOT IN ('250','251','254'))
	OR (v.varfield_type_code = 'g' AND v.marc_tag NOT IN ('074','086'))
	OR (v.varfield_type_code = 'h' AND v.marc_tag != '866')
	OR (v.varfield_type_code = 'i' AND v.marc_tag NOT IN ('020','022','024','025','026','027','028','030'))
	OR (v.varfield_type_code = 'l' AND v.marc_tag != '010')
	OR (v.varfield_type_code = 'm' AND v.marc_tag NOT IN ('910','911'))
	OR (v.varfield_type_code = 'n' AND (v.marc_tag NOT LIKE ('5%') OR v.marc_tag = '591'))
	OR (v.varfield_type_code = 'o' AND v.marc_tag NOT IN ('001','035'))
	OR (v.varfield_type_code = 'p' AND v.marc_tag NOT IN ('260','261','262','264'))
	OR (v.varfield_type_code = 'q' AND v.marc_tag NOT IN ('760','761','762','763','764','765','766','767','768','769','770','771','772','773','774','775','776','777','786'))
	OR (v.varfield_type_code = 'r' AND v.marc_tag NOT LIKE ('3%'))
	OR (v.varfield_type_code = 's' AND v.marc_tag NOT IN ('400','410','411','440','490','800','810','811','830'))
	OR (v.varfield_type_code = 't' AND v.marc_tag NOT IN ('130','240','243','245','730'))
	OR (v.varfield_type_code = 'u' AND v.marc_tag NOT IN ('210','222','241','242','246','247','740','922'))
	OR (v.varfield_type_code = 'w' AND v.marc_tag != '787')
	OR (v.varfield_type_code = 'x' AND v.marc_tag != '780')
	OR (v.varfield_type_code = 'y' AND v.marc_tag NOT IN ('003','005','006','007','008','009','031','032','033','034','036','037','038','039','040','041','042','043','044','045','046','047','048','049','066','088','255','256','257','263','265','752','753','754','755','756','757','758','856','880','882','883','884','901','930','935','937','946','950','959','962','990','994','999'))
	OR (v.varfield_type_code = 'z' AND v.marc_tag != '785')
	OR v.varfield_type_code IN ('f','j','k','v'))
--ORDER BY r.record_num ASC;
ORDER BY v.marc_tag, v.varfield_type_code, r.record_num ASC;