IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'sp_DesabilitaLogin' 
	   AND 	  type = 'P')
    DROP PROCEDURE sp_DesabilitaLogin
GO
CREATE PROCEDURE dbo.sp_DesabilitaLogin
AS
/*---------------------------------------------------------------------------------------------------------------------*/
/* Autor   : Erick Furst                                                                                               */
/* Empresa : Core Synesis Ltda                                                                                         */
/* Programa: sp_DesabilitaLogin                                                                                        */
/* Vers�o  : 1.0                                                                                                       */
/*---------------------------------------------------------------------------------------------------------------------*/
/* Descri��o:                                                                                                          */
/* ----------                                                                                                          */
/*       Desabilita login.                                                                                             */
/*---------------------------------------------------------------------------------------------------------------------*/

sp_password 'dwuser', 'XCbGTRIL76%$', 'dwuser'

-- Ao migrar para SQL-Server 2005, utilizar o comando abaixo.
--ALTER LOGIN 'dwuser' DISABLE




