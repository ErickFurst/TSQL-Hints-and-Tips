EXEC dbo.sp_erro
GO
DROP PROCEDURE dbo.sp_erro
-------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dbo.sp_erro
AS

DECLARE @NumErro  INT,
	@MsgErro  VARCHAR(500),
	@Path     VARCHAR(500),
        @Texto    VARCHAR(500)

BEGIN TRANSACTION

CREATE TABLE #ERRO
( C1 INT PRIMARY KEY)

INSERT INTO #ERRO VALUES ( 1 )
INSERT INTO #ERRO VALUES ( 1 )

SELECT @NumErro  = @@ERROR

IF (@NumErro <> 0)
BEGIN
  SET @MsgErro = 'Processo: dbo.sp_erro - Erro: '   + CONVERT(VARCHAR,@NumErro) + 
		 ' - PRIMARY KEY na tabela #ERRO, ' 	+
		 ' Data: ' + CONVERT(VARCHAR,GETDATE()) 
  SET @Path = '\\brarjo1ca017\tmp\EmailETL.qry'
  EXEC dbo.sp_GravaArq  @MsgErro, @Path
--  RAISERROR('Erro: %d - PRIMARY KEY na tabela %s.',16,1,@NumErro,'#ERRO')
  SET @Texto = 'ERRO: ' + CONVERT(VARCHAR,@NumErro)
--  EXEC master..xp_logevent 50001, @Texto, ERROR
  ROLLBACK TRANSACTION
  Return(@NumErro)
END
ELSE
BEGIN
  COMMIT TRANSACTION
  Return(0)
END

-------------------------------------------------------------------------------------------------------------------------

drop PROCEDURE dbo.sp_GravaArq 

CREATE PROCEDURE dbo.sp_GravaArq @Texto SYSNAME, @Path SYSNAME
AS

DECLARE @cmd SYSNAME

SET @cmd = 'echo ' + @Texto + ' > ' + @Path
EXEC master..xp_cmdshell @cmd


-------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.sp_GravaFlag @Texto SYSNAME, @Path SYSNAME
AS

DECLARE @cmd SYSNAME

SET @cmd = 'echo ' + @Texto + ' > ' + @Path
EXEC master..xp_cmdshell @cmd
