sp_spaceused 'F_Contas_Receber_Mensal'
F_Contas_Receber_Mensal	30200482   	

14.477.728 KB	
12.130.440 KB	-
_____________
2.347.288

2.347.288
2.347.136 KB   -	
____________
152 KB

select (14477728 - 12130440) - 2347136


3 processos abertos
transda e autoexe

HD 10,5 GB

Sab 14:30 - 17:30
Dom 07:00 - 09:00
Dom 13:00 - 14:34
Dom 14:40 - 17:00
Dom 22:00 - 07:53 - Sucesso

backup 14:00 - 15:00
bcp wm 14:30 - 16:30
backup historico rh wm - 14:00 - 16:00


SELECT 'Index Name' = i.name, 
   'Statistics Date' = STATS_DATE(i.id, i.indid)
FROM sysobjects o, sysindexes i
WHERE o.name = 'F_Contas_Receber_Mensal' AND o.id = i.id