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