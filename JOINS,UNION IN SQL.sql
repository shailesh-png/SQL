USE INFO;
show tables;

CREATE TABLE CUSTOMER1
(
CID INTEGER,
CNAME VARCHAR(20),
AREA VARCHAR(20),
PIN INTEGER,
CONTACT INTEGER
);

SELECT * FROM CUSTOMER1;

INSERT INTO CUSTOMER1 VALUE(10, 'SHUBHAM', 'KOTHRUD' , 411038 , 1234567890);
INSERT INTO CUSTOMER1 VALUES(20, 'VIKAS' , 'BAVDHAN' , 411008 , 0123456789);
INSERT INTO CUSTOMER1 VALUES(30, 'ANIKET' , 'BANER' , 411045 , 0112345678);

CREATE TABLE ORDER1
(
OID INTEGER,
CID INTEGER,
SID INTEGER,
EID INTEGER,
PRICE INTEGER
);

#DROP TABLE ORDER1;
SELECT * FROM ORDER1;

INSERT INTO ORDER1 VALUES(11 , 10 , 111 ,1 , 50);
INSERT INTO ORDER1 VALUES(12 , 20 , 222 ,2 , 100);
INSERT INTO ORDER1 VALUES(13 , 30 , 333 ,3 , 150);

SELECT OID, PRICE ,CNAME
FROM ORDER1
INNER JOIN CUSTOMER1
ON CUSTOMER1.CID=ORDER1.CID; # This query will show only the rows where there is a match between ORDER1.CID and CUSTOMER1.CID
                             # The two tables are joined where their CID (Customer ID) values match
CREATE TABLE SHIPPER1
(
SID INTEGER,
SHANME VARCHAR(20),
PHONE INTEGER
);

INSERT INTO SHIPPER1 VALUE(111, 'BLINKIT' , 1234512345);
INSERT INTO SHIPPER1 VALUE(222, 'ZOMATO' , 1234123412);
INSERT INTO SHIPPER1 VALUE(333, 'BIGBASKET' , 1231231231);

SELECT * FROM SHIPPER1;

SELECT CUSTOMER1.CNAME , ORDER1.OID
FROM CUSTOMER1
LEFT JOIN ORDER1
ON CUSTOMER1.CID=ORDER1.CID;
/* Returns all customers from CUSTOMER1.
If a customer has placed an order (i.e. there’s a matching CID in ORDER1), their OID (Order ID) is shown
If a customer has not placed an order, the OID will be NULL

Alice appears twice because she has two orders.
Charlie appears with NULL because he has no orders.
*/

CREATE TABLE EMPLOYEE1
(
EID INTEGER,
ENAME VARCHAR(20),
DEPNO INTEGER
);

INSERT INTO EMPLOYEE1 VALUE(1 ,'KARTIK' , 10);
INSERT INTO EMPLOYEE1 VALUE(2 ,'PARTH' , 20);
INSERT INTO EMPLOYEE1 VALUE(3 ,'ANSHU' , 30);

SELECT * FROM EMPLOYEE1;

SELECT ORDER1.OID , EMPLOYEE1.ENAME , EMPLOYEE1.DEPNO
FROM ORDER1
RIGHT JOIN EMPLOYEE1
ON ORDER1.EID=EMPLOYEE1.EID;
/* Returns all employees from EMPLOYEE1.
If an employee has handled orders, the order's OID appears.
If an employee has not handled any orders, OID will be NULL.

Alice and Bob appear with their handled orders.
Charlie appears with NULL for OID because he hasn't handled any orders.
*/

SELECT EMPLOYEE1.ENAME , ORDER1.OID
FROM EMPLOYEE1
LEFT JOIN ORDER1
ON EMPLOYEE1.EID=ORDER1.EID;
/* Performs a LEFT JOIN from EMPLOYEE1 to ORDER1 using the EID (Employee ID) column
  it shows the employee name (ENAME)
  and the order ID (OID)
Shows all employees, even if they did not handle any orders
Charlie appears with NULL because he hasn't handled any orders
*/

SELECT ORDER1.OID , CUSTOMER1.CNAME, CUSTOMER1.AREA
FROM ORDER1
RIGHT JOIN CUSTOMER1
ON ORDER1.CID=CUSTOMER1.CID;
/*All customers from CUSTOMER1
Their orders from ORDER1 (if any)
Even if a customer has not placed an order, they will still appear in the result, with OID showing as NULL.
*/


/*SELECT ORDER1.OID , EMPLOYEE1.ENAME , EMPLOYEE1.DEPNO
FROM ORDER1
FULL OUTER JOIN EMPLOYEE1
ON ORDER1.EID=EMPLOYEE1.EID;*/

#----------------------------------------------------------------------------------------------
DROP TABLE CUSTOMER1;
DROP TABLE ORDER1;
DROP TABLE SHIPPER1;
DROP TABLE EMPLOYEE1;
#-----------------------------------------------------------------------------------------------

SELECT CUSTOMER1.CNAME, ORDER1.OID
FROM CUSTOMER1
LEFT JOIN ORDER1
ON CUSTOMER1.CID=ORDER1.CID
UNION
SELECT ORDER1.OID, CUSTOMER1.CNAME
FROM ORDER1
RIGHT JOIN CUSTOMER1
ON ORDER1.CID=CUSTOMER1.CID;
/**/
select * from customer1;


INSERT INTO CUSTOMER1 VALUES(40, 'SAMEER' , 'KOTHRUD' , 411038, 1234512345);
INSERT INTO CUSTOMER1 VALUES(50, 'AMAR' , 'BAVDHAN' , 411008, 1234123412);
INSERT INTO CUSTOMER1 VALUES(60, 'ABHI' , 'BANER' , 411045, 1231231231);

SELECT A.CNAME AS CNAME1, B.CNAME AS CNAME2 , A.AREA
FROM CUSTOMER1 A, CUSTOMER1 B
WHERE A.CID<>B.CID AND A.AREA=B.AREA;

SELECT A.CNAME, B.CNAME, A.AREA
FROM CUSTOMER1 A, CUSTOMER1 B
WHERE A.CID<>B.CID AND A.AREA=B.AREA;

SELECT * FROM CUSTOMER1;


# UNION ANS UNION ALL------


SELECT CNAME FROM CUSTOMER1
UNION
SELECT OID FROM ORDER1; # it combine the cname from customer1 and oid from order1 using union in a single column

SELECT AREA FROM CUSTOMER1
UNION 
SELECT OID FROM ORDER1; # it shows the union of area from customer1 and oid from order1 in a column

SELECT AREA FROM CUSTOMER1
UNION ALL
SELECT OID FROM ORDER1;
/*
UNION ALL combines the results of two SELECT statements without removing duplicates.
this query shows AREA from CUSTOMER1
OID from ORDER1 */

INSERT INTO CUSTOMER1 VALUE(70, 'SAMEER' , 'KOTHRUD' , 411038, 1234567890);

SELECT * FROM ORDER1;
SELECT * FROM SHIPPER1;
SELECT * FROM CUSTOMER1;

ALTER TABLE SHIPPER1 ADD CITY VARCHAR(40) DEFAULT 'PUNE';
/* ALTER TABLE SHIPPER1: Modifies the structure of the SHIPPER1 table
it Adds a new column CITY with a max length of 40 characters and sets its default value to PUNE */

ALTER TABLE SHIPPER1 ADD STATE VARCHAR(40) DEFAULT 'MH'; # AS Similar as add CITY It adds a STATE column with default 'MH'

SELECT AREA FROM CUSTOMER1 
UNION ALL
SELECT CITY FROM SHIPPER1;
/* Combines all values from the AREA column of the CUSTOMER1 table with all values from the CITY column of the SHIPPER1 table.
Uses UNION ALL, so duplicates are kept (unlike UNION, which removes duplicates)

Assuming AREA and CITY are both character types (e.g., VARCHAR), this works without error
The result will use the column name from the first SELECT: in this case, AREA
*/

SELECT AREA FROM CUSTOMER1 WHERE AREA='KOTHRUD'
UNION ALL
SELECT CITY FROM SHIPPER1 WHERE CITY='PUNE';
/* Firstly it selects rows from CUSTOMER1 where AREA = 'KOTHRUD'
Second selects rows from SHIPPER1 where CITY = 'PUNE'
then union all that means it Combines both result sets without removing duplicates
*/

SELECT CNAME,AREA FROM CUSTOMER1 WHERE AREA='KOTHRUD'
UNION ALL
SELECT SID,CITY FROM SHIPPER1 WHERE CITY='PUNE';
/* it combines CNAME and AREA from CUSTOMER1 where AREA = 'KOTHRUD'
SID and CITY from SHIPPER1 where CITY = 'PUNE' 
Using UNION ALL, so duplicates are not removed.
*/


SELECT CID
FROM CUSTOMER1
WHERE EXISTS
(SELECT SID FROM ORDER1 WHERE ORDER1.CID=CUSTOMER1.CID);
/* This query selects all CIDs (Customer ID) from the CUSTOMER1 table where a corresponding entry exists in ORDER1 that means customers who have placed at least one order
*/

SELECT CNAME
FROM CUSTOMER1
WHERE EXISTS
(SELECT SID FROM ORDER1 WHERE ORDER1.CID=CUSTOMER1.CID AND PRICE>60);
/* This query returns the names of customers (CNAME) from the CUSTOMER1 table who have placed at least one order with a PRICE > 60
for each customer in CUSTOMER1, if there’s at least one matching order in ORDER1 with price > 60, their name will appear in the result */

SELECT CNAME
FROM CUSTOMER1
WHERE CID = ANY
(SELECT CID FROM ORDER1 WHERE PRICE=50);
# It shows the names of customers (CNAME) who have placed at least one order with PRICE = 50


SELECT CNAME
FROM CUSTOMER1
WHERE CID = ALL
(SELECT CID FROM ORDER1 WHERE PRICE=50);
/* it means that the value of CID from CUSTOMER1 must be equal to every value returned by the subquery
So this query returns the name of the customer only if there is exactly one unique CID in the subquery, and it matches that customer */






