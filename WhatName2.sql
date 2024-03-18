CREATE FUNCTION dbo.WhatName2 (@Name VARCHAR(100), @Part INT)
RETURNS VARCHAR(100)
AS
BEGIN

DECLARE @RcrdNome Table ( Nome VARCHAR(20), Pos INT IDENTITY(1,1) )
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

  RETURN(ISNULL((SELECT Nome FROM @RcrdNome WHERE Pos = @Part),'NO NAME'))

END



SELECT DBO.whatName2('Smithly A John',1)


