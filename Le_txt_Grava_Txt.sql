/* LAYOUT do Arquivo
1234;'Teste Linha 1'
2345;'Teste Linha 2'
*/

CREATE TABLE TesteERF
( c1 INT,
  c2 VARCHAR(50) )

BULK INSERT TesteERF
FROM '\\brarjo1ca017\tmp\TesteERF.txt'
WITH ( FIELDTERMINATOR = ';',
       ROWTERMINATOR = '\n')

SELECT * FROM TesteERF

DROP TABLE TesteERF

DECLARE @cmd sysname, @Texto sysname
SET @Texto = 'Processamento realizado'
SET @cmd = 'echo ' + @Texto + ' > \\brarjo1ca017\tmp\testeerf.ok'
EXEC master..xp_cmdshell @cmd


bcp "SELECT au_fname, au_lname FROM pubs..authors ORDER BY au_lname" queryout Authors.txt -c -Sservername -Usa -Ppassword

-------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.sp_GravaFlag @Texto sysname, @Path sysname
AS

DECLARE @cmd sysname
SET @cmd = 'echo ' + @Texto + ' > ' + @Path
EXEC master..xp_cmdshell @cmd


EXEC sp_GravaFlag 'Teste de gravação de arquivo', '\\brarjo1ca017\tmp\testeerf2.ok'




