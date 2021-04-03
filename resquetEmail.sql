USE adventureworks2019

go

if exists (select 1 from sys.objects where name = 'Retornalogin')
begin
drop procedure Retornalogin
end

go

CREATE PROCEDURE Retornalogin  

@email   VARCHAR (40),
@senha varchar (10)
AS
  BEGIN
      SET nocount ON

      SELECT PE.[emailaddress], PP.[PasswordSalt]
      FROM   [Person].[emailaddress] PE
	  JOIN [Person].[Password] PP ON PP.[BusinessEntityID] = PE.[BusinessEntityID]
      WHERE   @email = [emailaddress] AND @senha = [PasswordSalt]

      SET nocount OFF
  END;

  go

--retorno teste
--EXEC Retornalogin   'ken0@adventure-works.com', 'bE3XiWw=' 


 --SELECT top 5 PE.[emailaddress], PP.[PasswordSalt]
      --FROM   [Person].[emailaddress] PE
	  --JOIN [Person].[Password] PP ON PP.[BusinessEntityID] = PE.[BusinessEntityID]
