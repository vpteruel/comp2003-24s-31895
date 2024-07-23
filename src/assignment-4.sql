/*
				Assignment 4
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
 
 Write an UPDATE statement to change all of the LASTNAMEs in the EMPLOYEE table to SMITH ( 5 marks )
 
*/

UPDATE EMPLOYEE
SET LASTNAME = 'SMITH';



/*
 Question 2
 
 Write an UPDATE statement to change all of the MAJPROJ records in the PROJECT to AD9999 Where they don't have a value( 5 marks )
 
*/

UPDATE PROJECT
SET MAJPROJ = 'AD9999'
WHERE MAJPROJ IS NULL;



/*
 Question 3
 
 Write a single UPDATE statement to change the QUANTITY to 200 and the LOCATION to Barrie  WHERE the PID has a 1 in the 7th position( 8 marks )
 
*/

UPDATE INVENTORY
SET QUANTITY = 200, LOCATION = 'Barrie'
WHERE SUBSTRING(PID, 7, 1) = '1';



/*
 Question 4
 
 Write an UPDATE statement to change the SALARY to be increased by 10% WHERE EMPLOYEE IS older than 40 years old( 10 marks ) (hint date functions to determine age)
 
*/

UPDATE EMPLOYEE
SET SALARY = SALARY * 1.10
WHERE TIMESTAMPDIFF(YEAR, BIRTHDATE, CURDATE()) > 40;



/*
 Question 5
 
 Write a DELETE statement to remove employee 000030 from the EMPLOYEE table  ( 5 marks )
   
 */

DELETE FROM EMPLOYEE
WHERE EMPNO = '000030';



/*
 Question 6
 
 Write a DELETE statement to remove records where the total of their SALARY and COMM column together is less than $40000  and they have worked for the company for less than 8 years from the STAFF table ( 7 marks )

 */
 
DELETE FROM STAFF
WHERE (SALARY + COMM) < 40000
  AND YEARS < 8;



/*
 Question 7
 
  Write a DELETE statement to remove records WHERE the REGION has South in the name and the SALES DATE is in APRIL in the SALES table  ( 10 marks )
  
 */

DELETE FROM SALES
WHERE REGION LIKE '%South%'
  AND MONTH(SALES_DATE) = 4;
