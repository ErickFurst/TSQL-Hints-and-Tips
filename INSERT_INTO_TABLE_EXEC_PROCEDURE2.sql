CREATE TABLE #Temp  ( 	SPID 		INT,
			Status		VARCHAR(50),
			Login		VARCHAR(50),
			HostName 	VARCHAR(50),
			BlkBy		VARCHAR(5),
			DBName		VARCHAR(50),
			Command		VARCHAR(50),
			CPUTime		INT,
			DiskIO		INT,
			LastBatch	VARCHAR(50),
			ProgramName	VARCHAR(50),
			SPID2		INT)


INSERT INTO #Temp EXEC sp_who2 active

SELECT * FROM #TEMP