DECLARE @FirstName NVARCHAR(50)
DECLARE @LastName NVARCHAR(50)
DECLARE @PhoneNumber INT
DECLARE @Location NVARCHAR(50)
DECLARE @Age INT

DECLARE groupCursor CURSOR FOR
SELECT name, lastname, PHONENO, LOCATION, AGE
FROM [dbo].[group]

OPEN groupCursor
FETCH NEXT FROM groupCursor INTO @FirstName, @LastName, @PhoneNumber, @Location, @Age

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Name: ' + @FirstName + ' ' + @LastName + ', Phone: ' + CAST(@PhoneNumber AS NVARCHAR(20)) + ', Location: ' + @Location + ', Age: ' + CAST(@Age AS NVARCHAR(10))
    FETCH NEXT FROM groupCursor INTO @FirstName, @LastName, @PhoneNumber, @Location, @Age
END

CLOSE groupCursor
DEALLOCATE groupCursor
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

  
