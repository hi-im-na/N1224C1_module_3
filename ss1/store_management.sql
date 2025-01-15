-- Active: 1736516947094@@127.0.0.1@3306@store_management
-- Active: 1736516947094@@127.0.0.1@3306@store_management
-- Active: 1736516947094@@127.0.0.1@3306@qlttnv
CREATE DATABASE IF NOT EXISTS store_management;

USE store_management;

CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NULL,
    stock INT
);

INSERT INTO
    store_management.product (
        name,
        description,
        price,
        stock
    )
VALUES (
        'Apple',
        'Fresh apple',
        1.5,
        100
    );

INSERT INTO
    store_management.product
VALUES (
        2,
        "Grape",
        "Fresh grape",
        1,
        1000
    );

INSERT INTO store_management.product (name) VALUES ("Egg");

-- cap nhat du lieu
UPDATE product SET name = "hh" WHERE id = 1;

-- SET SQL_SAFE_UPDATE = 0;

UPDATE product SET name = "hh2";

-- SET SQL_SAFE_UPDATE = 1;

ALTER TABLE product ADD barcode VARCHAR(255) DEFAULT NULL;

ALTER TABLE product ADD warranty INTEGER DEFAULT 6;

DELETE FROM product WHERE price = 1000;

-- SET SQL_SAFE_UPDATE = 0;
DELETE FROM product;
-- SET SQL_SAFE_UPDATE = 1;

DROP TABLE product;

DROP DATABASE IF EXISTS product_management;

DROP DATABASE product_management;