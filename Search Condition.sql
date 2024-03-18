--Ver "Search Condition" no BOL

SELECT LIKE ESCAPE

create table #Teste (c1 varchar(100))

insert into #teste VALUES ('ABCDEF')
insert into #teste VALUES ('ABRIL')
insert into #teste VALUES ('MAIO')
insert into #teste VALUES ('ADSTRINGENTE')
insert into #teste VALUES ('gs')
insert into #teste VALUES ('gstrome')
insert into #teste VALUES ('gst')
insert into #teste VALUES ('gt')
insert into #teste VALUES ('gts')

SELECT *
FROM #Teste
WHERE C1 LIKE 'gs_' ESCAPE 's'
