SELECT distinct '/* ', NAME, '*/  ', 'EXEC sp_spaceused ' + NAME
FROM SYSOBJECTS WHERE type = 'U'
ORDER BY NAME
-------------------------------------------------------------------------------------------------------------------------
DBCC SHOW_STATISTICS ( table , target )
-------------------------------------------------------------------------------------------------------------------------
SELECT 
   'Tabela' = o.name,
   'Indice' = i.name, 
   'Data atualizacao' = STATS_DATE(i.id, i.indid)
FROM sysobjects o, sysindexes i
WHERE o.name = 'duplicata' AND o.id = i.id
order by o.name
-------------------------------------------------------------------------------------------------------------------------
SELECT 
   'Tabela' = o.name,
   'Indice' = i.name, 
   'Data atualizacao' = STATS_DATE(i.id, i.indid)
FROM sysobjects o, sysindexes i
WHERE o.name in (select distinct name from sysobjects where type = 'U' and name like 'F_%') AND o.id = i.id
order by o.name

