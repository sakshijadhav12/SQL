USE DB; 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber BIGINT
);
CREATE SCHEMA  Myschema;
CREATE TABLE Myschema.Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber BIGINT
);
INSERT INTO  Myschema.Customers(CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES 
    (101, 'sakshi', 'jadhav', 'sakshijadhav@.com', 12345678),
    (102, 'Smith', 'yadav', 'smith@example.com', 234567890),
    (103, 'racheal ', 'green', 'friends@example.com', 678526768),
	(104, 'joey', 'asjgaj', 'joey@example.com', 2345678760),
    (105, 'ross ', 'geller', 'friends@example.com', 6785890768);
	SELECT * FROM Myschema.Customers;

	SELECT 
   *
FROM 
    Myschema.Customers
	WHERE 
    CustomerID = 101;
	ALTER TABLE Myschema.Customers
ADD City VARCHAR(50);
	UPDATE  Myschema.Customers
	SET City = 'badlapur'
	 where CustomerID =101;
	 UPDATE  Myschema.Customers
	SET City = 'dadar'
	 where CustomerID =104;
	 SELECT * FROM Myschema.Customers;
   SELECT
    *
FROM
    Myschema.Customers
WHERE
    City = 'badlapur'
ORDER BY
    FirstName DESC;
	SELECT
    City, FirstName, LastName
FROM
    Myschema.Customers
ORDER BY
    City, FirstName;
        
  SELECT
    City, FirstName, LastName
FROM
    Myschema.Customers
ORDER BY
   
	 LEN(FirstName) ASC;
	 SELECT
     FirstName, LastName,CustomerID
FROM
    Myschema.Customers
ORDER BY
    City;

      SELECT
     FirstName, LastName,CustomerID
FROM
    Myschema.Customers
ORDER BY
    1,2;
  SELECT
     *
FROM
    Myschema.Customers
ORDER BY
    FirstName
	Offset 2 rows; 
	fetch
	 SELECT *
FROM Myschema.Customers
ORDER BY FirstName
OFFSET 2 ROWS
FETCH NEXT 2 ROWS ONLY;
SELECT TOP 2 *
FROM Myschema.Customers
ORDER BY 
    City ;
  
  SELECT TOP 2 PERCENT  *
FROM Myschema.Customers
ORDER BY 
    City ;
	SELECT TOP 3 WITH TIES *
	FROM Myschema.Customers
ORDER BY 
    City ;

	SELECT DISTINCT
    City
FROM
    Myschema.Customers
ORDER BY
    City;
	SELECT * FROM  Myschema.Customers
WHERE
    CustomerID=101  AND City = 'badlapur';
SELECT * FROM  Myschema.Customers
WHERE
    CustomerID=101  OR City = 'badlapur';
SELECT * FROM  Myschema.Customers
WHERE FirstName LIKE 's%'
SELECT * FROM  Myschema.Customers
WHERE FirstName LIKE '%h'
SELECT * FROM  Myschema.Customers
WHERE FirstName LIKE '%h'
SELECT * FROM  Myschema.Customers
WHERE FirstName LIKE 'r%h'
SELECT * FROM  Myschema.Customers
WHERE FirstName LIKE  '[r-z]%'

SELECT * FROM  Myschema.Customers
WHERE FirstName NOT LIKE 'A%'
ALTER TABLE Myschema.Customers
ADD age int;
UPDATE  Myschema.Customers
	SET age = 20
	 where CustomerID =101;
UPDATE  Myschema.Customers
	SET age = 22
	 where CustomerID =102;
	 UPDATE  Myschema.Customers
	SET age = 25
	 where CustomerID =103;
	 UPDATE  Myschema.Customers
	SET age = 50
	 where CustomerID =104;
	 UPDATE  Myschema.Customers
	SET age = 33
	 where CustomerID =105;
	 SELECT
    *
FROM
   Myschema.Customers
WHERE
  CustomerID IN (101, 104)
ORDER BY
   CustomerID;
   SELECT 
   CustomerID,FirstName
    FROM Myschema.Customers
   where 
  CustomerID IN (101, 104)
  group by
  CustomerID,FirstName
ORDER BY
   CustomerID;
  SELECT * FROM Myschema.Customers;
  SELECT
    city,
    COUNT (CustomerID) customer_count
FROM
    Myschema.Customers
GROUP BY
    City
ORDER BY
    City;
	SELECT
    FirstName,
    LastName,
    MAX(age) AS max_age,
    MIN(age) AS min_age
FROM
    Myschema.Customers
GROUP BY
    FirstName, LastName
	order by 
	 FirstName, LastName;
SELECT
    CustomerId,
    FirstName,
    LastName,
    COUNT(City) AS Count_city
FROM
    Myschema.Customers
GROUP BY
    CustomerId, FirstName, LastName
HAVING
    COUNT(City) >= 2
ORDER BY
    CustomerId;
SELECT
    FirstName,
    LastName,
    MAX(age) AS max_age,
    MIN(age) AS min_age
FROM
    Myschema.Customers
GROUP BY
    FirstName, LastName
	HAVING
	 MAX (age) > 60 OR MIN (age) < 10

	order by 
	 FirstName, LastName;
select * from   Myschema.Customers;
create table Myschema.sales
( SaleId INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Quantity INT,
    SaleDate DATE,
    CustomerId INT,);
INSERT INTO Myschema.sales (SaleId, ProductName, Quantity, SaleDate, CustomerId)
VALUES (1, 'Product A', 10, '2023-10-04', 101),
(2,'product B',5,'2023-4-12',102),
(3,'product C',20,'2023-9-10',103),
(4,'product d',6,'2023-9-12',104),
(5,'product e',10,'2023-6-12',105);
Select * from Myschema.sales;
SELECT 
    
    CustomerID,
	FirstName
FROM  
    Myschema.Customers
UNION
SELECT 
    SaleId,
    ProductName
FROM 
    Myschema.sales;
	SELECT
    COUNT (*)
FROM
    Myschema.Customers
      
SELECT
    COUNT (*)
FROM
   Myschema.sales;
SELECT 
    CustomerID,
    FirstName
FROM  
    Myschema.Customers
UNION
SELECT 
    SaleId,
    ProductName
FROM 
    Myschema.sales
ORDER BY
    SaleId;
Alter table Myschema.Sales
add city varchar(50);
UPDATE Myschema.Sales
set city = 'Dader'
where SaleId = 5; 
SELECT * FROM Myschema.sales;
SELECT City
From Myschema.Customers
INTERSECT
SELECT city From Myschema.sales;
SELECT City
From Myschema.Customers
EXCEPT
SELECT city From Myschema.sales;
SELECT CustomerID
FROM Myschema.Customers

EXCEPT

SELECT SaleId
FROM Myschema.sales

ORDER BY CustomerID;
INSERT INTO Myschema.sales (SaleId, ProductName, Quantity, SaleDate, CustomerId)
VALUES (6, 'Product k', 10, '2023-11-04', 106);
SELECT CustomerID
FROM Myschema.Customers

EXCEPT

SELECT CustomerId
FROM Myschema.sales
SELECT
    SaleId,
    ProductName,
    Quantity,
    SaleDate,
    CustomerId,
    SUM(Quantity) AS TotalQuantity
from
    Myschema.sales
GROUP BY
    GROUPING SETS (
        (SaleId, ProductName, Quantity, SaleDate, CustomerId), 
        (SaleId, ProductName, Quantity, SaleDate),
        (SaleId, ProductName, Quantity),
        (SaleId, ProductName),
        (SaleId, SaleDate),
        (CustomerId),
        ()
     );
	SELECT
	 SaleId, ProductName,
	 SUM(Quantity) AS TotalQuantity
	From Myschema.sales
	group by 
	cube(SaleId,
    ProductName);
SELECT
	 SaleId, ProductName,
	 SUM(Quantity) AS TotalQuantity
	From Myschema.sales
	group by 
	ROLLUP (SaleId,
    ProductName);


   