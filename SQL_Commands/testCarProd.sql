SELECT
    c.brand,
    c.model,
    c.`engine`,
    c.`year`,
	p.`name` AS product
FROM
     product_car pc
          INNER JOIN Product p
          ON pc.product_id = p.product_id
		
		  INNER JOIN Car c
          ON pc.car_id = c.car_id
          
WHERE pc.product_id = (SELECT product_id FROM Product WHERE `name` = 'Szczecin')