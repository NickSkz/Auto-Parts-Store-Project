SELECT
	  hc.name,
	  ct.name,
	  mn.name,
	  mn.country
FROM
     category_producent cp
          INNER JOIN Category ct
          ON cp.category_id = ct.category_id
		
		  INNER JOIN Manufacturer mn
          ON cp.manufacturer_id = mn.manufacturer_id
          
		  INNER JOIN HigherCategory hc
          ON hc.highercategory_id = ct.highercategory_id
WHERE cp.category_id = (SELECT category_id from category WHERE `name`='Amortyzatory')
