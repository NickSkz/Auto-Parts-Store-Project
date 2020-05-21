GRANT ALL PRIVILEGES ON autoteile.* TO 'ADMIN'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE ON autoteile.* TO 'WORKER'@'localhost';

GRANT INSERT, UPDATE ON autoteile.customer TO 'USER'@'localhost';
GRANT INSERT, UPDATE ON autoteile.deliveryadress TO 'USER'@'localhost';
GRANT INSERT, UPDATE, DELETE ON autoteile.orderr TO 'USER'@'localhost';
GRANT INSERT, UPDATE, DELETE ON autoteile.order_product TO 'USER'@'localhost';
GRANT SELECT ON autoteile.* TO 'USER'@'localhost';