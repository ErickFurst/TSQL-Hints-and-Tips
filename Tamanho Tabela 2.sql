-- 1 - Execute a consulta abaixo no DB que contém as tabelas a serem avaliadas.
SELECT distinct 'EXEC sp_spaceused ' + NAME + ', @updateusage = ''TRUE'''
FROM SYSOBJECTS WHERE type = 'U'

-- 2 - Copie o resultado (Ex.: EXEC sp_spaceused NOME_TABELA) e execute novamente.
EXEC sp_spaceused NOME_TABELA, @updateusage = 'TRUE'

-- O retorno de dados será:
-- name: Nome da tabela.
-- rows: Quantidade de linhas na tabela.
-- reserved: Quantidade total de espaço reservado para o objeto.
-- data: Quantidade total de espaço utilizado para dados na tabela.
-- index_size: Quantidade total de espaço utilizado pelos índices da tabela.
-- unused: Quantidade total de espaço reservado mas não utilizado pela tabela.

-- 3 - Execute o comando abaixo para ver as informações de espaço do banco de dados.
EXEC sp_spaceused



