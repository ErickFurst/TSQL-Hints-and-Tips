F. Capture the result of a command to file
This example writes the contents of the current directory to a file named dir_out.txt in the current server directory.

DECLARE @cmd sysname, @var sysname
SET @var = 'dir/p'
SET @cmd = @var + ' > dir_out.txt'
EXEC master..xp_cmdshell @cmd

