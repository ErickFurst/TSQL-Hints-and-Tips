--Array

DECLARE @Pos 	INT,
	@PosFim INT,
	@Texto	VARCHAR(100)

DECLARE @Array TABLE (  RowID INT IDENTITY(1,1),
               		Array sql_variant)

INSERT INTO @Array (Array)
SELECT dsc_segm
FROM Segmento
ORDER BY dsc_segm

--Última posição do Array.
SET @PosFim = (SELECT MAX(RowID) FROM @Array)
--SET @PosFim = SELECT COUNT(*) FROM @Array

SET @Pos = 1

WHILE (@@FETCH_STATUS = 0)
BEGIN

  SET @Texto = CONVERT(VARCHAR,(SELECT Array FROM @Array WHERE RowID = @Pos))
  
  PRINT @Texto 
  SET @Pos = @Pos + 1
  
END

/*
WHILE (@Pos <= @PosFim)
BEGIN

  SET @Texto = CONVERT(VARCHAR,(SELECT Array FROM @Array WHERE RowID = @Pos))
  
  PRINT @Texto 
  SET @Pos = @Pos + 1
  
END*/