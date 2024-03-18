IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'sp_GravaFlag'
	   AND 	  type = 'P')
    DROP PROCEDURE sp_GravaFlag
GO

CREATE PROCEDURE dbo.sp_GravaFlag @Texto sysname, @Path sysname 
/*---------------------------------------------------------------------------------------------------------------------*/
/* Autor   : Erick Furst                                                                                               */
/* Empresa : Core Synesis Ltda                                                                                         */
/* Programa: sp_GravaFlag                                                                                              */
/* Versão  : 1.0                                                                                                       */
/*---------------------------------------------------------------------------------------------------------------------*/
/* Descrição:                                                                                                          */
/* ----------                                                                                                          */
/*       Geração de arquivos de texto.                                                                                 */
/*---------------------------------------------------------------------------------------------------------------------*/

AS 

DECLARE @cmd sysname
SET @cmd = 'echo ' + @Texto + ' > ' + @Path
EXEC master..xp_cmdshell @cmd
