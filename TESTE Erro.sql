DROP PROCEDURE dbo.sp_erro
GO
-------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dbo.sp_erro
AS

DECLARE @NumErro  INT,
	@MsgErro  NVARCHAR(255),
	@NumLinha INT

CREATE TABLE #ERRO
( C1 INT PRIMARY KEY)

INSERT INTO #ERRO VALUES ( 1 )

INSERT INTO #ERRO VALUES ( 1 )

SELECT @NumErro = @@ERROR
--SELECT @NumLinha = @@ROWCOUNT

IF (@NumErro <> 0)
BEGIN
--  SET @MsgErro = ( SELECT [description] FROM MASTER.DBO.SysMessages WHERE error = @NumErro )
  SET @MsgErro = 'Erro: ' + CONVERT(VARCHAR,@NumErro) + 
--		 ' Linha: ' + CONVERT(VARCHAR,@NumLinha) + 
		 ' Data/Hora: ' + CONVERT(VARCHAR,GETDATE()) 
  EXEC dbo.sp_GravaArq  @MsgErro, '\\brarjo1ca017\tmp\EmailETL.ok'
  Return(@NumErro)
END
ELSE
  Return(0)

-------------------------------------------------------------------------------------------------------------------------

xp_logevent 

-------------------------------------------------------------------------------------------------------------------------
drop PROCEDURE dbo.sp_GravaArq 

CREATE PROCEDURE dbo.sp_GravaArq @Texto sysname, @Path sysname
AS

DECLARE @cmd sysname
SET @cmd = 'echo ' + @Texto + ' > ' + @Path
EXEC master..xp_cmdshell @cmd

-------------------------------------------------------------------------------------------------------------------------

exec dbo.sp_erro