DELIMITER //
CREATE TRIGGER decrement_availible BEFORE INSERT ON order_product
 FOR EACH ROW 
	BEGIN
		DECLARE errVal int default (SELECT availible_count FROM product WHERE product_id = NEW.product_id);
		IF(errVal < NEW.how_many) THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'NOT ENOUGH ITEMS IN THE STORE';
		END IF;
        
		UPDATE product
			SET availible_count = IF(availible_count > NEW.how_many, availible_count - NEW.how_many, availible_count)
		WHERE product_id = NEW.product_id;
	END;//
DELIMITER ; 