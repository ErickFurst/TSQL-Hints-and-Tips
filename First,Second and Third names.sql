--SELECT 'Smithly A John'
--select (SUBSTRING('Smithly A John',@Pos1 + 1, LEN('Smithly A John') - @Pos1))
--PRINT LEN('Smithly A John') - (@POS1 + @POS2)

To Build a function you could put the seconde calculation into a loop.
E.G.:
1º Calculation
BEGIN LOOP
  2º Calculation
END LOOP
3º Calculation

DECLARE @Pos1 INT,
	@Pos2 INT,
	@Pos3 INT,
	@Name1 VARCHAR(50),
	@Name2 VARCHAR(50),
	@Name3 VARCHAR(50)

SET @Pos1  = PATINDEX ( '% %' , 'Smithly A John' )
SET @Name1 = SUBSTRING('Smithly A John',1, @Pos1 -1)

SET @Pos2 = PATINDEX ( '% %' , (SUBSTRING('Smithly A John',@Pos1 + 1, LEN('Smithly A John') - @Pos1)))
SET @Name2 = SUBSTRING((SUBSTRING('Smithly A John',@Pos1 + 1, LEN('Smithly A John') - @Pos1)),1, @Pos2 -1)

SET @Pos3 = LEN('Smithly A John') - @POS1 + @POS2
SET @Name3 = SUBSTRING('Smithly A John',@Pos1 + @Pos2 + 1, LEN('Smithly A John'))

SELECT @Name1
SELECT @Name2
SELECT @Name3

----------------------------------------------------------------------------------------------------

DECLARE @Pos1 INT,
	@Pos2 INT,
	@Name VARCHAR(50),
	@Name1 VARCHAR(50),
	@Name2 VARCHAR(50),
	@Name3 VARCHAR(50)

SET @Name = 'Smithly A John'

SET @Pos1  = PATINDEX ( '% %' , @Name )
SET @Name1 = SUBSTRING(@Name,1, @Pos1 -1)

SET @Pos2 = PATINDEX ( '% %' , (SUBSTRING(@Name,@Pos1 + 1, LEN(@Name) - @Pos1)))
SET @Name2 = SUBSTRING((SUBSTRING(@Name,@Pos1 + 1, LEN(@Name) - @Pos1)),1, @Pos2 -1)

SET @Name3 = SUBSTRING(@Name,@Pos1 + @Pos2 + 1, LEN(@Name))

SELECT @Name1
SELECT @Name2
SELECT @Name3

----------------------------------------------------------------------------------------------------

declare @Pos1 int
     , @Pos2 int
     , @Name1 varchar(50)
     , @Name2 varchar(50)
     , @Name3 varchar(50)
     , @Name varchar(255)

set @Name = 'Smithly A John'

set @Name1 = ''
set @Name2 = ''
set @Name3 = ''
set @Pos1 = charindex(' ', @Name, 1)
if @Pos1 > 0
 begin
   set @Name1 = substring(@Name, 1, @Pos1-1)
   set @Pos2 = charindex(' ', @Name, @Pos1+1)
   if @Pos2 > 0
     begin
       set @Name2 = substring(@Name, @Pos1+1, @Pos2-@Pos1-1)
       If len(@Name) >= @Pos2+1
           set @Name3 = substring(@Name, @Pos2+1, len(@Name))
     end
   else
       set @Name2 = substring(@Name, @Pos1+1, len(@Name))
 end
else
   set @Name1 = @Name

print @Name1
print @Name2
print @Name3

