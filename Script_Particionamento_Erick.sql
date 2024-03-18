DROP TABLE UTB_FTO_CRTCRDCNG
GO
DROP TABLE UTB_FTO_CRTCRDCNGAUX
GO
DROP PARTITION SCHEME PSDataRefCNG1
GO
DROP PARTITION SCHEME PSDataRefCNGAUX1
GO
drop PARTITION FUNCTION PFDataRefCNG 
GO
drop PARTITION FUNCTION PFDataRefCNGAUX
GO
DROP PROCEDURE SP_ParticaoCRTCRDCNG 


--------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @DATA SMALLDATETIME

SET @DATA = '1900-01-01'


CREATE PARTITION FUNCTION PFDataRefCNG (SMALLDATETIME)
AS RANGE RIGHT FOR VALUES (@DATA)

GO
--------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @DATA SMALLDATETIME

SET @DATA = '1900-01-01'

CREATE PARTITION FUNCTION PFDataRefCNGAUX (SMALLDATETIME)
AS RANGE RIGHT FOR VALUES (@DATA)

GO
--------------------------------------------------------------------------------------------------------------------------------------------


CREATE PARTITION SCHEME PSDataRefCNG1
AS PARTITION PFDataRefCNG
ALL TO ([PRIMARY])

GO
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PARTITION SCHEME PSDataRefCNGAUX1
AS PARTITION PFDataRefCNGAUX
ALL TO ([PRIMARY])

GO
--------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE TESTE_PART
DROP TABLE TESTE_PART_AUX

CREATE TABLE UTB_FTO_CRTCRDCNG(	C1 SMALLDATETIME NOT NULL,
				C2 INT NOT NULL) ON PSDataRefCNG1 (C1)
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE UTB_FTO_CRTCRDCNGAUX(	C1 SMALLDATETIME NOT NULL,
				C2 INT NOT NULL) ON PSDataRefCNGAUX1 (C1)



---------------------------------------------------------------------------------------------------------------------------------------------------

drop PROCEDURE SP_ParticaoCRTCRDCNG 
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

	If @Cont <= 5
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
												WHERE Cont <= 5
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



exec SP_ParticaoCRTCRDCNG '2008-01-01'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-01-01' , 1 )

exec SP_ParticaoCRTCRDCNG '2008-01-02'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-01-02' , 2 )

exec SP_ParticaoCRTCRDCNG '2008-01-03'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-01-03' , 3 )

exec SP_ParticaoCRTCRDCNG '2008-02-02'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-02-02' , 4 )

exec SP_ParticaoCRTCRDCNG '2008-11-01'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-11-01' , 5 )

exec SP_ParticaoCRTCRDCNG '2008-12-01'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-01' , 6 )

exec SP_ParticaoCRTCRDCNG '2008-12-02'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-02' , 7 )

exec SP_ParticaoCRTCRDCNG '2008-12-03'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-03' , 8 )

exec SP_ParticaoCRTCRDCNG '2008-12-04'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-04' , 9 )

exec SP_ParticaoCRTCRDCNG '2008-12-05'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-05' , 10 )

exec SP_ParticaoCRTCRDCNG '2008-12-06'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-06' , 11 )

exec SP_ParticaoCRTCRDCNG '2008-12-07'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-07' , 12 )

exec SP_ParticaoCRTCRDCNG '2008-12-08'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-08' , 13 )

exec SP_ParticaoCRTCRDCNG '2008-12-09'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2008-12-09' , 14 )

exec SP_ParticaoCRTCRDCNG '2009-01-01'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2009-01-01' , 15 )

exec SP_ParticaoCRTCRDCNG '2009-01-02'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2009-01-02' , 16 )

exec SP_ParticaoCRTCRDCNG '2009-01-03'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2009-01-03' , 17 )

exec SP_ParticaoCRTCRDCNG '2009-01-04'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2009-01-04' , 18 )

exec SP_ParticaoCRTCRDCNG '2009-01-05'
INSERT INTO UTB_FTO_CRTCRDCNG VALUES (	'2009-01-05' , 19 )


SELECT * FROM UTB_FTO_CRTCRDCNG

SELECT *
	FROM sys.partition_range_values
	WHERE function_id = (SELECT function_id
						 FROM sys.partition_functions
						 WHERE name = 'PFDataRefCNG')
	ORDER BY boundary_id DESC
		
SELECT * FROM UTB_FTO_CRTCRDCNGAUX

SELECT *
	FROM sys.partition_range_values
	WHERE function_id = (SELECT function_id
						 FROM sys.partition_functions
						 WHERE name = 'PFDataRefCNGAux')
	ORDER BY boundary_id DESC
		

