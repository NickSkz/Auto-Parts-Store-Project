CREATE VIEW `discounted_products` AS
SELECT * FROM `product`
WHERE `discount` IS NOT NULL