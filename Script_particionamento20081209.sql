USE [master]
GO
--------------------------------------------------------------------------------------------------------------------------------------------
USE DWHBBS


DROP PARTITION SCHEME PSDataRefCNG1
GO
DROP PARTITION SCHEME PSDataRefCNGAUX1
GO
drop PARTITION FUNCTION PFDataRefCNG 
GO
drop PARTITION FUNCTION PFDataRefCNGAUX
GO
DROP PROCEDURE SP_ParticaoCRTCRDCNG 


GO
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
CREATE PROCEDURE SP_ParticaoCRTCRDCNG @DATA SMALLDATETIME
AS

DECLARE @VAL1			SMALLDATETIME,
		@VAL2			SMALLDATETIME,
		@VAL3			SMALLDATETIME,
		@DATARANGE		SMALLDATETIME


SET @DATARANGE =  cast((select top 1 [value] from sys.partition_range_values
						where function_id = (select function_id
						from sys.partition_functions
						where name = 'PFDataRefCNG')
						order by boundary_id ASC) as smalldatetime)

IF @DATARANGE = @DATA
	RETURN


ALTER PARTITION SCHEME PSDataRefCNG1 NEXT USED [PRIMARY]
ALTER PARTITION FUNCTION PFDataRefCNG() SPLIT RANGE (@DATA)


SET @VAL1 = CAST( ( SELECT MAX(value) FROM sys.partition_range_values
						where function_id = (select function_id
						from sys.partition_functions
						where name = 'PFDataRefCNG') ) AS SMALLDATETIME )

SET @VAL2 = CAST( ( SELECT MIN(value) FROM sys.partition_range_values
						where function_id = (select function_id
						from sys.partition_functions
						where name = 'PFDataRefCNG')
						AND MONTH(CAST(value AS SMALLDATETIME)) = MONTH(@VAL1) - 1 ) AS SMALLDATETIME )
					
SET @VAL3 = CAST( ( SELECT MIN(value) FROM sys.partition_range_values
						where function_id = (select function_id
						from sys.partition_functions
						where name = 'PFDataRefCNG')
						AND CAST(value AS SMALLDATETIME) > CAST(@VAL2 AS SMALLDATETIME) ) AS SMALLDATETIME )
						
IF (MONTH(@VAL2) = MONTH(@VAL3))	
	IF ( DATEDIFF(DAY, @VAL2, @VAL1) > 30 ) AND ( $PARTITION.PFDataRefCNG(@VAL1) - $PARTITION.PFDataRefCNG(@VAL2) > 30 )
	BEGIN
		ALTER PARTITION SCHEME PSDataRefCNGAUX1 NEXT USED [PRIMARY]
		ALTER PARTITION FUNCTION PFDataRefCNGAUX() SPLIT RANGE (@VAL2)
		ALTER TABLE dbo.UTB_FTO_CRTCRDCNG SWITCH PARTITION $PARTITION.PFDataRefCNG(@VAL2) TO dbo.UTB_FTO_CRTCRDCNGAUX PARTITION $PARTITION.PFDataRefCNGAUX(@VAL2)
		TRUNCATE TABLE dbo.UTB_FTO_CRTCRDCNGAUX
		ALTER PARTITION FUNCTION PFDataRefCNGAUX() MERGE RANGE (@VAL2)	
		ALTER PARTITION FUNCTION PFDataRefCNG() MERGE RANGE (@VAL2)
	END

GO
--------------------------------------------------------------------------------------------------------------------------------------------

