DROP DATABASE IF EXISTS Azienda;
CREATE DATABASE Azienda;

DROP USER IF EXISTS 'dev_azienda'@'localhost';
DROP USER IF EXISTS 'analista'@'localhost';

CREATE USER 'dev_azienda'@'localhost' IDENTIFIED BY 'scegli_password_1';
CREATE USER 'analista'@'localhost' IDENTIFIED BY 'scegli_password_2';

GRANT ALL PRIVILEGES ON Azienda.* TO 'dev_azienda'@'localhost';
GRANT SELECT ON Azienda.* TO 'analista'@'localhost';

SHOW GRANTS FOR 'dev_azienda'@'localhost';
SHOW GRANTS FOR 'analista'@'localhost';