-- Cross Tab Table
DECLARE test_cursor CURSOR 
FOR SELECT [DateTime], [UserID], [Filter1], [Filter2], [Filter3], [Filter4] FROM test_table

DECLARE @DateTime 	DATETIME, 
	@UserID 	VARCHAR(10), 
	@Filter1	INT, 
	@Filter2	INT, 
	@Filter3	INT, 
	@Filter4	INT

OPEN test_cursor

FETCH NEXT FROM test_cursor INTO @DateTime, @UserID, @Filter1, @Filter2, @Filter3, @Filter4

WHILE (@@fetch_status <> -1)
BEGIN

	SET @Count = 1

	WHILE @Count <= 50
	BEGIN	
		SET @sql = 'INSERT INTO test_table2 VALUES(@DateTime, @UserID, ' + CONVERT(VARCHAR,@Count) + ', @Filter' + CONVERT(VARCHAR,@Count) + ')'	
		SET @Count = @Count + 1
		EXECUTE (@sql)
	END

	FETCH NEXT FROM test_cursor INTO @DateTime, @UserID, @Filter1, @Filter2, @Filter3, @Filter4
END

CLOSE test_cursor

DEALLOCATE test_cursor