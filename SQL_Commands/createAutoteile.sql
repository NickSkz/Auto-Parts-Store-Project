DROP DATABASE IF EXISTS `autoteile`;
CREATE DATABASE `autoteile`;
USE `autoteile`;

SET NAMES utf8 ;

CREATE TABLE `Category`(
	`category_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    PRIMARY KEY(`category_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Manufacturer`(
	`manufacturer_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30),
    `country` VARCHAR(30),
    PRIMARY KEY(`manufacturer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Category_Producent`(
	`categoryprod_id` INT NOT NULL AUTO_INCREMENT,
    `category_id` INT NOT NULL,
    `manufacturer_id` INT NOT NULL,
    PRIMARY KEY(`categoryprod_id`),
    FOREIGN KEY(`category_id`) REFERENCES `Category`(`category_id`),
    FOREIGN KEY(`manufacturer_id`) REFERENCES `Manufacturer`(`manufacturer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Product` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`categoryprod_id` INT NOT NULL,
	`name` VARCHAR(40) NOT NULL,
    `price` DECIMAL,
	`availible_count` INT,
	`discount` INT,
    PRIMARY KEY(`product_id`),
    FOREIGN KEY(`categoryprod_id`) REFERENCES `Category_Producent`(`categoryprod_id`),
    INDEX(`price`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Car` (
	`car_id` INT NOT NULL AUTO_INCREMENT,
	`brand` VARCHAR(20) NOT NULL,
	`model` VARCHAR(40) NOT NULL,
	`engine` VARCHAR(30),
	`year` YEAR NOT NULL,
    PRIMARY KEY(`car_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Product_Car` (
	`productcar_id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL,
    `car_id` INT NOT NULL,
    PRIMARY KEY(`productcar_id`),
    FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`),
    FOREIGN KEY(`car_id`) REFERENCES `car`(`car_id`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
             
    
CREATE TABLE DeliveryAdress(
	`adress_id` INT NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(40) NOT NULL,
    `city` VARCHAR(180) NOT NULL,
    `street` VARCHAR(180) NOT NULL,
    `building_number` VARCHAR(20) NOT NULL,
    `apartament` INT,
    `postal_code` VARCHAR(10) NOT NULL,
	PRIMARY KEY(`adress_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE Customer(
	`customer_id` INT NOT NULL AUTO_INCREMENT,
    `adress_id` INT NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `e_mail` TEXT NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `phone` VARCHAR(9),
    `system_rank` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`customer_id`),
    FOREIGN KEY(`adress_id`) REFERENCES `DeliveryAdress`(`adress_id`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE Orderr(
	`order_id` INT NOT NULL AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    `transaction_nr` INT NOT NULL,
    `if_paid` TINYINT(1),
    `if_sent` TINYINT(1),
    `discount_decimal` INT,
    `order_date` DATETIME,
    PRIMARY KEY(`order_id`),
    FOREIGN KEY(`customer_id`) REFERENCES `Customer`(`customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE Order_Product(
	`orderprod_id` INT NOT NULL AUTO_INCREMENT,
    `order_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `how_many` INT NOT NULL,
    PRIMARY KEY(`orderprod_id`),
    FOREIGN KEY(`order_id`) REFERENCES `Orderr`(`order_id`),
    FOREIGN KEY(`product_id`) REFERENCES `Product`(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;