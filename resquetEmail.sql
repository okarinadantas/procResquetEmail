USE adventureworks2019

go

if exists (select 1 from sys.objects where name = 'Retornalogin')
begin
drop procedure Retornalogin
end

go 

--SELECT *
--FROM   [Person].[emailaddress]

go

CREATE PROCEDURE Retornalogin  @email   VARCHAR (40)
AS
  BEGIN
      SET nocount ON

      SELECT [emailaddress]
      FROM   [Person].[emailaddress]
      WHERE   @email = [emailaddress]

      SET nocount OFF
  END;

  go


--EXEC Retornalogin   'janice0@adventure-works.com' 


