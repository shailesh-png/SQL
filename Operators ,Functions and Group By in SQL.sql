#operators------


##arithmatic operators

show databases;
use test1;

CREATE TABLE employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    edepartment VARCHAR(50),
    esalary DECIMAL(10, 2),
    deptno INT
);

INSERT INTO employee (eid, ename, edepartment, esalary, deptno)
VALUES
(101, 'Alice Johnson', 'HR', 55000.00, 1),
(102, 'Bob Smith', 'Finance', 62000.00, 2),
(103, 'Charlie Lee', 'IT', 70000.00, 3),
(104, 'Diana Patel', 'Marketing', 58000.00, 4),
(105, 'Ethan Brown', 'IT', 73000.00, 3),
(106, 'Fiona Davis', 'Finance', 61000.00, 2),
(107, 'George Clark', 'HR', 56000.00, 1),
(108, 'Hannah Lewis', 'Marketing', 60000.00, 4),
(109, 'Ian Moore', 'IT', 71000.00, 3),
(110, 'Julia Turner', 'HR', 54000.00, 1);

select * from employee;

# NEW SALARY:
SELECT ESALARY+3000 AS "NEW_SAL" , ESALARY FROM EMPLOYEE;  ##3000 added in each salary as new salary

# ANNUAL SALARY:
SELECT ESALARY*12 AS "ANNUAL_SALARY" , ESALARY FROM EMPLOYEE;  ##each esalary multiplyed by 12 as shown in annual salary

    
# ANNUAL SALARY WITH BONUS:
SELECT (ESALARY+300)*12  AS " ANNUAL_SALARY_WITH_BONUS" , ESALARY FROM EMPLOYEE;  ##firstly 300 added in esalary and then it multiplyed by 12 then we get annual salary with bonus


## INSERTING DATA INTO TABLE---

INSERT INTO EMPLOYEE VALUES(1, 'SHUBHAM' , 'IT', 50000 , 10);
INSERT INTO EMPLOYEE VALUES(2, 'ASHWINI' , 'IT', 60000 , 10);
INSERT INTO EMPLOYEE VALUES(3, 'ANIKET' , 'IT', 70000 , 10);
INSERT INTO EMPLOYEE VALUES(4, 'PARTH' , 'IT', 50000 , 10);
INSERT INTO EMPLOYEE VALUES(5, 'VIKAS' , 'IT', 60000 , 10);
INSERT INTO EMPLOYEE VALUES(6, 'ANSHU' , 'IT', 70000 , 10);
INSERT INTO EMPLOYEE VALUES(7, 'MADHURI' , 'COMPUTER', 70000 , 10);

SELECT * FROM EMPLOYEE;

# DISTINCT VALUE---
SELECT DISTINCT ESALARY FROM EMPLOYEE;  # THE VALUES APPEARING MORE THAN ONCE ARE REMOVED


##  relational operator--

# SELECT WITH CONDITION--

## SHOW 1 EMPLOYEE DATA--
SELECT * FROM EMPLOYEE WHERE  ENAME='SHUBHAM'; # IT SHOWS THE ROWS WHERE ENAME IS SHUBHAM

# SHOW DEPARTMENT WISE DATA--
SELECT * FROM EMPLOYEE WHERE EDEPARTMENT='COMPUTER'; # IT SHOWS THE ROWS WHERE EDEPT IS COMPUTER


SELECT * FROM EMPLOYEE WHERE EID=4;  #  Returns the row where employee ID is exactly 4
SELECT * FROM EMPLOYEE WHERE EID!=4; #  Returns all rows where employee ID is NOT 4
SELECT * FROM EMPLOYEE WHERE ESALARY> 60000; # Returns all employees earning more than 60,000
SELECT * FROM EMPLOYEE WHERE ESALARY< 60000; # Returns all employees earning less than 60,000
SELECT * FROM EMPLOYEE WHERE ESALARY >=50000; # Returns all employees earning 50,000 or more
SELECT * FROM EMPLOYEE WHERE ESALARY <=50000; # Returns all employees earning 50,000 or less

# BETWEEN OPERATOR--

SELECT * FROM EMPLOYEE WHERE ESALARY BETWEEN 60000 AND 80000; # it shows the record where esalary is between 60000 80000 including 60000 and 80000
SELECT * FROM EMPLOYEE WHERE EID BETWEEN 2 AND 5; # it shows the employees whose eid is between 2 and 5 including 2 and 5
SELECT * FROM EMPLOYEE WHERE ENAME BETWEEN 'A' AND 'S'; # it shows the employees whose ename is between A and S(in alphabetical order) including A and S

select * from employee;

## In clause--

SELECT * FROM EMPLOYEE WHERE EDEPARTMENT IN('IT' , 'COMPUTER'); # it shows all employees who are in IT or computer department
SELECT * FROM EMPLOYEE WHERE EID IN(1,3,5,7); # it shows all employees whos eid is 1,3,5,7


## Like operators-- 

SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'A%'; # shows all employee record where ename starts with A
# % -it matches any no of character incuding none

SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'AN%'; # shows all employee record where ename start with AN
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%I'; # shows all emplyoee record where ename end with I
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%R__'; # its shows record End with exactly 3 characters and the last 3 characters end with R followed by two more characters
/*
Breakdown:

1) % matches any number of characters before the last 3.

2)'R' must be at the third-to-last position.

3)__ matches exactly two characters.*/


CREATE TABLE A
(
ID INTEGER,  # id-an interger identifier
COMPLETED BOOLEAN # a boolean column that stores either true or false
);



SHOW TABLES;

INSERT INTO A VALUES(1, TRUE); # true-1
INSERT INTO A VALUES(2, FALSE);# false-0
INSERT INTO A VALUES(3, TRUE);
INSERT INTO A VALUES(4, FALSE);
INSERT INTO A VALUES(5, TRUE);

SELECT * FROM A;

# Is true and Is false---

SELECT * FROM A WHERE COMPLETED IS TRUE; # it shows rows where completed is true
SELECT * FROM A WHERE COMPLETED IS FALSE; # it shows rows where completed is false

SELECT * FROM EMPLOYEE WHERE ENAME IS NULL; # shows all rows from employee where the ename has null values.i.e,no name was provided or it is midding

# AND and OR ----
SELECT * FROM EMPLOYEE WHERE EDEPARTMENT = 'COMPUTER' AND ESALARY = 90000; # it shows employees from computer department whose salary is 90000
                                                                             #both condition must be true
SELECT * FROM EMPLOYEE WHERE EDEPARTMENT = 'COMPUTER' AND DEPNO=30 AND ESALARY=60000; # it shows employees from the computer department Whose depno is 30 and whose salary is 60000
																					  # all three condition must be true

SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'A%' OR ENAME LIKE 'X%'; # it shows all employees whose name start with A or X
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'A%' OR EDEPARTMENT LIKE 'IT' AND ESALARY<60000; # it shows employees whose names start with A OR employees who are in the IT department and have a salary less than 60,000
### Important--IN SQL AND HAS HIGHER IMPORTANCE THAN R
### SO THE ACTUAL LOGIC IS ITEREPTED AS
/* WHERE ENAME LIKE 'A%' 
   OR (EDEPARTMENT LIKE 'IT' AND ESALARY < 60000); */


# NOT,NOT IN,IS NOT----


SELECT * FROM EMPLOYEE WHERE ENAME NOT LIKE 'M%'; # output does not show ename start with letter M
SELECT * FROM EMPLOYEE WHERE EDEPARTMENT NOT IN ('IT','COMPUTER'); # it shows the records which does not contain edept IT and edept COMPUTER 
SELECT * FROM EMPLOYEE WHERE EDEPARTMENT IS NOT NULL; # it shows all rows where edepartment is not null
                                                      # only employees who have department assigned



SELECT * FROM EMPLOYEE WHERE ENAME NOT LIKE '%I' AND EDEPARTMENT='IT';
# not like %I--it will not show enames end with I
/*Combined with AND EDEPARTMENT = IT — this filters to--
Employees in the IT department whose names do not end with I*/

SELECT * FROM EMPLOYEE WHERE ENAME NOT LIKE '_____';
/* '_____' (5 underscores) matches names with exactly 5 characters
   NOT LIKE '_____' shows only those names that are exactly 5 characters long
   So names with 4 or 6+ characters will be shown in output  */
   
SELECT * FROM EMPLOYEE WHERE ESALARY NOT BETWEEN 60000 AND 80000; # it shows esalary which is not between 60000 and 80000 including 60000,80000.

SELECT * FROM EMPLOYEE ORDER BY ESALARY; # it shows all employee records by ESALARY in ascending order (lowest to highest)
SELECT * FROM EMPLOYEE ORDER BY ESALARY ASC; # same as ORDER BY ESALARY query
SELECT * FROM EMPLOYEE ORDER BY ESALARY DESC; # it shows all employees by salary from highest to lowest
SELECT * FROM EMPLOYEE ORDER BY ESALARY DESC, DEPTNO DESC; # First sorts by ESALARY descending
                                                          # If multiple employees have the same salary, then sorts those by DEPNO descending

SELECT * FROM EMPLOYEE ORDER BY 4;
/*Sorts rows based on the 4th column in the EMPLOYEE table.
This depends on the column order in the table definition. For example:
If 4th column is EDEPARTMENT, then this sorts alphabetically by department.
*/
SELECT ENAME,ESALARY FROM EMPLOYEE ORDER BY ESALARY DESC; 
/*Selects only ENAME and ESALARY
ORDER BY ESALARY DESC means-- sort by the ESALARY column IN descending */


# UPPERCASE AND LOWERCASE----
SELECT * FROM EMPLOYEE;
SELECT UPPER(ENAME) FROM EMPLOYEE; # Converts all characters in the ENAME column to uppercase(E.G,shubham-SHUBHAM)
SELECT LOWER(ENAME) FROM EMPLOYEE; # Converts all characters in the ENAME column to uppercase(E.G,SHUBHAM-shubham)


# CONCAT FUNCTION---
SELECT CONCAT(ENAME, EDEPARTMENT) AS EXAMPLE FROM EMPLOYEE; # it directly joins ename and edepartment with no space or seperator
SELECT CONCAT(ENAME , ' IS FROM ' , EDEPARTMENT , ' DEPARTMENT') AS EXAMPLE FROM EMPLOYEE; # it builds a sentense "SHUBHAM IS FROM IT DEPARTMENT"
SELECT CONCAT(ENAME , ' SALARY IS ' ,  ESALARY) AS EXAMPLE FROM EMPLOYEE; # IT ALSO BUILDS A STATEMENT SHUBHAM SALARY IS 50000.00
SELECT CONCAT(CONCAT(ENAME, ' IS FROM ' ), EDEPARTMENT) AS EXAMPLE FROM EMPLOYEE; 


# LENGTH() AND REPLACE()------
SELECT ENAME,LENGTH(ENAME) FROM EMPLOYEE; # it shows each employee's name (ENAME) and the number of characters in it.
SELECT ENAME, REPLACE(ENAME, 'A', 'X') AS RES FROM EMPLOYEE; # Replaces every uppercase 'A' in ENAME with 'X'
                                                             # Only uppercase 'A' is affected (case-sensitive in most systems)

SELECT * FROM EMPLOYEE WHERE LENGTH(ENAME)=5; # it shows only those employees whose names are exactly 5 characters long


use test1;
#SUBSTRING FUNCTION---SUBSTR
SELECT * FROM EMPLOYEE WHERE SUBSTR(ENAME, 3, 1) ='R'; # This selects all employees from the EMPLOYEE table where the third character of their name (ENAME) is R

#INSTR()---FIND POSITION OF SUBSTRING
SELECT * FROM EMPLOYEE WHERE INSTR(ENAME, 'WI'); # This selects all employees whose name (ENAME) contains the substring WI

SELECT ASCII('a'); # it shows the ascii value of character a
select * from employee;


#LPAD AND RPAD FUNCTION---
SELECT LPAD('TECH' , 8 ,'*'); # This adds padding characters to the left of 'TECH' until the total length is 8
                              # 'TECH' is 4 characters, so it adds 4 asterisks to the left.(****TECH)
SELECT RPAD('TECH' , 8 ,'0'); # This adds padding characters to the right of 'TECH' until the total length is 8
                              # TECH is 4 characters, so it adds 4 zeros to the right

SELECT RPAD(ENAME, 7, '*') FROM EMPLOYEE; 
/*
This query retrieves all employee names (ENAME) from the EMPLOYEE table.
It right-pads each name with '*' so that the total length becomes 7 characters.
If the name is shorter than 7 characters, it adds '*' on the right.
If the name is exactly 7 characters, it stays the same.
If the name is longer than 7 characters, it gets truncated to 7 characters.
*/

SELECT ENAME,LTRIM(ENAME) FROM EMPLOYEE; # LTRIM() removes leading spaces (spaces at the start of the string)
SELECT ENAME,RTRIM(ENAME) FROM EMPLOYEE; # RTRIM() removes trailing spaces (spaces at the end of the string)

INSERT INTO EMPLOYEE VALUE(10, ' ALISHA ' , 'COMPUTER' , 90000, 30);
SELECT * FROM EMPLOYEE;


#AGGREGATE FUNCTIONS---

SELECT COUNT(EID) FROM EMPLOYEE; # Counts the number of employees with a non-NULL EID and returns the no of employees
SELECT MIN(ESALARY) FROM EMPLOYEE; # Finds the lowest salary among all employees and returns the minimum ESALARY value
SELECT MAX(ESALARY) FROM EMPLOYEE; # Finds the highest salary among all employees and returns the maximum esalary value
SELECT AVG(ESALARY) FROM EMPLOYEE; # Calculates the average salary and returns the mean of all esalary values
SELECT SUM(ESALARY) FROM EMPLOYEE; # Adds up all employee salaries and and returns the total salary expense 


SELECT COUNT(EID) AS COUNTS FROM EMPLOYEE; #  Counts the number of non-NULL EID values in the EMPLOYEE table

SELECT MIN(ESALARY) AS MINIMUM_SALARY,EID FROM EMPLOYEE GROUP  BY EID;

SELECT ENAME, COUNT(*) FROM EMPLOYEE GROUP BY ENAME; # it shows the count of how many times each employee name (ENAME) appears in the table
                                                     # Finding duplicate names or how many employees share the same name
SELECT COUNT(*) FROM EMPLOYEE WHERE (EDEPARTMENT='COMPUTER'); # Counts all rows where the department is 'COMPUTER'
SELECT COUNT(EDEPARTMENT) FROM EMPLOYEE WHERE (EDEPARTMENT='COMPUTER'); # Counts how many values are in EDEPARTMENT for rows where EDEPARTMENT = 'COMPUTER'
SELECT COUNT(EID) FROM EMPLOYEE WHERE ESALARY>80000; #  it shows Counts of how many employees have a salary greater than 80,000, assuming EID is not NULL
SELECT COUNT(DISTINCT ESALARY) FROM EMPLOYEE; # it shows the number of unique salary values in the ESALARY column

SELECT COUNT(*), DEPTNO , ESALARY FROM EMPLOYEE GROUP BY  DEPTNO,ESALARY; # Groups the EMPLOYEE table by department number (DEPNO) and salary (ESALARY)
                                                                          # Counts how many employees share the same department and exact same salary
SELECT COUNT(*), DEPTNO FROM EMPLOYEE WHERE DEPTNO IN(10,20,30) GROUP BY DEPTNO; # Filters the EMPLOYEE table to include only rows where DEPNO is 10, 20, or 30
                                                                                 # Then, it groups by DEPNO and counts how many employees are in each of those departments

SELECT SUM(ESALARY) FROM EMPLOYEE WHERE DEPTNO=30; # Adds up all ESALARY values for employees whose department number (DEPNO) is 30
SELECT EID,SUM(ESALARY) FROM EMPLOYEE GROUP BY EID; # Groups by EID and sums the salary for each employee.
/* If EID is unique, this will just return the same ESALARY as the original value per employee (since there's nothing to "sum" in one row)
If employees have multiple rows (e.g. monthly salary records), then this would correctly compute total salary per employee */

SELECT SUM(ESALARY*6) FROM EMPLOYEE; # Multiplies each ESALARY by 6 and sums up the result

SELECT AVG(ESALARY) FROM EMPLOYEE; # Calculates the average salary of all employees
SELECT AVG(ESALARY) FROM EMPLOYEE WHERE EDEPARTMENT = 'COMPUTER'; # Calculates the average salary of employees only in the 'COMPUTER' department
SELECT * FROM EMPLOYEE WHERE ESALARY< (SELECT AVG(ESALARY) FROM EMPLOYEE); #  shows all employee records where the salary is below the overall average.
SELECT AVG(ESALARY), DEPTNO FROM EMPLOYEE GROUP BY DEPTNO; # Calculates the average salary for each department



