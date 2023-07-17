USE adventureworks2019;
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE name = 'Retornalogin')
BEGIN
    DROP PROCEDURE Retornalogin;
END
GO

CREATE PROCEDURE Retornalogin  
    @email VARCHAR(40),
    @senha VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT PE.emailaddress, PP.PasswordSalt
    FROM Person.emailaddress PE
    JOIN Person.Password PP ON PP.BusinessEntityID = PE.BusinessEntityID
    WHERE PE.emailaddress = @email
      AND PP.PasswordSalt = @senha;

    SET NOCOUNT OFF;
END;
GO

-- Test the stored procedure
-- EXEC Retornalogin 'ken0@adventure-works.com', 'bE3XiWw=';

-- Example SELECT statement (top 5 records)
-- SELECT TOP 5 PE.emailaddress, PP.PasswordSalt
-- FROM Person.emailaddress PE
-- JOIN Person.Password PP ON PP.BusinessEntityID = PE.BusinessEntityID;
