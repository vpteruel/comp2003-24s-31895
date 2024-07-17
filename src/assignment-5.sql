/*
        Assignment 5
            Worth 5%
        Total Assignment is out of 50 marks  
        Complete all of the questions in this SQL file and submit the file for grading
        Open this file in SQL Workbench to complete all of the statements
        
        Make sure you run the CreateDB Script to create the sample database 
        
        You will need it to create the queries based on these tables
        
        There is a .jpg file which shows the tables in the database

*/





/*
 Question 1
 
Write a CREATE table statement that has a PRIMARY KEY column and have that column auto generate a value on INSERT ( 5 marks )
 
*/

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



/*
 Question 2
 
 Write 5 INSERT statements that add data to the table from Question 1 but doesn't include the PRIMARY KEY to test the auto numbering ( 5 marks )
 
*/

INSERT INTO students (name) VALUES 
    ('Alice Johnson'),
    ('Bob Smith'),
    ('Charlie Brown'),
    ('Diana Prince'),
    ('Edward Norton');



/*
 Question 3
 
 Write an ALTER statment to add a date column to the table from Question 1 and set a default of January 1 2020 ( 7 marks )
 
*/

ALTER TABLE students 
    ADD COLUMN date_of_birth DATE DEFAULT '2020-01-01';



/*
 Question 4
 
 Write an ALTER statment to remove the date column you just added to your table (7 marks)
 
*/

ALTER TABLE students 
    DROP COLUMN date_of_birth;



/*
 Question 5
 
  Write a single ALTER statment to modify the name and datatype of two of your columns in your table from Question 1   ( 8 marks )
 
  
 */
 
ALTER TABLE students 
    CHANGE COLUMN name full_name VARCHAR(200),
    MODIFY COLUMN created_at DATETIME;
 
 

/*
 Question 6
 
  Write a single ALTER statment to add two columns to your table from Question 1, the first column needs a DEFAULT value, the second column needs to be put in between your first and second column of the table ( 8 marks )
 
   
 */

ALTER TABLE students
    ADD COLUMN status VARCHAR(20) DEFAULT 'active',
    ADD COLUMN email VARCHAR(100) AFTER id;



/*
 Question 7
 
  Write a CREATE table statment that has an ID column (with a PRIMARY KEY and an AUTO generating number) and a description column.   
  ALTER the table from Question 1 to have that ID column added to it and make a FOREIGN KEY reference 
  INSERT records into the new table AND UPDATE the table from Question 1 with the new ID fields
  ( 10 marks )

 
 */
 
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255)
);

ALTER TABLE students
    ADD COLUMN course_id INT,
    ADD CONSTRAINT fk_course_id
        FOREIGN KEY (course_id) REFERENCES courses(id);

INSERT INTO courses (description) VALUES
    ('Mathematics'),
    ('Science'),
    ('History');

UPDATE students SET course_id = 1 WHERE id = 1;
UPDATE students SET course_id = 2 WHERE id = 2;
UPDATE students SET course_id = 3 WHERE id = 3;
 
 