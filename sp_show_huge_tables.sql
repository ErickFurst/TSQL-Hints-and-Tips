USE master
GO

IF EXISTS (SELECT 1 FROM sysobjects WHERE name = 'sp_show_huge_tables' AND type = 'P')
DROP PROC sp_show_huge_tables
GO

CREATE PROC sp_show_huge_tables
(
@top			int	= NULL,
@include_system_tables 	bit 	= 0
)
AS
/*************************************************************************************************
		Copyright © 1997 - 2002 Narayana Vyas Kondreddi. All rights reserved.
                                          
Purpose:	To list the size of all tables in the database in descending order (that is biggere tables first). 
		Output can be restricted to top n tables. That is you can pass the value 3 to @top parameter to 
		see the top 3 biggest tables in your database. Optionally, you can use @include_system_tables 
		parameter, to include systemt tables in the output.
		NOTE: Always create this procedure in the master database and call it from the required databases,
		as if the stored procedure is created in that database (That is, don't prefix the stored procedure
		with the database name).

Written by:	Narayana Vyas Kondreddi
		http://vyaskn.tripod.com

Tested on: 	SQL Server 7.0

Date created:	January-22-2002 21:37 GMT

Date modified:	February-18-2002 11:31 GMT

Email: 		vyaskn@hotmail.com

Examples:

To list all the user tables in the database along with their sizes:
EXEC sp_show_huge_tables

To see the top three biggest tables in your database:
EXEC sp_show_huge_tables 3

To list all the user AND system tables in the database along with their sizes:
EXEC sp_show_huge_tables @include_system_tables = 1


To see the top three biggest user or system tables in your database:
EXEC sp_show_huge_tables 3, 1
*************************************************************************************************/

BEGIN
	IF @top > 0
	SET ROWCOUNT @top

	SELECT [Table Name], (SELECT rows FROM sysindexes s WHERE s.indid < 2 AND s.id = OBJECT_ID(a.[Table Name])) AS [Row count], [Total space used (MB)] FROM  
	(
	SELECT	QUOTENAME(USER_NAME(o.uid)) + '.' + QUOTENAME(OBJECT_NAME(i.id)) AS [Table Name],
		CONVERT(numeric(15,2),(((CONVERT(numeric(15,2),SUM(i.reserved)) * (SELECT low FROM master.dbo.spt_values (NOLOCK) WHERE number = 1 AND type = 'E')) / 1024.)/1024.)) AS [Total space used (MB)]
	FROM	sysindexes i (NOLOCK)
			INNER JOIN 
		sysobjects o (NOLOCK) 
			ON 
		i.id = o.id AND 
		((@include_system_tables = 1 AND o.type IN ('U', 'S')) OR o.type = 'U') AND 
		((@include_system_tables = 1)OR (OBJECTPROPERTY(i.id, 'IsMSShipped') = 0))
	WHERE	indid IN (0, 1, 255)
	GROUP BY	QUOTENAME(USER_NAME(o.uid)) + '.' + QUOTENAME(OBJECT_NAME(i.id))
	
	) as a
ORDER BY	[Total space used (MB)] DESC


	SET ROWCOUNT 0
END

GO

GRANT EXEC ON sp_show_huge_tables TO Public


