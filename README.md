# procResquetEmail
Retorna E-mail

Para criação dessa procedure foi utilizada a base de teste adventureworks2019 da ms sql server;
A proc tem uma chamada simples:

1. Peço que seja informado o email:

> Retornalogin  @email   VARCHAR (40)

2. Valido se há na base:

> SELECT [emailaddress]
      FROM   [Person].[emailaddress]
      WHERE   @email = [emailaddress]
      
      
3. Para ajudar no processo de teste usei a função **if exist** que 
valida se o que eu preciso da base, no caso a procedure criada já existe, se sim exclui e cria denovo;

> if exists (select 1 from sys.objects where name = 'Retornalogin')
