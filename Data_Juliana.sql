CONVERT(DATETIME,
CONVERT(VARCHAR,CAST(CONVERT(CHAR, 
CAST(SUBSTRING(CAST(dat_venda + 1900000 AS CHAR),1,4) + '0101' AS DATETIME) + 
CAST(SUBSTRING(CAST(dat_venda + 1900000 AS CHAR),5,3) AS INT) -1, 112) AS INT)),101) AS dat_venda,
