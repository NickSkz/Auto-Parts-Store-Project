CREATE VIEW `discounted_products` AS
SELECT p.name,
       hc.name AS ultra_category,
	   ct.name AS category,
	   mn.name AS producent,
	   p.price,
	   p.availible_count,
       p.discount
FROM `product` p

INNER JOIN Category_Producent cp
ON p.categoryprod_id = cp.categoryprod_id

INNER JOIN Manufacturer mn
ON cp.manufacturer_id = mn.manufacturer_id

INNER JOIN Category ct
ON cp.category_id = ct.category_id
          
INNER JOIN HigherCategory hc
ON hc.highercategory_id = ct.highercategory_id

WHERE `discount` IS NOT NULL