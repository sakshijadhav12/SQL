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
