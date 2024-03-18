CREATE FUNCTION DBO.UPPER_FIRST2 (@Texto VARCHAR(1000))
RETURNS VARCHAR(1000)
AS
/*---------------------------------------------------------------------------------------------------------------------*/
/* Autor   : Erick Furst                                                                                               */
/* Empresa : Core Synesis Ltda                                                                                         */
/* Programa: UPPER_FIRST2                                                                                              */
/* Versão  : 1.0                                                                                                       */
/* Data    : 16/02/2005                                                                                                       */
/*---------------------------------------------------------------------------------------------------------------------*/
/* Descrição:                                                                                                          */
/* ----------                                                                                                          */
/*       Colocar em Upper Case somente a primeira letra de cada palavra.                                               */
/*---------------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------*/
/* Histórico de Atualização:                                                                                           */
/* -------------------------                                                                                           */
/* Autor   : XXXXX XXXXX                                                                                               */
/* Versão  : 1.X                                                                                                       */
/*---------------------------------------------------------------------------------------------------------------------*/

BEGIN

  DECLARE @Pos INT,
	  @Caract CHAR(3),
	  @MAI VARCHAR(1000),   -- Maiusculo
	  @SOBRA VARCHAR(1000),
	  @Convertido VARCHAR(1000),
	  @Res VARCHAR(1000)


  IF ( (PATINDEX('% %',@Texto) = 0) AND (PATINDEX('%/%',@Texto) = 0) AND (PATINDEX('%-%',@Texto) = 0) AND (PATINDEX('%\%',@Texto) = 0) AND (PATINDEX('%.%',@Texto) = 0) )
  BEGIN
    SET @Res = @Texto
    RETURN(@Res)    
  END

  IF (@Texto = NULL)
  BEGIN
    SET @Texto = ''
  END

  SET @Texto = LOWER(@Texto)

  SET @Res = ''

  WHILE ( (PATINDEX('% %',@Texto) <> 0) OR (PATINDEX('%/%',@Texto) <> 0) OR (PATINDEX('%-%',@Texto) <> 0) OR (PATINDEX('%\%',@Texto) <> 0) OR (PATINDEX('%.%',@Texto) <> 0) )
  BEGIN
 
    SET @Pos = PATINDEX ( '% %' , @Texto )
    SET @Caract = '% %'

    IF (@Pos = 0)
    BEGIN
      SET @Pos = PATINDEX ( '%/%' , @Texto )
      SET @Caract = '%/%'
    END

    IF (@Pos = 0)
    BEGIN
      SET @Pos = PATINDEX ( '%-%' , @Texto )
      SET @Caract = '%-%'
    END

    IF (@Pos = 0)
    BEGIN
      SET @Pos = PATINDEX ( '%\%' , @Texto )
      SET @Caract = '%\%'
    END

    IF (@Pos = 0)
    BEGIN
      SET @Pos = PATINDEX ( '%.%' , @Texto )
      SET @Caract = '%.%'
    END



    SET @MAI = SUBSTRING(@Texto, 1, @Pos)
    SET @SOBRA = SUBSTRING(@Texto, @Pos+1, LEN (@Texto))
    SET @Convertido = LEFT(upper(@MAI),1) + SUBSTRING(@MAI,2,LEN(@MAI))

    SET @Texto = @SOBRA

    SET @Res = @Res + @Convertido
  END

  SET @Res = @Res + LEFT(upper(@SOBRA),1) + SUBSTRING(@SOBRA,2,LEN(@SOBRA))

  RETURN(@Res)

END