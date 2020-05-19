DELIMITER //

CREATE PROCEDURE insert_highercategory(IN naame varchar(30))
BEGIN
	INSERT INTO highercategory(highercategory_id, `name`) VALUES (NULL, naame);
END //

CREATE PROCEDURE insert_category(IN highercat INT, IN naame varchar(30))
BEGIN
	INSERT INTO category(category_id, highercategory_id, `name`) VALUES (NULL, highercat, naame);
END //

CREATE PROCEDURE insert_manufacturer(IN naame varchar(30), IN country varchar(30))
BEGIN
	INSERT INTO manufacturer(manufacturer_id, `name`, country) VALUES (NULL, naame, country);
END //

CREATE PROCEDURE insert_categoryproducent(IN cat INT, IN man INT)
BEGIN
	INSERT INTO category_producent(categoryprod_id, category_id, manufacturer_id) VALUES (NULL, cat, man);
END //

CREATE PROCEDURE insert_car(IN brand varchar(20), IN model varchar(40), IN eengine varchar(30), IN yeear YEAR)
BEGIN
	INSERT INTO car(car_id, brand, model, `engine`, `year`) VALUES (NULL, brand, model, eengine, yeear);
END //

CREATE PROCEDURE insert_product(IN catprod INT, IN naame VARCHAR(30), IN price DECIMAL, IN avalible_count INT, IN discount INT)
BEGIN
	INSERT INTO product(product_id, categoryprod_id, `name`, price, avalible_count, discount) VALUES (NULL, catprod, naame, price, avalible_count, discount);
END //

CREATE PROCEDURE insert_productcar(IN prod INT, IN car INT)
BEGIN
	INSERT INTO product_car(productcar_id, product_id, car_id) VALUES (NULL, prod, car);
END //

CREATE PROCEDURE insert_deliveryAdress(IN country varchar(40), IN city varchar(180), IN street varchar(180), IN building_nr varchar(20), IN apartament INT, IN postal_code varchar(10))
BEGIN
	INSERT INTO deliveryadress(adress_id, country, city, street, building_number, apartament, postal_code) VALUES (NULL,  country, city, street, building_nr, apartament);
END //

CREATE PROCEDURE insert_customer(IN adress_id INT, IN naame varchar(20), IN last_name varchar(30), IN e_mail TEXT, IN paassword varchar(20), IN phone varchar(9), IN system_rank varchar(20))
BEGIN
	INSERT INTO customer(user_id, adress_id, `name`, last_name, e_mail, `password`, phone, system_rank) VALUES (NULL, adress_id, naame, last_name, e_mail, paassword, phone, system_rank);
END //

CREATE PROCEDURE insert_orderr(IN user_id INT, IN transaction_nr INT, IN if_paid TINYINT(1), IN if_sent TINYINT(1), IN discount_decimal INT, IN order_date DATETIME)
BEGIN
	INSERT INTO orderr(order_id, user_id, transaction_nr, if_paid, if_sent, discount_decimal, order_date) VALUES (NULL, user_id, transaction_nr, if_paid, if_sent, discount_decimal, order_date);
END //

CREATE PROCEDURE insert_orderprod(IN order_id INT, IN product_id INT, IN how_many INT)
BEGIN
	INSERT INTO order_product(orderprod_id, order_id, product_id, how_many) VALUES (NULL, order_id, product_id, how_many);
END //

DELIMITER ;