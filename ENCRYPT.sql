--O resultado é o mesmo.
SELECT ENCRYPT('Informação a ser criptografada') AS PWD
INTO #TMP
SELECT * FROM #TMP

SELECT * FROM #TMP
WHERE PWD = 'Informação a ser criptografada'

SELECT * FROM #TMP
WHERE PWD = ENCRYPT('Informação a ser criptografada')


--Função Não documentada.
--Solução não mais suportada pelo SQL-Server contante somente por compatibilidade.