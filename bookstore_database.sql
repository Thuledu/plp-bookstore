-- Created by: Thuledu Tshabalala

-- Create Database
CREATE DATABASE bookstoreDB;

-- Use the database
USE bookstoreDB;

-- A list of all books available in the store
CREATE TABLE book (
book_id VARCHAR (30) PRIMARY KEY,
book_name VARCHAR(100)
);

-- A table to manage the many-to-many relationship between books and authors. 
CREATE TABLE book_author (
id INT PRIMARY KEY, 
book_id VARCHAR (30),
auth_id VARCHAR (30), 
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (auth_id) REFERENCES author(auth_id)
);

-- A list of all authors
CREATE TABLE author (
auth_id VARCHAR (30) PRIMARY KEY,
book_id VARCHAR (30),
firstname VARCHAR(50),
lastname VARCHAR(50),
FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- A list of the possible languages of books
CREATE TABLE book_language (
bl_id VARCHAR (30) PRIMARY KEY,
book_id VARCHAR (30),
language VARCHAR(50),
FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- A list of publishers for books
CREATE TABLE publisher (
publ_id VARCHAR (30) PRIMARY KEY, 
book_id VARCHAR (30),
publisher_name VARCHAR(100) NOT NULL, 
FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- A list of the bookstore's customers
CREATE TABLE customer (
cust_id VARCHAR (30) PRIMARY KEY,
book_id VARCHAR (30),
cust_firstname VARCHAR(50),
cust_lastname VARCHAR(50),
FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- A list of addresses for customers. Each customer can have multiple addresses
CREATE TABLE customer_address (
cust_id VARCHAR (30),
addr_id VARCHAR(10),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
FOREIGN KEY (addr_id) REFERENCES address(addr_id)
);

-- A list of statuses for an address (e.g., current, old). 
CREATE TABLE address_status (
addr_id VARCHAR(10),
addr_status VARCHAR(50),
FOREIGN KEY (addr_id) REFERENCES address(addr_id)
);

-- A list of all addresses in the system
CREATE TABLE address (
addr_id VARCHAR(10) PRIMARY KEY,
cust_id VARCHAR (30),
address VARCHAR(150),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

-- A list of countries where the addresses are located
CREATE TABLE country (
addr_id VARCHAR(10),
countryname VARCHAR(50),
FOREIGN KEY (addr_id) REFERENCES address(addr_id)
);


-- A list of orders placed by customers
CREATE TABLE cust_order (
cust_ord_id VARCHAR (10) PRIMARY KEY,
book_id VARCHAR (30),
cust_id VARCHAR (30),
addr_id VARCHAR(10),
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
FOREIGN KEY (addr_id) REFERENCES address(addr_id)
);

-- A list of books that are part of each order. 
CREATE TABLE order_line (
order_id VARCHAR(10) PRIMARY KEY,
book_id VARCHAR (30),
cust_ord_id VARCHAR (30),
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (cust_ord_id) REFERENCES customer(cust_ord_id)
);

-- A list of possible shipping methods for an order. 
CREATE TABLE shipping_method (
shipping_method_id VARCHAR(10) PRIMARY KEY,
shipping_method VARCHAR(100),
cust_ord_id VARCHAR (30),
order_id VARCHAR(10),
FOREIGN KEY (cust_ord_id) REFERENCES customer(cust_ord_id),
FOREIGN KEY (order_id) REFERENCES customer(order_id)
);

-- A record of the history of an order (e.g., ordered, cancelled, delivered). 
CREATE TABLE order_history (
ord_history_id INT PRIMARY KEY,
ord_history VARCHAR(100),
cust_ord_id VARCHAR (30),
FOREIGN KEY (cust_ord_id) REFERENCES customer(cust_ord_id)
);

-- A list of possible statuses for an order (e.g., pending, shipped, delivered). 
CREATE TABLE order_status (
order_status_id INT PRIMARY KEY,
order_status VARCHAR (30),
cust_ord_id VARCHAR (30),
FOREIGN KEY (cust_ord_id) REFERENCES customer(cust_ord_id)
);

/* Inserting data  */
INSERT INTO book (bookname) values ('Fault In Our Stars');
INSERT INTO book (bookname) values ('Alices Adventures in Wonderland');
INSERT INTO book (bookname) values ('The Adventures of Huckleberry Finn');
INSERT INTO book (bookname) values ('Treasure Island');
INSERT INTO book (bookname) values ('Pride and Prejudice');

INSERT INTO author (firstname, lastname) values ('John', 'Green');
INSERT INTO author (firstname, lastname) values ('Lewis', 'Carroll');
INSERT INTO author (firstname, lastname) values ('Mark', 'Twain');
INSERT INTO author (firstname, lastname) values ('Robert Louis', 'Stevenson');
INSERT INTO author (firstname, lastname) values ('Jane', 'Austen');

INSERT INTO book_language (language) values ('English');
INSERT INTO book_language (language) values ('French');
INSERT INTO book_language (language) values ('German');
INSERT INTO book_language (language) values ('Spanish');
INSERT INTO book_language (language) values ('Mandarin');

INSERT INTO publisher (publisher_name) values ('Dutton Books');
INSERT INTO publisher (publisher_name) values ('Macmillan');
INSERT INTO publisher (publisher_name) values ('Penguin Classics');
INSERT INTO publisher (publisher_name) values ('Cassell and Company');
INSERT INTO publisher (publisher_name) values ('Dover Publications');

INSERT INTO customer (cust_firstname, cust_lastname) values ('Jessica', 'North');
INSERT INTO customer (cust_firstname, cust_lastname) values ('Rachel', 'Williams');
INSERT INTO customer (cust_firstname, cust_lastname) values ('Quincy', 'Parks');
INSERT INTO customer (cust_firstname, cust_lastname) values ('Xavier', 'Brown');
INSERT INTO customer (cust_firstname, cust_lastname) values ('Julia', 'Marks');

INSERT INTO address_status (addr_status) values ('Current');
INSERT INTO address_status (addr_status) values ('Current');
INSERT INTO address_status (addr_status) values ('Old');
INSERT INTO address_status (addr_status) values ('Old');
INSERT INTO address_status (addr_status) values ('Old');



INSERT INTO address (address) values ('123', 'Ruth Avenue', 'London');
INSERT INTO address (address) values ('25', 'Louis Ave', 'Paris');
INSERT INTO address (address) values ('876', 'West Street', 'Berlin');
INSERT INTO address (address) values ('776', 'Pedro Ave', 'Madrid');
INSERT INTO address (address) values ('10', 'South Street', 'Beijing');



INSERT INTO country (countryname) values ('United Kingdom');
INSERT INTO country (countryname) values ('France');
INSERT INTO country (countryname) values ('Germany');
INSERT INTO country (countryname) values ('Spain');
INSERT INTO country (countryname) values ('China');


INSERT INTO shipping_method (shipping_method) values ('Courier');
INSERT INTO shipping_method (shipping_method) values ('Freight Shipping');
INSERT INTO shipping_method (shipping_method) values ('Courier');
INSERT INTO shipping_method (shipping_method) values ('PickUp');
INSERT INTO shipping_method (shipping_method) values ('Freight Shipping');

INSERT INTO order_history (ord_history) values ('Ordered');
INSERT INTO order_history (ord_history) values ('Ordered');
INSERT INTO order_history (ord_history) values ('Delivered');
INSERT INTO order_history (ord_history) values ('Cancelled');
INSERT INTO order_history (ord_history) values ('Delivered');

INSERT INTO order_status (order_status) values ('Pending');
INSERT INTO order_status (order_status) values ('Shipped');
INSERT INTO order_status (order_status) values ('Delivered');
INSERT INTO order_status (order_status) values ('Pending');
INSERT INTO order_status (order_status) values ('Delivered');


-- Create a Database Role
CREATE ROLE DataAnalyst;
GRANT SELECT ON * TO DataAnalyst;
GRANT INSERT ON * TO DataAnalyst;
GRANT UPDATE ON * TO DataAnalyst;
GRANT DELETE ON * TO DataAnalyst;

CREATE ROLE DataAdministrator;
GRANT SELECT ON * TO DataAdministrator;
GRANT INSERT ON * TO DataAdministrator;
GRANT UPDATE ON * TO DataAdministrator;
GRANT DELETE ON * TO DataAdministrator;

REVOKE DELETE ON * FROM DataAdministrator;

--Create Users
CREATE USER liz_porter WITH PASSWORD = 'SecurePassword123';
CREATE USER jason_smith WITH PASSWORD = 'SecurePassword345';
CREATE USER sarah_jones WITH PASSWORD = 'SecurePassword567';
CREATE USER tom_harris WITH PASSWORD = 'SecurePassword789';


-- Assign Roles to Users
GRANT DataAnalyst TO liz_porter;
GRANT DataAnalyst TO jason_smith;
GRANT DataAdministrator TO sarah_jones;
GRANT DataAdministrator TO tom_harris;


-- Revoke Role from User
REVOKE DataAdministrator FROM tom_harris;
REVOKE DataAnalyst FROM jason_smith;



SELECT * FROM book;
SELECT * FROM author;

SELECT language 
FROM book_language
WHERE language = 'English';