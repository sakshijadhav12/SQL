use DB;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(50),
    Author VARCHAR(50),
    AuthorCountry VARCHAR(50),
    Publisher VARCHAR(50),
    PublisherCountry VARCHAR(50)
);
INSERT INTO Books (BookID, Title, Author, AuthorCountry, Publisher, PublisherCountry)
VALUES
(1, 'Book 1, BOOK 4', 'ABC', 'USA', 'ABC Publications', 'USA'),
(2, 'Book 2', 'STU', 'INDIA', 'XYZ Books', 'Canada'),
(3, 'Book 3', 'XYZ', 'USA', 'y Publications x publications', 'USA');
SELECT * FROM Books;
-- 1NF
CREATE TABLE BOOKS1 (
    BookID INT ,
    Title VARCHAR(50),
    Author VARCHAR(50),
    AuthorCountry VARCHAR(50),
    Publisher VARCHAR(50),
    PublisherCountry VARCHAR(50)
);
INSERT INTO BOOKS1(BookID, Title, Author, AuthorCountry, Publisher, PublisherCountry)
VALUES
(1, 'Book 1', 'ABC', 'USA', 'ABC Publications', 'USA'),
(2, 'Book 2', 'STU', 'INDIA', 'XYZ Books', 'Canada'),
(3, 'Book 3', 'XYZ', 'USA', 'y Publications', 'USA'),
(3, 'Book 3', 'XYZ', 'USA', ' x publications', 'USA'),
(1, 'Book 4', 'ABC', 'USA', 'ABC Publications', 'USA');
SELECT * FROM BOOKS1;
SELECT * FROM Books;
-- 2NF
CREATE TABLE StudentCourses (
    StudentID INT primary key  ,
    CourseID INT  ,
    CourseName VARCHAR(50));
	
INSERT INTO StudentCourses (StudentID, CourseID, CourseName)
VALUES
(1, 101, 'Math'),
(1, 102, 'English'),
(2, 101, 'Math'),
(3, 102, 'English');
SELECT * FROM StudentCourses;
-- applying 2Nf
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
	 CName VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

INSERT INTO Student (StudentID, StudentName)
VALUES
(1, 'sakshi'),
(2, 'Sneha'),
(3, 'sayali');

INSERT INTO Courses (CourseID, CourseName)
VALUES
(101, 'Math'),
(102, 'English');
SELECT * FROM Student;
select * from Courses;
--3NF
CREATE TABLE Employees (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    EMP_ZIP INT,  
    EMP_STATE VARCHAR(50),
    EMP_CITY VARCHAR(50)
);

INSERT INTO Employees (EMP_ID, EMP_NAME, EMP_ZIP, EMP_STATE, EMP_CITY)
VALUES
(111, 'lisa', 421503, 'Thane', 'Badlapur'),
(333, 'Teju', 421501, 'Panvel', 'Panvel'),
(444, 'Priyanka', 603007, 'Raigad', 'Pen'),
(555, 'Rutika', 863899, 'Thane', 'Ambernath'),
(666, 'Siddhvedh', 4620079, 'Raigad', 'Karjat');
-- applying 3Nf
CREATE TABLE Employee (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    EMP_ZIP INT
);
INSERT INTO Employee (EMP_ID, EMP_NAME, EMP_ZIP)
VALUES(111 , 'lisa', 421503),
(333, 'Teju', 421501),
(444, 'Priyanka', 603007),
(555, 'Rutika', 863899),
(666, 'Siddhvedh', 4620079);
CREATE TABLE Employe_add (
    EMP_ZIP INT,
	 EMP_STATE VARCHAR(50),
    EMP_CITY VARCHAR(50)
);
INSERT INTO Employe_add(EMP_ZIP,EMP_STATE,EMP_CITY)
VALUES(421503, 'Thane', 'Badlapur'),
( 421501, 'Panvel', 'Panvel'),
( 603007, 'Raigad', 'Pen'),
( 863899, 'Thane', 'Ambernath'),
( 4620079, 'Raigad', 'Karjat');
SELECT * FROM Employee;
SELECT * FROM Employe_add;
--BCNF
CREATE TABLE EmployeeDepartments (
    EMPID INT,
    EMPCOUNTRY VARCHAR(50),
    EMPDEPT VARCHAR(50),
    DEPTTYPE VARCHAR(50),
    EMPDEPTNO INT,
    PRIMARY KEY (EMPID, EMPDEPTNO)
);

INSERT INTO EmployeeDepartments (EMPID, EMPCOUNTRY, EMPDEPT, DEPTTYPE, EMPDEPTNO)
VALUES
(2, 'India', 'Designing', 'D1', 23),
(2, 'India', 'Testing', 'D1', 30),
(32, 'UK', 'Stores', 'D2', 232),
(32, 'UK', 'Developing', 'D2', 59);
-- applying BCNF
CREATE TABLE EMP_COUNTRY
( EMPID INT,
    EMPCOUNTRY VARCHAR(50));
INSERT INTO EMP_COUNTRY(EMPID,EMPCOUNTRY)
VALUES(2, 'India'),
(32, 'UK');
CREATE TABLE Departments (
    EMP_DEPT VARCHAR(50),
    DEPT_TYPE VARCHAR(50),
    EMP_DEPT_NO INT,
    PRIMARY KEY (EMP_DEPT_NO)
);
INSERT INTO Departments ( EMP_DEPT, DEPT_TYPE, EMP_DEPT_NO)
VALUES
( 'Designing', 'D1', 23),
( 'Testing', 'D1', 30),
('Stores', 'D2', 232),
( 'Developing', 'D2', 59);
CREATE TABLE MAPPINGTABLE(
EMP_ID  int, 
EMP_DEPT int);
INSERT INTO MAPPINGTABLE(EMP_ID,EMP_DEPT)
VALUES(2, 23),
(2, 30),
(32,  232),
(32,59);
SELECT * FROM  EMP_COUNTRY;
SELECT * FROM Departments;
SELECT * FROM MAPPINGTABLE;
--CTE
CREATE TABLE person (
    ID int ,
	FName varchar(50),
	LNane varchar(50),
	age int,
	city varchar(50));
	INSERT INTO person(ID ,FName,LNane,age,city)
	values(1,'Aitya','Patil',22,'Thane'),
	(4,'pratik','Dusane',30,'Vashi'),
	(5,'Shewta','Patil',23,'Sion'),
	(6,'Aditya','Chavan',20,'Kurla'),
	(6,'Sakshi','Jadhav',21,'Thane'),
	(9,'Priya','Kapoor',34,'Vashi'),
	(10,'aisha','Negi',32,'Thane');
	-- SIMPLE CTE  
	WITH CTE_1 AS (
    SELECT * FROM person WHERE age > 22)
SELECT * FROM CTE_1;
--  MULTIPLE CTE 
WITH CTE1 AS (
 SELECT * FROM person WHERE age < 25
),
CTE2 AS (
    SELECT * FROM CTE1 WHERE city = 'Thane'
)
SELECT * FROM CTE2;
--COUNT
WITH CTE_1 AS (
    SELECT * FROM person WHERE city ='Vashi')
	SELECT COUNT(*) from CTE_1;
--AVG
WITH AvgCTE AS (
 SELECT AVG(age) AS average_age FROM person
)
SELECT * FROM AvgCTE;
--Passing Column CTE
WITH CTE_NEW (ID ,FName,age)
AS
(SELECT  ID ,FName ,age FROM person WHERE age > 30)
SELECT  * FROM CTE_NEW;
-- CTE 
WITH CTE_1 AS (
 SELECT 
  FName, 
  SUM(age) AS total_age
  FROM  person
  WHERE 
 city='Thane'
  GROUP BY 
  FName
)

SELECT 
    FName,
    total_age
FROM 
    CTE_1;

	-- CTE 
	WITH cte_new (city, count_person) AS (
    SELECT
        city,
        COUNT(*) as count_person
    FROM
        person
    WHERE
        age > 30
    GROUP BY
        city
)

SELECT
    city,
    count_person
FROM
    cte_new;
	-- store procedure 
	
	CREATE PROCEDURE Pro2
	
	AS
	BEGIN 
	SELECT * FROM Person;

	END;
	-- calling Procedure 
	Pro1;
	-- read procedure
sp_helptext Pro1;
-- parameter passing 
CREATE PROC PersonDeatail
AS
BEGIN SELECT * FROM person WHERE age>20
END;
PersonDeatail;
-- alter procedure
ALTER PROC pro1
AS BEGIN 
SELECT FName FROM person
END;
-- DROP
DROP PROC pro1;
Pro1;
-- parameter passing
SELECT * FROM Employees;
CREATE PROC PRO1
@EMP_ID INT,
@EMp_CITY varchar(50)
AS
BEGIN
SELECT * FROM Employees WHERE EMP_ID = @EMP_ID
SELECT * FROM Employees WHERE EMP_CITY = @EMp_CITY
END;
PRO1 333,'Pen';
-- output 
CREATE  PROC PRO2
@Age1 INT,
@AGE2 Int ,
@TOTAL INT OUTPUT
AS
BEGIN
SET @TOTAL= @Age1 +@AGE2;
END;
DECLARE @TOTAL_AGE INT 
EXEC PRO2 34,20,@TOTAL_AGE  OUTPUT;
SELECT @TOTAL_AGE;
-- Functions
CREATE FUNCTION ShowMessage()
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'Functions in SQL'
END;
SELECT dbo.ShowMessage() ;

-- input parameter 
CREATE FUNCTION AddNums
(
    @Num1 INT,
    @Num2 INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT
    SET @Result = @Num1 + @Num2
    RETURN @Result
END
SELECT dbo.AddNums(5, 7);
-- retuning a table
CREATE FUNCTION GETDeatil
(
    @ID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT FName,city
    FROM Person
    WHERE ID = @ID
)
SELECT * FROM GETDeatil(1);
--ALTER
ALTER FUNCTION ShowMessage()
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'function in SQL SERVER'
END;
SELECT dbo.ShowMessage() ;

