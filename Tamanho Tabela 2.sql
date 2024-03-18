-- 1 - Execute a consulta abaixo no DB que cont�m as tabelas a serem avaliadas.
SELECT distinct 'EXEC sp_spaceused ' + NAME + ', @updateusage = ''TRUE'''
FROM SYSOBJECTS WHERE type = 'U'

-- 2 - Copie o resultado (Ex.: EXEC sp_spaceused NOME_TABELA) e execute novamente.
EXEC sp_spaceused NOME_TABELA, @updateusage = 'TRUE'

-- O retorno de dados ser�:
-- name: Nome da tabela.
-- rows: Quantidade de linhas na tabela.
-- reserved: Quantidade total de espa�o reservado para o objeto.
-- data: Quantidade total de espa�o utilizado para dados na tabela.
-- index_size: Quantidade total de espa�o utilizado pelos �ndices da tabela.
-- unused: Quantidade total de espa�o reservado mas n�o utilizado pela tabela.

-- 3 - Execute o comando abaixo para ver as informa��es de espa�o do banco de dados.
EXEC sp_spaceused



