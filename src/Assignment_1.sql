/*
				Assignment 1 
                  Worth 3%
                Total Assignment is out of 75 marks  
		Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/





/*
 Question 1
 
 Write a statement to Create a database (make sure your database doesn't contain special characters)  ( 5 marks )
 
*/
CREATE DATABASE mydatabase;


/*
 Question 2
 
 Write a statement to Drop that Database you created in Question 1  ( 5 marks )
 
*/
DROP DATABASE mydatabase;


/*
 Question 3
 
 Write a statement to set the database you created to be the one that will be active for your session  ( 5 marks )
 
*/
USE mydatabase;


/*
 Question 4
 
 Write a statement to Create a table that will have columns that represent all of the basic datatypes that are available in the databse  (make sure your table and column names are describe the content of the table)  ( 15 marks )
 example
 CREATE TABLE book_info (
     id                 VARCHAR(32)     not null,
     filePath           long varchar     null,
     price		        float     null ,
     title                  null,
     author             long varchar     null,
  );
*/
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    varchar_column VARCHAR(255),
    char_column CHAR(10),
    text_column TEXT,
    tinyint_column TINYINT,
    smallint_column SMALLINT,
    mediumint_column MEDIUMINT,
    int_column INT,
    bigint_column BIGINT,
    float_column FLOAT(7,3),
    double_column DOUBLE(10,5),
    decimal_column DECIMAL(10,2),
    date_column DATE,
    datetime_column DATETIME,
    timestamp_column TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    time_column TIME,
    year_column YEAR,
    bit_column BIT(1),
    binary_column BINARY(16),
    varbinary_column VARBINARY(255),
    enum_column ENUM('value1', 'value2', 'value3'),
    set_column SET('a', 'b', 'c')
);


/*
 Question 5
 
 Write 5 statements to add data to the table you created in question 4   ( 15 marks )
 
   
 */
 -- Insert the first row of data
INSERT INTO example_table (
    varchar_column, char_column, text_column, tinyint_column, smallint_column, mediumint_column,
    int_column, bigint_column, float_column, double_column, decimal_column, date_column,
    datetime_column, timestamp_column, time_column, year_column, bit_column, binary_column,
    varbinary_column, enum_column, set_column
) VALUES (
    'example text', 'char10', 'some text', 1, 100, 1000, 10000, 1000000000, 1.234, 12345.67890, 12345.67,
    '2024-01-01', '2024-01-01 12:34:56', '2024-01-01 12:34:56', '12:34:56', 2024, b'1', BINARY('binary_data'),
    VARBINARY('varbinary_data'), 'value1', 'a,b'
);

-- Insert the second row of data
INSERT INTO example_table (
    varchar_column, char_column, text_column, tinyint_column, smallint_column, mediumint_column,
    int_column, bigint_column, float_column, double_column, decimal_column, date_column,
    datetime_column, timestamp_column, time_column, year_column, bit_column, binary_column,
    varbinary_column, enum_column, set_column
) VALUES (
    'another text', 'char20', 'more text', -1, 200, 2000, 20000, 2000000000, 2.345, 23456.78901, 23456.78,
    '2024-02-01', '2024-02-01 13:45:67', '2024-02-01 13:45:67', '13:45:67', 2023, b'0', BINARY('binary_data2'),
    VARBINARY('varbinary_data2'), 'value2', 'b,c'
);

-- Insert the third row of data
INSERT INTO example_table (
    varchar_column, char_column, text_column, tinyint_column, smallint_column, mediumint_column,
    int_column, bigint_column, float_column, double_column, decimal_column, date_column,
    datetime_column, timestamp_column, time_column, year_column, bit_column, binary_column,
    varbinary_column, enum_column, set_column
) VALUES (
    'text three', 'char30', 'text again', 0, 300, 3000, 30000, 3000000000, 3.456, 34567.89012, 34567.89,
    '2024-03-01', '2024-03-01 14:56:78', '2024-03-01 14:56:78', '14:56:78', 2022, b'1', BINARY('binary_data3'),
    VARBINARY('varbinary_data3'), 'value3', 'a,c'
);

-- Insert the fourth row of data
INSERT INTO example_table (
    varchar_column, char_column, text_column, tinyint_column, smallint_column, mediumint_column,
    int_column, bigint_column, float_column, double_column, decimal_column, date_column,
    datetime_column, timestamp_column, time_column, year_column, bit_column, binary_column,
    varbinary_column, enum_column, set_column
) VALUES (
    'fourth text', 'char40', 'another one', 127, 400, 4000, 40000, 4000000000, 4.567, 45678.90123, 45678.90,
    '2024-04-01', '2024-04-01 15:67:89', '2024-04-01 15:67:89', '15:67:89', 2021, b'0', BINARY('binary_data4'),
    VARBINARY('varbinary_data4'), 'value1', 'a,b,c'
);

-- Insert the fifth row of data
INSERT INTO example_table (
    varchar_column, char_column, text_column, tinyint_column, smallint_column, mediumint_column,
    int_column, bigint_column, float_column, double_column, decimal_column, date_column,
    datetime_column, timestamp_column, time_column, year_column, bit_column, binary_column,
    varbinary_column, enum_column, set_column
) VALUES (
    'fifth text', 'char50', 'yet again', -128, 500, 5000, 50000, 5000000000, 5.678, 56789.01234, 56789.01,
    '2024-05-01', '2024-05-01 16:78:90', '2024-05-01 16:78:90', '16:78:90', 2020, b'1', BINARY('binary_data5'),
    VARBINARY('varbinary_data5'), 'value2', 'b,a'
);


/*
 Question 6
 
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row ( make sure your table and column names are describe the content of the table)   ( 10 marks )
 
  
 */
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    UNIQUE (product_code)
);



/*
 Question 7
 
 Write 5 statements to add to the first table you created in question 6   ( 10 marks )
 
 Write 5 statements to add to the second table you created in question 6  ( 10 marks )
  
 */
-- first table
-- Insert the first row of data
INSERT INTO users (username, email) VALUES ('john_doe', 'john.doe@example.com');

-- Insert the second row of data
INSERT INTO users (username, email) VALUES ('jane_smith', 'jane.smith@example.com');

-- Insert the third row of data
INSERT INTO users (username, email) VALUES ('alice_jones', 'alice.jones@example.com');

-- Insert the fourth row of data
INSERT INTO users (username, email) VALUES ('bob_brown', 'bob.brown@example.com');

-- Insert the fifth row of data
INSERT INTO users (username, email) VALUES ('charlie_black', 'charlie.black@example.com');


-- second table
-- Insert the first row of data
INSERT INTO products (product_code, product_name) VALUES ('P001', 'Product One');

-- Insert the second row of data
INSERT INTO products (product_code, product_name) VALUES ('P002', 'Product Two');

-- Insert the third row of data
INSERT INTO products (product_code, product_name) VALUES ('P003', 'Product Three');

-- Insert the fourth row of data
INSERT INTO products (product_code, product_name) VALUES ('P004', 'Product Four');

-- Insert the fifth row of data
INSERT INTO products (product_code, product_name) VALUES ('P005', 'Product Five');
