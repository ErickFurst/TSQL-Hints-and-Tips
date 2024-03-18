SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER  PROCEDURE dbo.SP_WM_USR_KILL
AS
BEGIN

/*___________________________________________________________________
�====================================================================� 
�Procedure : SP_WM_USR_KILL    	                                     �
�====================================================================�
�Autor : Leonardo Maur�cio Cerqueira                                 �
�--------------------------------------------------------------------�
�Data Cria��o : 10/10/2003                                           �
�====================================================================�
�Objetivo :                                                          �
�                                                                    �
�                                                                    �
�====================================================================�
�====================================================================�
�                             MANUTEN��O                             �
�____________________________________________________________________�
� NOME                 � DATA                 � DESCRICAO            �
�======================�======================�======================�
�Leonardo Mauricio     � 10/10/2003           �Desenvolvimento Inicial
�                      �                      �                      �
�                      �                      �                      | 
�Roberto Carrasco      � 24/08/2004           �Altera��o de usu�rio  �
�                      �                      �para matar usu�rios do�
�                      �                      �DW                    � 
�                      �                      �                      �
�Rodrigo Soares        � 14/03/2006           �Inclus�o do usu�rio   �
�                      �                      �DWCUBO		     �
�                      �                      �                      �
�                      �                      �                      �
�______________________�______________________�______________________�
�====================================================================�
�____________________________________________________________________*/



DECLARE @Msg 		VARCHAR(100),
        @Computer 	VARCHAR(150), -- Computador que acessa a base de dados WM
        @Cmd 		VARCHAR(1000) ,
        @status         INT  ,
        @SPID           INT


if exists (select * from information_schema.tables where table_name = 'spwho')
  drop table dbo.spwho
set nocount on
set statistics io off

Create Table dbo.spwho
 (
   spid smallint,
   ecid smallint, 
   status nchar(30),
   loginame nchar(128), 
   hostname nchar(128), 
   blk char(5), 
   dbname nchar(128) ,
   cmd nchar(16) 
 )

-- Captura todos os processos do servidor BRARIODB4
Execute ('insert spwho exec sp_who')
-- Mensagem padr�o a ser enviada a todos os usu�rios
SET @Msg = 'ESTA CONEX�O FOI FINALIZADA PARA CARGA DI�RIA DO DW '

-- declara��o do cursor que informa todos os hostnames no banco de dados WHITE_MARTINS
Declare Cur_Proc CURSOR FOR
         SELECT DISTINCT spid, hostname 
         From dbo.spwho 
         WHERE dbname = 'WHITE_MARTINS' 
         and loginame not in ('sa' , 'sc_dw', 'PRAXAIR-XS\Administrator','sc_kill','dwcubo')

-- Abrindo o cursor 
Open Cur_Proc

/* Teste de Erro */
SELECT @status = @@error
   IF @status <> 0
     BEGIN
          SELECT 'Erro open Cur_Proc', @status
          RETURN @status
     END

/*ATRIBUI O VALOR DO CURSOR PARA A VARI�VEL */
FETCH NEXT FROM Cur_Proc INTO @SPID, @Computer 

-- �nicio do LOOP para varrer todos os hostnames.
While (@@Fetch_Status = 0)
  Begin
     	SET @Computer =  RTRIM(@COMPUTER) -- Retirar Espa�os do HostName

	SET @CMD = ' net send ' + @COMPUTER + ' "'+ @MSG + '"'

	--comando DOS para enviar mensagem de alerta aos usu�rios
	EXEC MASTER..xp_cmdshell @CMD

        -- KILL o processo
	SET @CMD = 'KILL ' + CONVERT(VARCHAR(10),@SPID)

	SET @CMD = 'osql -U sc_kill -P sc_kill -S BRARIODB4 -D WHITE_MARTINS -Q "kill ' + CONVERT(VARCHAR(10),@SPID) +'"'

	EXEC MASTER..xp_cmdshell @CMD


	/*ATRIBUI O VALOR DO CURSOR PARA A VARI�VEL */
	FETCH NEXT FROM Cur_Proc INTO @SPID, @Computer
  End

  /* Fecha o cursor */
   CLOSE Cur_Proc
   SELECT @status = @@error
   IF @status <> 0
      BEGIN
         SELECT 'Erro ao fechar Cur_Proc',@status
         RETURN @status
      END


  /* Desaloca o cursor */
  DEALLOCATE Cur_Proc
  SELECT @status = @@error
  IF @status <> 0
     BEGIN
        SELECT 'Erro ao desalocar Cur_Proc',@status
        RETURN @status
     END

-- Desabilita determinado login.
EXEC sp_DesabilitaLogin

END -- FIM DA PROCEDURE

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

