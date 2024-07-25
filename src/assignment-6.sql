/*
				Assignment 6
                  Worth 10%
                Total Assignment is out of 100 marks  
				
                Complete all of the questions in this SQL file and submit the file for grading
                
                Open this file in SQL Workbench to complete all of the statements
                
                Make sure you run the CreateDB Script to create the sample database again so you have the correct data 
				
                You will need it to create the queries based on these tables
                
                There is a .jpg file which shows the tables in the database

*/



--------------------------------------------------------
---                                                  ---
---                      Schema                      ---
---                                                  ---
--------------------------------------------------------

-- Create the database
CREATE DATABASE IF NOT EXISTS assignment_6;

-- Use the newly created database
USE assignment_6;

-- Create table: contacttype
CREATE TABLE contacttype (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255) NOT NULL
);

-- Create table: person
CREATE TABLE person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    dob DATE,
    managerid INT,
    notes TEXT,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table: contact
CREATE TABLE contact (
    pid INT NOT NULL,
    cid INT NOT NULL,
    value TEXT,
    FOREIGN KEY (pid) REFERENCES person(id),
    FOREIGN KEY (cid) REFERENCES contacttype(id)
);

-- Create table: role
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255) NOT NULL
);

-- Create table: project
CREATE TABLE project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    label VARCHAR(255) NOT NULL,
    budget DOUBLE NOT NULL
);

-- Create table: projectperson
CREATE TABLE projectperson (
    prid INT NOT NULL,
    pid INT NOT NULL,
    rid INT NOT NULL,
    FOREIGN KEY (prid) REFERENCES project(id),
    FOREIGN KEY (pid) REFERENCES person(id),
    FOREIGN KEY (rid) REFERENCES role(id)
);

-- Create table: department
CREATE TABLE department (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

-- Create table: employee
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    did INT NOT NULL,
    pid INT NOT NULL,
    hire_date DATE,
    FOREIGN KEY (did) REFERENCES department(id),
    FOREIGN KEY (pid) REFERENCES person(id)
);

-- Create table: empproject
CREATE TABLE empproject (
    eid INT NOT NULL,
    pid INT NOT NULL,
    hours_worked DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (eid) REFERENCES employee(id),
    FOREIGN KEY (pid) REFERENCES project(id)
);



--------------------------------------------------------
---                                                  ---
---                       Data                       ---
---                                                  ---
--------------------------------------------------------

-- Insert data into contacttype
INSERT INTO contacttype (label) VALUES
    ('Email'),
    ('Phone'),
    ('Address'),
    ('LinkedIn');

-- Insert data into person
INSERT INTO person (firstname, lastname, dob, managerid, notes) VALUES
    ('John', 'Doe', '1980-01-15', NULL, 'Top performer in sales'),
    ('Jane', 'Smith', '1975-07-22', NULL, 'Specialist in project management'),
    ('Jim', 'Brown', '1990-11-05', 1, 'Expert in IT'),
    ('Alice', 'Johnson', '1985-03-18', 1, 'HR manager with excellent skills'),
    ('Bob', 'Davis', '1992-08-30', 2, 'Sales representative'),
    ('Vinicius', 'Teruel', '1987-09-30', NULL, 'Software developer');

-- Insert data into contact
INSERT INTO contact (pid, cid, value) VALUES
    (1, 1, 'john.doe@example.com'),
    (1, 2, '123-456-7890'),
    (2, 1, 'jane.smith@example.com'),
    (2, 3, '123 Main St, Anytown, USA'),
    (3, 1, 'jim.brown@example.com'),
    (3, 4, 'linkedin.com/in/jimbrown'),
    (4, 1, 'alice.johnson@example.com'),
    (4, 2, '234-567-8901'),
    (5, 1, 'bob.davis@example.com'),
    (5, 2, '345-678-9012');

-- Insert data into role
INSERT INTO role (label) VALUES
    ('Manager'),
    ('Developer'),
    ('Analyst'),
    ('Sales');

-- Insert data into project
INSERT INTO project (number, label, budget) VALUES
    (101, 'Project Alpha', 50000),
    (102, 'Project Beta', 75000),
    (103, 'Project Gamma', 100000);

-- Insert data into projectperson
INSERT INTO projectperson (prid, pid, rid) VALUES
    (1, 1, 1),  -- John Doe as Manager of Project Alpha
    (1, 2, 2),  -- Jane Smith as Developer in Project Alpha
    (2, 3, 3),  -- Jim Brown as Analyst in Project Beta
    (3, 4, 1),  -- Alice Johnson as Manager of Project Gamma
    (3, 5, 4),  -- Bob Davis as Sales in Project Gamma
    (1, 6, 2),  -- Vinicius Teruel as Developer in Project Alpha
    (2, 6, 2),  -- Vinicius Teruel as Developer in Project Beta
    (3, 6, 2);  -- Vinicius Teruel as Developer in Project Gamma

-- Insert data into department
INSERT INTO department (number, name, location) VALUES
    (1, 'HR', 'New York'),
    (2, 'IT', 'San Francisco'),
    (3, 'Sales', 'Chicago'),
    (4, 'D11', 'Depart 11');

-- Insert data into employee
INSERT INTO employee (number, salary, did, pid, hire_date) VALUES
    (1, 60000.00, 2, 1, '2005-03-01'),
    (2, 80000.00, 3, 2, '2010-05-15'),
    (3, 50000.00, 2, 3, '2018-09-01'),
    (4, 70000.00, 1, 4, '2011-06-20'),
    (5, 55000.00, 3, 5, '2019-11-01'),
    (6, 90000.00, 4, 6, '2014-07-24');

-- Insert data into empproject
INSERT INTO empproject (eid, pid, hours_worked) VALUES
    (1, 1, 150.00), -- John Doe worked 150 hours on Project Alpha
    (2, 1, 120.50), -- Jane Smith worked 120.50 hours on Project Alpha
    (3, 2, 180.75), -- Jim Brown worked 180.75 hours on Project Beta
    (4, 3, 160.00), -- Alice Johnson worked 160 hours on Project Gamma
    (5, 3, 100.25), -- Bob Davis worked 100.25 hours on Project Gamma
    (6, 1, 95.00),  -- Vinicius Teruel worked 95.00 hours on Project Gamma
    (6, 2, 85.00),  -- Vinicius Teruel worked 85.00 hours on Project Gamma
    (6, 3, 90.00);  -- Vinicius Teruel worked 90.00 hours on Project Gamma



--------------------------------------------------------
---                                                  ---
---                    Questions                     ---
---                                                  ---
--------------------------------------------------------



--------------------------------------------------------
---                                                  ---
---                    Questions 1                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 1 (10 marks)
 
 a) Create two tables with the same numbers of columns and datatypes (mininum 3 columns in each table) (3 marks)
 
 b) Populate that table with data (3 marks)
 
 c) Create a SELECT statement for each table and UNION them together (4 marks)
 
*/

-- a)

-- Create table: contractor
CREATE TABLE contractor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL UNIQUE,    -- Unique number for the contractor
    rate DECIMAL(10, 2) NOT NULL, -- Hourly rate for the contractor
    department_id INT NOT NULL,
    start_date DATE,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

-- Create table: project_team
CREATE TABLE project_team (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL UNIQUE,    -- Unique number for the project team
    budget DECIMAL(10, 2) NOT NULL, -- Budget allocated to the project team
    project_id INT NOT NULL,
    created_date DATE,
    FOREIGN KEY (project_id) REFERENCES project(id)
);

-- b)

-- Insert data into contractor
INSERT INTO contractor (number, rate, department_id, start_date) VALUES
    (1001, 75.00, 1, '2023-01-15'), -- Contractor 1001, HR Department, Rate $75/hr, Contract started on Jan 15, 2023
    (1002, 85.00, 2, '2023-03-01'), -- Contractor 1002, IT Department, Rate $85/hr, Contract started on Mar 1, 2023
    (1003, 90.00, 3, '2023-05-20'), -- Contractor 1003, Sales Department, Rate $90/hr, Contract started on May 20, 2023
    (1004, 70.00, 1, '2023-07-10'); -- Contractor 1004, HR Department, Rate $70/hr, Contract started on Jul 10, 2023

-- Insert data into project_team
INSERT INTO project_team (number, budget, project_id, created_date) VALUES
    (2001, 50000.00, 1, '2023-02-01'), -- Project Team 2001 for Project Alpha, Budget $50,000, Created on Feb 1, 2023
    (2002, 75000.00, 2, '2023-04-15'), -- Project Team 2002 for Project Beta, Budget $75,000, Created on Apr 15, 2023
    (2003, 100000.00, 3, '2023-06-01'); -- Project Team 2003 for Project Gamma, Budget $100,000, Created on Jun 1, 2023

-- c)

-- UNION statement for tables
SELECT
    id AS Table_ID,
    'contacttype' AS Table_Name,
    label AS Description,
    NULL AS Additional_Info
FROM contacttype
UNION ALL
SELECT
    id AS Table_ID,
    'person' AS Table_Name,
    CONCAT(firstname, ' ', lastname) AS Description,
    DATE_FORMAT(dob, '%Y-%m-%d') AS Additional_Info
FROM person
UNION ALL
SELECT
    NULL AS Table_ID,
    'contact' AS Table_Name,
    CONCAT('Person ID: ', pid, ', Contact Type ID: ', cid) AS Description,
    value AS Additional_Info
FROM contact
UNION ALL
SELECT
    id AS Table_ID,
    'role' AS Table_Name,
    label AS Description,
    NULL AS Additional_Info
FROM role
UNION ALL
SELECT
    id AS Table_ID,
    'project' AS Table_Name,
    label AS Description,
    CONCAT('Budget: $', budget) AS Additional_Info
FROM project
UNION ALL
SELECT
    NULL AS Table_ID,
    'projectperson' AS Table_Name,
    CONCAT('Project ID: ', prid, ', Person ID: ', pid) AS Description,
    CONCAT('Role ID: ', rid) AS Additional_Info
FROM projectperson
UNION ALL
SELECT
    id AS Table_ID,
    'department' AS Table_Name,
    name AS Description,
    CONCAT('Location: ', location) AS Additional_Info
FROM department
UNION ALL
SELECT
    id AS Table_ID,
    'employee' AS Table_Name,
    number AS Description,
    CONCAT('Salary: $', salary) AS Additional_Info
FROM employee
UNION ALL
SELECT
    NULL AS Table_ID,
    'empproject' AS Table_Name,
    CONCAT('Employee ID: ', eid, ', Project ID: ', pid) AS Description,
    CONCAT('Hours Worked: ', hours_worked) AS Additional_Info
FROM empproject
UNION ALL
SELECT
    id AS Table_ID,
    'contractor' AS Table_Name,
    CONCAT('Contractor Number: ', number) AS Description,
    CONCAT('Rate: $', rate, ', Start Date: ', DATE_FORMAT(start_date, '%Y-%m-%d')) AS Additional_Info
FROM contractor
UNION ALL
SELECT
    id AS Table_ID,
    'project_team' AS Table_Name,
    CONCAT('Project Team Number: ', number) AS Description,
    CONCAT('Budget: $', budget, ', Created Date: ', DATE_FORMAT(created_date, '%Y-%m-%d')) AS Additional_Info
FROM project_team;



--------------------------------------------------------
---                                                  ---
---                    Questions 2                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 2 (10 marks)
 
 Create a query that lists the department number, employee number, and salaries of all employees in department D11.  
 UNION the same information , but this time sum up all the salaries to create a one line summary entry for the D11 department (hint sum the salary).  Sort the list by Salary.
 
*/

-- Query to list the department number, employee number, and salaries for all employees in department D11
SELECT 
    d.number AS Department_Number,
    e.id AS Employee_Number,
    e.salary AS Salary
FROM department d
JOIN employee e ON d.id = e.did
WHERE d.name = 'D11'
UNION ALL
SELECT 
    d.number AS Department_Number,
    NULL AS Employee_Number,
    SUM(e.salary) AS Salary
FROM department d
JOIN employee e ON d.id = e.did
WHERE d.name = 'D11'
GROUP BY d.number
ORDER BY Salary;



--------------------------------------------------------
---                                                  ---
---                    Questions 3                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 3 (10 marks)
 
a )  Write a query that uses NATURAL JOIN TO connect the EMPLOYEE and EMPPROJACT table.   Include the Employee number , First and Last name, Salary, Salary increased by 3% and Project number      ( 3 marks )
 
b) Use INNER JOIN OR JOIN with the same query with USING statement   ( 3 marks )

 
c) Use INNER JOIN OR JOIN with the same query with joined columns (hint a = a )    ( 4 marks )
 
*/

-- a)
SELECT 
    e.id AS Employee_ID,
    e.number AS Employee_Number,
    p.firstname AS First_Name,
    p.lastname AS Last_Name,
    e.salary AS Salary,
    e.salary * 1.03 AS Salary_Increased_By_3_Percent,
    ep.pid AS Project_Number
FROM employee e
INNER JOIN person p ON (e.pid = p.id)
NATURAL JOIN empproject ep;

-- b)
SELECT 
    e.id AS Employee_ID,
    e.number AS Employee_Number,
    p.firstname AS First_Name,
    p.lastname AS Last_Name,
    e.salary AS Salary,
    e.salary * 1.03 AS Salary_Increased_By_3_Percent,
    ep.pid AS Project_Number
FROM employee e
INNER JOIN person p ON (p.id = e.pid)
INNER JOIN empproject ep ON (ep.eid = e.id && ep.pid = p.id)

-- c)
SELECT 
    e.id AS Employee_ID,
    e.number AS Employee_Number,
    p.firstname AS First_Name,
    p.lastname AS Last_Name,
    e.salary AS Salary,
    e.salary * 1.03 AS Salary_Increased_By_3_Percent,
    ep.pid AS Project_Number
FROM employee e
INNER JOIN person p ON (p.id = e.pid)
INNER JOIN empproject ep ON (e.id = ep.eid);



--------------------------------------------------------
---                                                  ---
---                    Questions 4                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 4 ( 25 marks )
 
  a) Create three tables.  Two of the tables will have PRIMARY KEYS (mininum 3 columns in each table) and the third table will have two columns that are the foreign keys to each of the PRIMARY KEYS (6 marks)
 
 b) Populate these table with data (5 marks)
 
 c) Create a SELECT statement using NATURAL JOINS to connect the three tables together (7 marks)
 
 d) Run the Reverse Engineer function in MySQL workbench on these tables and provide the .MWB file in your submission ( 7 marks )
 
*/

-- a)

-- Create table: task
CREATE TABLE task (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    description VARCHAR(255),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (project_id) REFERENCES project(id)
);

-- Create table: employee_details
CREATE TABLE employee_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    employee_number INT NOT NULL UNIQUE,
    note VARCHAR(255) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- Create table: department_details
CREATE TABLE department_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    department_number INT NOT NULL UNIQUE,
    note VARCHAR(255) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

-- Create table: task_assignment
CREATE TABLE task_assignment (
    task_id INT,
    employee_id INT,
    assignment_date DATE,
    PRIMARY KEY (task_id, employee_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- b)

-- Populate table: task
INSERT INTO task (project_id, description, start_date, end_date) VALUES
    (1, 'Develop new feature A', '2024-01-10', '2024-02-15'),
    (1, 'Fix bug in module B', '2024-02-16', '2024-03-01'),
    (2, 'Design UI for project X', '2024-01-20', '2024-03-05'),
    (2, 'Write documentation for project Y', '2024-03-06', '2024-03-20'),
    (3, 'Perform database optimization', '2024-01-15', '2024-02-10'),
    (3, 'Update API endpoints', '2024-02-11', '2024-03-15');

-- Populate table: employee_details
INSERT INTO employee_details (employee_id, employee_number, note) VALUES
    (1, 1001, 'Senior Developer'),
    (2, 1002, 'Junior Developer'),
    (3, 1003, 'UI/UX Designer'),
    (4, 1004, 'Technical Writer'),
    (5, 1005, 'Database Administrator'),
    (6, 1006, 'API Developer');

-- Populate table: department_details
INSERT INTO department_details (department_id, department_number, note) VALUES
    (1, 10, 'Development Team'),
    (2, 20, 'Design Team'),
    (3, 30, 'Documentation Team'),
    (4, 40, 'IT Support Team');

-- Populate table: task_assignment
INSERT INTO task_assignment (task_id, employee_id, assignment_date) VALUES
    (1, 1, '2024-01-10'),
    (1, 2, '2024-01-11'),
    (2, 2, '2024-02-16'),
    (2, 1, '2024-02-17'),
    (3, 3, '2024-01-20'),
    (3, 4, '2024-01-21'),
    (4, 4, '2024-03-06'),
    (4, 3, '2024-03-07'),
    (5, 5, '2024-01-15'),
    (5, 6, '2024-01-16'),
    (6, 6, '2024-02-11'),
    (6, 5, '2024-02-12');

-- c)

SELECT 
    t.id AS task_id,
    t.description AS task_description,
    t.start_date AS task_start_date,
    t.end_date AS task_end_date,
    e.id AS employee_id,
    e.employee_number,
    e.note AS employee_note,
    d.id AS department_id,
    d.department_number,
    d.note AS department_note,
    ta.assignment_date
FROM task t
NATURAL JOIN task_assignment ta
NATURAL JOIN employee_details e
NATURAL JOIN department_details d;

-- d)

-- .mwb file



--------------------------------------------------------
---                                                  ---
---                    Questions 5                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 5 (15 marks)
 
  Write a query that uses INNER JOIN TO connect the EMPLOYEE, EMPPROJACT, PROJACT and PROJECT tables.   Include the Project number , Department number, Project start and end date and AC STAFF  
WHERE They belong to department D11 , Salary is more than or equal to 65 percent of $15,000 AND Salary is less than or equal to 130 percent of $40,000 

   
*/

SELECT 
    p.id AS Project_ID,
    p.number AS Project_Number,
    d.number AS Department_Number,
    d.number AS Department_Name,
    ep.hours_worked AS Hours_Worked,
    p.budget AS Project_Budget
FROM employee e
INNER JOIN empproject ep ON (ep.eid = e.id)
INNER JOIN project p ON (p.id = ep.pid)
INNER JOIN department d ON (e.did = d.id)
WHERE d.name = 'D11'
    AND e.salary >= 0.65 * 15000
    AND e.salary <= 1.30 * 40000
ORDER BY e.salary;



--------------------------------------------------------
---                                                  ---
---                    Questions 6                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 6 (15 marks)
 
 Create a query that lists empno, projno, emptime, emendate.  Left join the project to the empprojact table using projno and left join the act table using actno and then right join employee table using empno. 
 Where projno is AD3113 and empno is 000270 and emptime is greater than 0.5
 
 
*/

SELECT 
    e.id AS Emproyee_ID,
    p.id AS Project_ID,
    ep.hours_worked AS Hours_Worked
FROM employee e
RIGHT JOIN empproject ep ON (ep.eid = e.id)
LEFT JOIN project p ON (p.id = ep.pid)
WHERE 
    p.id = 'AD3113'
    AND e.id = '000270'
    AND ep.hours_worked > 0.5;



--------------------------------------------------------
---                                                  ---
---                    Questions 7                   ---
---                                                  ---
--------------------------------------------------------

/*
 Question 7 (15 marks)
 
  Describe all of the relationships between the tables in the attached image file TableRelationships.jpg
  
  a) describe all the foreign key and primary keys, either by detailing them 1 by 1 or define the CREATE table statements for all the tables (10 marks)

  b) describe the relationship between each table ( 1..1 (exactly one match)  1..n (one or more matches)) (5 marks)

 
  
 */
 