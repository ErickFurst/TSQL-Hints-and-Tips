drop PROCEDURE dbo.WhatName3 
GO
CREATE PROCEDURE dbo.WhatName3 @Name VARCHAR(100), @CrsrName CURSOR VARYING OUTPUT
AS
BEGIN

DECLARE @RcrdNome Table ( Nome VARCHAR(20) )
DECLARE	@Pos1 	INT,
	@Nm	VARCHAR(20)


  WHILE (LEN(@Name) <> 0)
  BEGIN

    SET @Pos1 	= PATINDEX ( '% %' , @Name )

    IF (@Pos1 = 0)
       SET @Pos1 = LEN(@Name)


    SET @Nm 	= SUBSTRING(@Name,1,@Pos1) 
    set @Name 	= SUBSTRING(@Name,@Pos1+1,LEN(@Name)) 

    INSERT INTO @RcrdNome (Nome) VALUES (RTRIM(@Nm))

  END

  SET @CrsrName = CURSOR FOR SELECT Nome FROM @RcrdNome
-- Não funciona com Table Variable ou Tabela temporária.

  OPEN @CrsrName

END

----------------------------------------


DECLARE @Variavel 	CURSOR
DECLARE @Nome		VARCHAR(20)

EXEC WhatName3 @Name = 'Smithly A John' , @CrsrName = @Variavel OUTPUT

FETCH NEXT FROM @Variavel INTO @Nome

WHILE (@@FETCH_STATUS = 0)
BEGIN

    PRINT @Nome

    FETCH NEXT FROM @Variavel INTO @Nome

END

CLOSE @Variavel

DEALLOCATE @Variavel