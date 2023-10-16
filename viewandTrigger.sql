--- VIEW 
  CREATE VIEW People
  AS
  SELECT * FROM person;

  SELECT * FROM People;
  sp_helptext 'People'
 -- drop view
  drop view People

  SELECT * FROM StudentsInfo
  SELECT * FROM courseInfo
  -- complex view
  CREATE VIEW  Student_view
   AS
SELECT Fname, Lname ,marks
FROM StudentsInfo
INNER JOIN courseInfo ON StudentsInfo.RollNo = courseInfo.RollNo;
SELECT * FROM Student_view;
-- update
EXEC sp_refreshview Student_view
 select *from Student_view
 select * from StudentsInfo;
   --scehma binding view
 
   CREATE VIEW VWWITHSCEHMABINDING
   WITH SCHEMABINDING
   AS
   Select RollNo, FName,LName 
   FROM dbo.StudentsInfo;
   ALTER TABLE StudentsInfo DROP COLUMN RollNo; -- will give error
   CREATE VIEW VW
   AS
   SELECT * FROM StudentsInfo;
 SELECT * FROM VW
 -- Insert 
 insert into VW(RollNO,FName,Lname,PhoneNO) 
 VALUES(12,'DFG','kju',23456789)
 --UPDATE
 UPDATE VW SET FName='ritik' WHERE RollNo= 12;
  -- trigger
 --DDL 
CREATE TRIGGER mytrigger
ON DATABASE
FOR CREATE_TABLE ,ALTER_TABLE,DROP_TABLE
AS
BEGIN
PRINT 'you can not create a new table in this database'
ROLLBACK TRANSACTION
END
 create table R
 (
 id int ,
 ui int) -- dose not create table
 -- using group
 CREATE TRIGGER mytriggerusinggroup
ON DATABASE
FOR DDL_TABLE_EVENTS
AS
BEGIN
PRINT ' using a group: you cam not creatte , alter , drop table'
ROLLBACK TRANSACTION
END
-- AUDIT TRIGGER
use Payroll_Service
CREATE TABLE AuditTable (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    EventType NVARCHAR(100),
    EventDDL NVARCHAR(MAX),
    EventDate DATETIME
);

-- Create a DDL trigger
CREATE TRIGGER DDL_Audit
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EventData XML = EVENTDATA();

    INSERT INTO AuditTable (EventType, EventDDL, EventDate)
    VALUES (
        @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(100)'),
        @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(max)'),
        GETDATE()
    );
END;
create Table Tabl1
(id int ,name varchar(60),
city varchar(80));
create Table Tabl2
(id int ,name varchar(60),
city varchar(80));
select * from AuditTable;

--dml 
CREATE TRIGGER tg
ON  Marks
FOR INSERT, UPDATE, DELETE
AS
    PRINT 'You cannot insert, update, or delete from this table i'
    ROLLBACK;
 UPDATE Marks
SET english = 89
WHERE studentid = 101;
-- insret after
CREATE TABLE LogTable (
    LogID INT,
    Event VARCHAR(50),
    ID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    city VARCHAR(50),
    ChangeDateTime DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER AfterInsertTrigger
ON Person
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @InsertedData TABLE (
        ID INT,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        Age INT,
        city VARCHAR(50)
    );

    INSERT INTO @InsertedData (ID, FirstName, LastName, Age, city)
    SELECT ID, FName, LNane, Age,city 
    FROM INSERTED;
  INSERT INTO LogTable (Event, ID, FirstName, LastName, Age, city)
    SELECT 'INSERT', ID, FirstName, LastName, Age, city
    FROM @InsertedData;
	END;
	 INSERT INTO person(ID,FName,LNane,age,city)
	 values(23,'rt','yu',45,'dty');
	 select * from LogTable;
