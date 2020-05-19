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
DELIMITER ;