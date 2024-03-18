DECLARE @Temp TABLE (   RowID INT IDENTITY(1,1),
               EmployeeName VARCHAR(100),
               Salary DECIMAL(10,2))

INSERT INTO @Temp (EmployeeName, Salary)
SELECT EmployeeName, Salary
FROM Table
ORDER BY Salary DESC

SELECT EmployeeName, Salary
FROM @Table
WHERE RowID <= 3


------------------------------------------------------------------------------------------

INSERT INTO 'table NAME' EXEC stored_procedure 

------------------------------------------------------------------------------------------

SELECT ISDATE('2004-01-01')

------------------------------------------------------------------------------------------

Set rowcount 3
select column1, column2......
from table
where column1 = something
order by column desc

------------------------------------------------------------------------------------------

DECLARE @Temp Table ( c1 int,
                      c2 varchar(50) )

insert into @Temp
select cod_segm, dsc_segm
from segmento

select * from @temp
------------------------------------------------------------------------------------------

DECLARE @Temp TABLE
( c1 INT,
  c2 VARCHAR(50) )

BULK INSERT @Temp
FROM '\\brarjo1ca017\tmp\TesteERF.txt'
WITH ( FIELDTERMINATOR = ';',
       ROWTERMINATOR = '\n')

SELECT * FROM @Temp
