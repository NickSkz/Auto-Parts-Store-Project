DELIMITER //
CREATE FUNCTION get_key (tablee varchar(30), col varchar(30), namee varchar(30), wanted_name varchar(30)) 
RETURNS DECIMAL
DETERMINISTIC
BEGIN 
	DECLARE real_key INT;
	SET real_key = 0;
	SELECT col INTO real_key FROM tablee
    WHERE namee = wanted_name;
    RETURN real_key;
END//


CREATE FUNCTION get_catprod (c_name varchar(30), p_name varchar(30)) 
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE real_key INT;
	SET real_key = 0;
    
	SELECT cp.categoryprod_id INTO real_key FROM category_producent cp
		INNER JOIN Category ct
		ON cp.category_id = ct.category_id
		
		INNER JOIN Manufacturer mn
		ON cp.manufacturer_id = mn.manufacturer_id
    WHERE ct.`name`=c_name AND mn.`name`=p_name;
    
    RETURN real_key;
END//

DELIMITER ;