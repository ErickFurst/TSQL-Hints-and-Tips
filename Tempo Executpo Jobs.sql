SELECT
sj.name,  
SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_duration))) + CONVERT(VARCHAR(6),sjh.run_duration),1,2) + ':' +
SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_duration))) + CONVERT(VARCHAR(6),sjh.run_duration),3,2) + ':' +
SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_duration))) + CONVERT(VARCHAR(6),sjh.run_duration),5,2) 
"Duração Job" ,
CONVERT(DATETIME,(CONVERT(CHAR(8),sjh.run_date) + ' '+
 (
SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_time))) + CONVERT(VARCHAR(6),sjh.run_time),1,2) + ':' +
SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_time))) + CONVERT(VARCHAR(6),sjh.run_time),3,2) + ':' +
SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_time))) + CONVERT(VARCHAR(6),sjh.run_time),5,2) 
)),126) "Data e hora de ínicio" ,
sjh.step_name, 
sjh.message, 
CASE sjh.run_status
   WHEN (0) THEN 'Failed '
   WHEN (1) THEN 'Succeeded'
   WHEN (2) THEN 'Retry'
   WHEN (3) THEN 'Canceled'
   WHEN (4) THEN 'In-progress message'
   WHEN (5) THEN 'Unknown'
ELSE 'INVALIDO' End Status
FROM msdb.dbo.sysjobhistory sjh,   msdb.dbo.sysjobs_view    sj
WHERE sj.job_id = sjh.job_id
AND sjh.step_id = 0 
AND  sj.name IN ('JOB Carga EDC', 
'JOB Carga CR Pagos',
'JOB Carga CR Títulos e Refaturamento', 
'JOB Carga DIM Corporativas', 
'JOB Carga Distribuição de Líquidos' , 
'JOB Carga EDC', 
'JOB Carga NF x FAT', 
'JOB Carga Vendas',
'JOB Carga Distribuição de Gases' )
AND CONVERT(DATETIME,(CONVERT(CHAR(8),sjh.run_date) + ' '+
 (SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_time))) + CONVERT(VARCHAR(6),sjh.run_time),1,2) + ':' +
  SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_time))) + CONVERT(VARCHAR(6),sjh.run_time),3,2) + ':' +
  SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh.run_time))) + CONVERT(VARCHAR(6),sjh.run_time),5,2) 
  )),126) = ( SELECT MAX(CONVERT(DATETIME,(CONVERT(CHAR(8),sjh2.run_date) + ' '+
		 (SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh2.run_time))) + CONVERT(VARCHAR(6),sjh2.run_time),1,2) + ':' +
		  SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh2.run_time))) + CONVERT(VARCHAR(6),sjh2.run_time),3,2) + ':' +
		  SUBSTRING(REPLICATE('0',6-LEN(CONVERT(VARCHAR(6),sjh2.run_time))) + CONVERT(VARCHAR(6),sjh2.run_time),5,2) 
		  )),126)) "Data e hora de ínicio" 
		FROM msdb.dbo.sysjobhistory sjh2   
		WHERE sjh2.job_id = sjh.job_id  
		AND sjh2.step_id = 0 		)
ORDER BY  sj.name


