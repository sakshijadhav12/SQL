USE DB;
SELECT * FROM person;
CREATE PROCEDURE PersonExists
    @Id INT
AS 
BEGIN
    IF EXISTS (SELECT * FROM person WHERE Id = @Id)
    BEGIN
        SELECT * FROM person WHERE Id = @Id;
    END
    ELSE 
    BEGIN
        PRINT 'Person does not exist';
    END;
END;
 PersonExists @Id = 4;
 -- crete proc to find between age
 CREATE PROCEDURE Prowithage
 AS
BEGIN
 DECLARE @age INT;
   SELECT @age = age FROM person;
   IF @age > 20 AND @age < 30
   BEGIN 
      SELECT * FROM person WHERE age > 20 AND age < 30;
   END
   ELSE
   BEGIN
      PRINT 'Age is not between 20 and 30';
   END
END;
Prowithage
-- CHECK AND INSERT
CREATE PROC CheckAndInsert
@P_id INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Age INT,
    @City VARCHAR(50)
AS 
BEGIN
 IF EXISTS (SELECT * FROM person WHERE Id = @P_id)
    BEGIN
        SELECT * FROM person WHERE Id = @P_id;
    END
    ELSE 
	BEGIN
	INSERT INTO Person(ID,FName,LNane,age,city)
	VALUES(@P_id,@FirstName,@LastName,@Age,@City);
	END
	END;
CheckAndInsert @P_id = 7, @FirstName = 'Sakshi', @LastName = 'Jadhav', @Age = 21, @City = 'Thane';

----exception handling
CREATE PROCEDURE ProWithExcaption
AS
BEGIN
BEGIN TRY 
UPDATE person SET age='fgt' where id=1
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS[ERROR Number],
ERROR_SEVERITY() AS [ERROR_SEVERITY],
ERROR_LINE() AS[ERROR LINE],
ERROR_STATE()AS [ ERROR STATE NUMBER]
END CATCH;
END;
 ProWithExcaption
--new example 
CREATE PROC ProcWithException
    @num INT,
    @msg VARCHAR(50) OUTPUT 
AS
BEGIN
    BEGIN TRY
        SET @num = 5 / 0;
        PRINT 'This will not execute';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred:';
        SET @msg = ERROR_MESSAGE();
        PRINT @msg;
    END CATCH
END;

DECLARE @errorMessage VARCHAR(200);
EXEC ProcWithException @num = 0, @msg = @errorMessage OUTPUT;
SELECT TOP 1 * FROM person ORDER BY ID desc;

--- INDEX 
CREATE CLUSTERED INDEX PERSON_IDX
ON person(Id Asc)
-- composit index
 create index student_index on StudentsInfo(ROllNo asc,PhoneNo desc);
 --alter index
 alter index student_index on  StudentsInfo rebuild
 -- unique index
  create unique  index std_index on StudentsInfo(ROllNo asc);
   Select * from person
   create unique  index p_index on Person(ID asc); -- its get terminated
  --Drop Index
  Drop Index student_index on StudentsInfo;

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