-- Cross Tab Table

DECLARE @Cont 	INT,
	@Sql	VARCHAR(5000),
	@Filter	VARCHAR(5000)


DECLARE test_cursor CURSOR 
FOR SELECT [DateTime], [UserID] FROM test_table

DECLARE @DateTime 	DATETIME, 
	@UserID 	VARCHAR(10), 
	@Filter1	INT, 
	@Filter2	INT, 
	@Filter3	INT, 
	@Filter4	INT

OPEN test_cursor

FETCH NEXT FROM test_cursor INTO @DateTime, @UserID

WHILE (@@fetch_status <> -1)
BEGIN

	SET @Count = 1

	WHILE @Count <= 50
	BEGIN	

		SET @Filter = 	'SELECT [Filter] ' 	+ CONVERT(VARCHAR,@Count) 	+ ' FROM test_table
				WHERE 	[DateTime] =  ' + CONVERT(VARCHAR,@DateTime) 	+ ' AND
					[UserID] = ' 	+ CONVERT(VARCHAR,@UserID) 	+ ' AND
					[Filter]' 	+  CONVERT(VARCHAR,@Count) 	+ ' IS NOT NULL'
		
		SET @sql = 'INSERT INTO test_table2 VALUES(' + CONVERT(VARCHAR,@DateTime) + ',' + CONVERT(VARCHAR,@UserID) + ',' + CONVERT(VARCHAR,@Count) +',' + @Filter + ')'

		SET @Count = @Count + 1

		EXECUTE (@sql)
	END

	FETCH NEXT FROM test_cursor INTO @DateTime, @UserID
END

CLOSE test_cursor

DEALLOCATE test_cursor
