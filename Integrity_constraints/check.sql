.open integrityTestDatabase.sql
.mode column

PRAGMA foreign_keys = ON 


DROP TABLE IF EXISTS contacts;


DROP TABLE IF EXISTS products;


CREATE TABLE contacts(
    contact_id  INTEGER PRIMARY KEY,
    first_name  TEXT    NOT NULL,
    last_name   TEXT    NOT NULL,
    email       TEXT    NOT NULL     CHECK(email LIKE '%@%'),  
    phone       TEXT    NOT NULL     CHECK(length(phone) >= 10));


INSERT INTO contacts
(contact_id, first_name, last_name, email, phone)
VALUES 
(5, 'Tom', 'Bettridge', 'tom.bettridge@pwc.com', '09801928392');


CREATE TABLE products(
    product_id      INTEGER           PRIMARY KEY,
    product_name    TEXT              NOT NULL, 
    list_price      DECIMAL(10,2)     NOT NULL      CHECK(list_price >= discount AND discount >= 0 AND list_price >= 0), 
    discount        DECIMAL(10,2)     NOT NULL );

INSERT INTO products
(product_id, product_name, list_price, discount)
VALUES 
(1, 'Table', 50.99, 55); 
