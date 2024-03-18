-------------------------------------------------------------------------------------------------------------------------
-- Ver Books online.
-------------------------------------------------------------------------------------------------------------------------
DECLARE @IntVariable INT
DECLARE @SQLString NVARCHAR(500)

/* Build and execute a string with one parameter value. */
SET @IntVariable = 35
SET @SQLString = N'SELECT * FROM pubs.dbo.employee WHERE job_lvl = ' +
                 CAST(@IntVariable AS NVARCHAR(10))
EXEC(@SQLString)

/* Build and execute a string with a second parameter value. */
SET @IntVariable = 201
SET @SQLString = N'SELECT * FROM pubs.dbo.employee WHERE job_lvl = ' +
                 CAST(@IntVariable AS NVARCHAR(10))
EXEC(@SQLString)

-------------------------------------------------------------------------------------------------------------------------

DECLARE @IntVariable INT
DECLARE @SQLString NVARCHAR(500)
DECLARE @ParmDefinition NVARCHAR(500)

/* Build the SQL string once. */
SET @SQLString =
     N'SELECT * FROM pubs.dbo.employee WHERE job_lvl = @level'
/* Specify the parameter format once. */
SET @ParmDefinition = N'@level tinyint'

/* Execute the string with the first parameter value. */
SET @IntVariable = 35
EXECUTE sp_executesql @SQLString, @ParmDefinition,
                      @level = @IntVariable
/* Execute the same string with the second parameter value. */
SET @IntVariable = 32
EXECUTE sp_executesql @SQLString, @ParmDefinition,
                      @level = @IntVariable