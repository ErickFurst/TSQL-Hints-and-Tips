--O resultado � o mesmo.
SELECT ENCRYPT('Informa��o a ser criptografada') AS PWD
INTO #TMP
SELECT * FROM #TMP

SELECT * FROM #TMP
WHERE PWD = 'Informa��o a ser criptografada'

SELECT * FROM #TMP
WHERE PWD = ENCRYPT('Informa��o a ser criptografada')


--Fun��o N�o documentada.
--Solu��o n�o mais suportada pelo SQL-Server contante somente por compatibilidade.