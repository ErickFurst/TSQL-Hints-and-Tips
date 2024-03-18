DECLARE @cmd sysname, @Texto sysname
SET @Texto = 'Processamento realizado'
SET @cmd = 'echo ' + @Texto + ' > \\whte0027\cognoswm\temp\Data.OK'
EXEC master..xp_cmdshell @cmd
