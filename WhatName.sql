CREATE FUNCTION dbo.WhatName (@Name VARCHAR(100), @Part VARCHAR(10))
RETURNS VARCHAR(100)
AS
BEGIN

DECLARE @Pos1 INT,
	@Pos2 INT,
	@LastName VARCHAR(50),
	@MiddleName VARCHAR(50),
	@FirstName VARCHAR(50)


SET @Pos1  = PATINDEX ( '% %' , @Name )
SET @LastName = SUBSTRING(@Name,1, @Pos1 -1)

SET @Pos2 = PATINDEX ( '% %' , (SUBSTRING(@Name,@Pos1 + 1, LEN(@Name) - @Pos1)))
SET @MiddleName = SUBSTRING((SUBSTRING(@Name,@Pos1 + 1, LEN(@Name) - @Pos1)),1, @Pos2 -1)

SET @FirstName = SUBSTRING(@Name,@Pos1 + @Pos2 + 1, LEN(@Name))

IF (UPPER(@Part) IN ('L', 'LAST')) SET @Name = @LastName
ELSE IF (UPPER(@Part) IN ('M','MIDDLE')) SET @Name = @MiddleName
     ELSE IF (UPPER(@Part) IN ('F','FIRST')) SET @Name = @FirstName

RETURN(@Name)

END



SELECT DBO.whatName('Smithly A John','Middle')


