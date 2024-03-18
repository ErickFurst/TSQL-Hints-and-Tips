CREATE TABLE JDE
( 	NUM_NTF 		NUMERIC(6,0),
	SER_NTF 		CHAR(3),
	DAT_VENDA 		DATETIME,
	COD_FILIAL_RESP 	CHAR(6),
	COD_FILIAL_EMITE 	CHAR(6) )


BULK INSERT JDE
FROM '\\WHTE0026\STAGE\XXXX.txt'
WITH ( FIELDTERMINATOR = ' ',
       ROWTERMINATOR = '\n')



SELECT F.sk_filial_resp, R.sk_filial_resp
FROM F_Vendas_Atu F, JDE J, Filial_Emitente E, Filial_Responsavel R
WHERE 	J.NUM_NTF 		= F.num_ntf 		AND
	J.SER_NTF 		= F.ser_ntf 		AND 
	J.DAT_VENDA 		= F.dat_venda 		AND
	J.COD_FILIAL_EMITE 	= E.cod_filial 		AND
	F.sk_filial_emite 	= E.sk_filial_emite 	AND
	J.COD_FILIAL_RESP 	= R.cod_filial


UPDATE F
SET F.sk_filial_resp = R.sk_filial_resp
FROM F_Vendas_Atu F, JDE J, Filial_Emitente E, Filial_Responsavel R
WHERE 	J.NUM_NTF 		= F.num_ntf 		AND
	J.SER_NTF 		= F.ser_ntf 		AND 
	J.DAT_VENDA 		= F.dat_venda 		AND
	J.COD_FILIAL_EMITE 	= E.cod_filial 		AND
	F.sk_filial_emite 	= E.sk_filial_emite 	AND
	J.COD_FILIAL_RESP 	= R.cod_filial


DROP TABLE JDE