SELECT
GROUPING(P.COD_FAMIL_PROD),
P.COD_FAMIL_PROD,
MAX(P.dsc_famil_prod),
SUM(F.val_venda_liq),
SUM(venda_liq_acmlda_mes)
FROM F_Acompanhamento_Diario_Vendas F, LINHA_PRODUTO P
WHERE F.cod_linha_prod = P.cod_linha_prod 
AND F.dat_refer = '2005-06-30'
GROUP BY P.COD_FAMIL_PROD WITH ROLLUP

SELECT
CASE WHEN GROUPING(P.COD_FAMIL_PROD) = 0 THEN MAX(P.dsc_famil_prod) ELSE 'TOTAL' END,
SUM(F.val_venda_liq),
SUM(venda_liq_acmlda_mes)
FROM F_Acompanhamento_Diario_Vendas F, LINHA_PRODUTO P
WHERE F.cod_linha_prod = P.cod_linha_prod 
AND F.dat_refer = '2005-06-30'
GROUP BY P.COD_FAMIL_PROD WITH ROLLUP

