/*---------------------------------------------------------------------------------------------------------------------*/
/*                                                    SP_DESC                                                          */
/* ******************************************************************************************************************* */
/* Procedimento : SP_DESC                                                                                              */
/* Descrição    : Procedimento criado para exibir a estrutura de uma tabela.                                           */
/* Data         : 11/10/2002                                                                                           */
/* Autor        : Erick Furst                                                                                          */
/*---------------------------------------------------------------------------------------------------------------------*/

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'SP_DESC' 
	   AND 	  type = 'P')
	DROP PROCEDURE SP_DESC
GO

CREATE PROCEDURE SP_DESC @Nome_Tabela as VARCHAR(100)
WITH RECOMPILE
AS

SELECT O.name   "Tabela",
       C.name   "Campo", 
       T.name   "Tipo", 
       C.length "Tamanho", 
       C.prec   "Precisão", 
       C.Scale  "Escala", 
       CASE WHEN (C.isnullable = 0) THEN ('NÃO') ELSE ('SIM') END "Permite Nulo",
       C.colorder "Ordem"
FROM sysobjects O, 
     syscolumns C, 
     systypes T
WHERE O.id = C.id
AND   O.type = 'U'
AND   C.xtype = T.xtype
AND   O.name = @Nome_Tabela
order by C.colorder