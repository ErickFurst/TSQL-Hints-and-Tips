---------------------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE SP_ParticaoCRTCRDCNG 
go

---------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_ParticaoCRTCRDCNG @DATA SMALLDATETIME
AS


DECLARE @DataPart 	SMALLDATETIME,
		@DataSplit 	SMALLDATETIME,
		@DataRange	SMALLDATETIME,
		@Cont		INT


SET @DataRange =  cast((select top 1 [value] from sys.partition_range_values
						where function_id = (select function_id
						from sys.partition_functions
						where name = 'PFDataRefCNG')
						order by boundary_id ASC) as smalldatetime)

IF @DataRange = @DATA
	RETURN

ALTER PARTITION SCHEME PSDataRefCNG1 NEXT USED [PRIMARY]
ALTER PARTITION FUNCTION PFDataRefCNG() SPLIT RANGE (@DATA)

DECLARE Part_cursor CURSOR 
FOR SELECT CAST( [value]  AS SMALLDATETIME) AS DATA
	FROM sys.partition_range_values
	WHERE function_id = (SELECT function_id
						 FROM sys.partition_functions
						 WHERE name = 'PFDataRefCNG')
	ORDER BY boundary_id DESC

OPEN Part_cursor

FETCH NEXT FROM Part_cursor INTO @DataPart

SET @Cont = 1

CREATE TABLE ##Part (DataPart SMALLDATETIME, Cont INT)

WHILE (@@fetch_status <> -1)
BEGIN

	If @Cont <= 30
	BEGIN	
		INSERT INTO ##Part VALUES (@DataPart, @Cont)	
	END
	
	SET @Cont = @Cont + 1

	FETCH NEXT FROM Part_cursor INTO @DataPart
END

CLOSE Part_cursor

DEALLOCATE Part_cursor

DECLARE Split_cursor CURSOR 
FOR SELECT CAST( [value] AS SMALLDATETIME) AS DATA
	FROM sys.partition_range_values
	WHERE function_id = (SELECT function_id
						 FROM sys.partition_functions
						 WHERE name = 'PFDataRefCNG')
	AND CAST( [value] AS SMALLDATETIME) NOT IN (SELECT DataPart
												FROM ##Part
												WHERE Cont <= 30
												UNION
												SELECT MAX(CAST( [value]  AS SMALLDATETIME)) AS DATA
												FROM sys.partition_range_values
												WHERE function_id = (	select function_id
																		from sys.partition_functions
																		where name = 'PFDataRefCNG')
												GROUP BY YEAR(CAST( [value]  AS SMALLDATETIME)) * 100 + MONTH(CAST( [value]  AS SMALLDATETIME)) )
	ORDER BY boundary_id ASC


OPEN Split_cursor

FETCH NEXT FROM Split_cursor INTO @DataSplit

WHILE (@@fetch_status <> -1)
BEGIN

	ALTER PARTITION SCHEME PSDataRefCNGAUX1 NEXT USED [PRIMARY]
	ALTER PARTITION FUNCTION PFDataRefCNGAUX() SPLIT RANGE (@DataSplit)
	ALTER TABLE dbo.UTB_FTO_CRTCRDCNG SWITCH PARTITION $PARTITION.PFDataRefCNG(@DataSplit) TO dbo.UTB_FTO_CRTCRDCNGAUX PARTITION $PARTITION.PFDataRefCNGAUX(@DataSplit)
	TRUNCATE TABLE dbo.UTB_FTO_CRTCRDCNGAUX
	ALTER PARTITION FUNCTION PFDataRefCNGAUX() MERGE RANGE (@DataSplit)	
	ALTER PARTITION FUNCTION PFDataRefCNG() MERGE RANGE (@DataSplit)

	FETCH NEXT FROM Split_cursor INTO @DataSplit
END

CLOSE Split_cursor

DEALLOCATE Split_cursor

DROP TABLE ##Part

---------------------------------------------------------------------------------------------------------------------------------------------------