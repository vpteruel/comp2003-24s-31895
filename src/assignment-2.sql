/*
				Assignment 2 
                  Worth 3%
                Total Assignment is out of 75 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/


/*  NOTE   Please read all the questions before creating your table in question 1 as your table and data need to be good enough quality to satisfy the conditions for Question 3 - 6 */

 CREATE DATABASE ASSIGNMENT2;
 USE ASSIGNMENT2;
 
 /*
 Question 1
 
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row and are related by one of their columns ( make sure you have a least 1 date column )   ( 15 marks )
 
  
 */
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

 
 /*
 Question 2
/////// NOTE rember the order of which table you insert into first is important
 
 Write 10 statements to add to the source table you created in question 1   ( 10 marks )
 
 Write 10 statements to add to the dependant table you created in question 1  ( 10 marks )
  
 */

 -- Insert the first row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Alice Johnson', 'alice.johnson@example.com', '1985-04-12');

-- Insert the second row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Bob Smith', 'bob.smith@example.com', '1990-07-23');

-- Insert the third row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Charlie Brown', 'charlie.brown@example.com', '1975-11-30');

-- Insert the fourth row
INSERT INTO customers (name, email, date_of_birth) VALUES ('David Wilson', 'david.wilson@example.com', '1988-03-15');

-- Insert the fifth row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Eva Green', 'eva.green@example.com', '1992-01-25');

-- Insert the sixth row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Frank White', 'frank.white@example.com', '1980-08-09');

-- Insert the seventh row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Grace Lee', 'grace.lee@example.com', '1995-12-14');

-- Insert the eighth row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Hannah Davis', 'hannah.davis@example.com', '1983-05-19');

-- Insert the ninth row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Ian Moore', 'ian.moore@example.com', '1979-10-02');

-- Insert the tenth row
INSERT INTO customers (name, email, date_of_birth) VALUES ('Julia Clark', 'julia.clark@example.com', '1998-06-07');


-- Insert the first row
INSERT INTO orders (customer_id, order_date, amount) VALUES (1, '2024-01-10', 100.50);

-- Insert the second row
INSERT INTO orders (customer_id, order_date, amount) VALUES (2, '2024-01-15', 200.75);

-- Insert the third row
INSERT INTO orders (customer_id, order_date, amount) VALUES (3, '2024-01-20', 300.20);

-- Insert the fourth row
INSERT INTO orders (customer_id, order_date, amount) VALUES (4, '2024-01-25', 150.00);

-- Insert the fifth row
INSERT INTO orders (customer_id, order_date, amount) VALUES (5, '2024-02-01', 175.30);

-- Insert the sixth row
INSERT INTO orders (customer_id, order_date, amount) VALUES (6, '2024-02-05', 225.45);

-- Insert the seventh row
INSERT INTO orders (customer_id, order_date, amount) VALUES (7, '2024-02-10', 250.60);

-- Insert the eighth row
INSERT INTO orders (customer_id, order_date, amount) VALUES (8, '2024-02-15', 275.80);

-- Insert the ninth row
INSERT INTO orders (customer_id, order_date, amount) VALUES (9, '2024-02-20', 325.90);

-- Insert the tenth row
INSERT INTO orders (customer_id, order_date, amount) VALUES (10, '2024-02-25', 350.00);

 
 /*
 Question 3
 
 Write a SELECT statement that uses the LIKE statement and a character to find some of the records in one of your tables you created in Question 1 ( Use either the % or the _ for the rest of your wildcard)   ( 10 marks )
 
  
 */
SELECT * FROM customers 
WHERE name LIKE '%an%';

 
  /*
 Question 4
 
 Write a SELECT statement that uses the BETWEEN statement to find some of the records in one of your tables using the date column you created in Question 1  ( 10 marks )
 
  
 */
SELECT * FROM customers 
WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';
 

 /*
 Question 5
 
 Write a SELECT statement that uses another BETWEEN statement and sorts the data by 2 of the columns one in Ascending and one in Descending order on the tables you created in Question 1  ( 10 marks )
 
  
 */
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-02-29'
ORDER BY order_date ASC, amount DESC;

 
  /*
 Question 6
 
 Write a SELECT statement that selects a list of values (using the IN operator) from one of your tables, then use that same query and use the NOT operator to get the opposite data on the tables you created in Question 1   ( 10 marks )
 
  
 */
SELECT * FROM customers
WHERE email IN ('alice.johnson@example.com', 'bob.smith@example.com', 'charlie.brown@example.com');

SELECT * FROM customers
WHERE email NOT IN ('alice.johnson@example.com', 'bob.smith@example.com', 'charlie.brown@example.com');
