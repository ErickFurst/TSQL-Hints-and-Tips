IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'sp_HabilitaLogin'
	   AND 	  type = 'P')
    DROP PROCEDURE sp_HabilitaLogin
GO
CREATE PROCEDURE dbo.sp_HabilitaLogin
/*---------------------------------------------------------------------------------------------------------------------*/
/* Autor   : Erick Furst                                                                                               */
/* Empresa : Core Synesis Ltda                                                                                         */
/* Programa: sp_HabilitaLogin                                                                                          */
/* Versão  : 1.0                                                                                                       */
/*---------------------------------------------------------------------------------------------------------------------*/
/* Descrição:                                                                                                          */
/* ----------                                                                                                          */
/*       Habilita login.                                                                                               */
/*---------------------------------------------------------------------------------------------------------------------*/

sp_password 'XCbGTRIL76%$', 'dwuser', 'dwuser'

-- Ao migrar para SQL-Server 2005, utilizar o comando abaixo.
--ALTER LOGIN dwuser ENABLE