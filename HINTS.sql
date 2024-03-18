--TELA DETALHADA
-- Criar transação com o nível de isolamento READCOMMITED
-- e incluir o HINT READPAST na cláusula FROM da consulta.
-- Ou criar transação com o nível de isolamento READUNCOMMITED
--------------------------------------------------
--EX.1 Tela
SET TRANSACTION ISOLATION LEVEL READCOMMITTED

BEGIN TRANSACTION

SELECT *
FROM tb_coleta_indicador_detalhado WITH(READPAST)

COMMIT TRANSACTION
--------------------------------------------------
--EX.2 Tela
SET TRANSACTION ISOLATION LEVEL READUNCOMMITTED

BEGIN TRANSACTION

SELECT *
FROM tb_coleta_indicador_detalhado

COMMIT TRANSACTION
--------------------------------------------------


--COLETOR
-- Criar transação com o nível de isolamento READCOMMITED
-- e incluir o HINT ROWLOCK ou PAGLOCK.
--------------------------------------------------
--EX.1 Coletor
SET TRANSACTION ISOLATION LEVEL READCOMMITTED

BEGIN TRANSACTION

INSERT INTO tb_coleta_indicador_detalhado WITH (ROWLOCK) ([id_coleta_indicador_detalhado], [dt_coleta], [id_linha_negocio_fk], [qt_chamada_tocando], [qt_chamada_fila], [hh_chamada_mais_antiga], [qt_agente_disponivel], [qt_agente_pausa], [qt_agente_atendimento], [qt_agente_logado], [qt_tempo_conversacao], [qt_tempo_medio_espera], [qt_tempo_espera_estimado], [qt_chamada_oferecida], [qt_tempo_espera], [qt_chamada_abandonada], [qt_chamada_abandonada_5_seg], [qt_chamada_abandonada_10_seg], [qt_chamada_abandonada_15_seg], [qt_chamada_abandonada_20_seg], [qt_chamada_abandonada_25_seg], [qt_chamada_abandonada_30_seg], [qt_chamada_abandonada_35_seg], [qt_chamada_abandonada_40_seg], [qt_chamada_abandonada_50_seg], [qt_chamada_abandonada_mais_50_seg], [qt_chamada_atendida], [qt_chamada_atendida_5_seg], [qt_chamada_atendida_10_seg], [qt_chamada_atendida_15_seg], [qt_chamada_atendida_20_seg], [qt_chamada_atendida_25_seg], [qt_chamada_atendida_30_seg], [qt_chamada_atendida_35_seg], [qt_chamada_atendida_40_seg], [qt_chamada_atendida_50_seg], [qt_chamada_atendida_mais_50_seg], [qt_tempo_pos_atendimento])
VALUES(<id_coleta_indicador_detalhado,numeric(10,0),>, <dt_coleta,datetime,>, <id_linha_negocio_fk,int,>, <qt_chamada_tocando,int,>, <qt_chamada_fila,int,>, <hh_chamada_mais_antiga,int,>, <qt_agente_disponivel,int,>, <qt_agente_pausa,int,>, <qt_agente_atendimento,int,>, <qt_agente_logado,int,>, <qt_tempo_conversacao,int,>, <qt_tempo_medio_espera,int,>, <qt_tempo_espera_estimado,int,>, <qt_chamada_oferecida,int,>, <qt_tempo_espera,int,>, <qt_chamada_abandonada,int,>, <qt_chamada_abandonada_5_seg,int,>, <qt_chamada_abandonada_10_seg,int,>, <qt_chamada_abandonada_15_seg,int,>, <qt_chamada_abandonada_20_seg,int,>, <qt_chamada_abandonada_25_seg,int,>, <qt_chamada_abandonada_30_seg,int,>, <qt_chamada_abandonada_35_seg,int,>, <qt_chamada_abandonada_40_seg,int,>, <qt_chamada_abandonada_50_seg,int,>, <qt_chamada_abandonada_mais_50_seg,int,>, <qt_chamada_atendida,int,>, <qt_chamada_atendida_5_seg,int,>, <qt_chamada_atendida_10_seg,int,>, <qt_chamada_atendida_15_seg,int,>, <qt_chamada_atendida_20_seg,int,>, <qt_chamada_atendida_25_seg,int,>, <qt_chamada_atendida_30_seg,int,>, <qt_chamada_atendida_35_seg,int,>, <qt_chamada_atendida_40_seg,int,>, <qt_chamada_atendida_50_seg,int,>, <qt_chamada_atendida_mais_50_seg,int,>, <qt_tempo_pos_atendimento,int,>)

COMMIT TRANSACTION
--------------------------------------------------
--EX.1 Coletor
SET TRANSACTION ISOLATION LEVEL READCOMMITTED

BEGIN TRANSACTION

INSERT INTO tb_coleta_indicador_detalhado WITH (ROWLOCK) ([id_coleta_indicador_detalhado], [dt_coleta], [id_linha_negocio_fk], [qt_chamada_tocando], [qt_chamada_fila], [hh_chamada_mais_antiga], [qt_agente_disponivel], [qt_agente_pausa], [qt_agente_atendimento], [qt_agente_logado], [qt_tempo_conversacao], [qt_tempo_medio_espera], [qt_tempo_espera_estimado], [qt_chamada_oferecida], [qt_tempo_espera], [qt_chamada_abandonada], [qt_chamada_abandonada_5_seg], [qt_chamada_abandonada_10_seg], [qt_chamada_abandonada_15_seg], [qt_chamada_abandonada_20_seg], [qt_chamada_abandonada_25_seg], [qt_chamada_abandonada_30_seg], [qt_chamada_abandonada_35_seg], [qt_chamada_abandonada_40_seg], [qt_chamada_abandonada_50_seg], [qt_chamada_abandonada_mais_50_seg], [qt_chamada_atendida], [qt_chamada_atendida_5_seg], [qt_chamada_atendida_10_seg], [qt_chamada_atendida_15_seg], [qt_chamada_atendida_20_seg], [qt_chamada_atendida_25_seg], [qt_chamada_atendida_30_seg], [qt_chamada_atendida_35_seg], [qt_chamada_atendida_40_seg], [qt_chamada_atendida_50_seg], [qt_chamada_atendida_mais_50_seg], [qt_tempo_pos_atendimento])
VALUES(<id_coleta_indicador_detalhado,numeric(10,0),>, <dt_coleta,datetime,>, <id_linha_negocio_fk,int,>, <qt_chamada_tocando,int,>, <qt_chamada_fila,int,>, <hh_chamada_mais_antiga,int,>, <qt_agente_disponivel,int,>, <qt_agente_pausa,int,>, <qt_agente_atendimento,int,>, <qt_agente_logado,int,>, <qt_tempo_conversacao,int,>, <qt_tempo_medio_espera,int,>, <qt_tempo_espera_estimado,int,>, <qt_chamada_oferecida,int,>, <qt_tempo_espera,int,>, <qt_chamada_abandonada,int,>, <qt_chamada_abandonada_5_seg,int,>, <qt_chamada_abandonada_10_seg,int,>, <qt_chamada_abandonada_15_seg,int,>, <qt_chamada_abandonada_20_seg,int,>, <qt_chamada_abandonada_25_seg,int,>, <qt_chamada_abandonada_30_seg,int,>, <qt_chamada_abandonada_35_seg,int,>, <qt_chamada_abandonada_40_seg,int,>, <qt_chamada_abandonada_50_seg,int,>, <qt_chamada_abandonada_mais_50_seg,int,>, <qt_chamada_atendida,int,>, <qt_chamada_atendida_5_seg,int,>, <qt_chamada_atendida_10_seg,int,>, <qt_chamada_atendida_15_seg,int,>, <qt_chamada_atendida_20_seg,int,>, <qt_chamada_atendida_25_seg,int,>, <qt_chamada_atendida_30_seg,int,>, <qt_chamada_atendida_35_seg,int,>, <qt_chamada_atendida_40_seg,int,>, <qt_chamada_atendida_50_seg,int,>, <qt_chamada_atendida_mais_50_seg,int,>, <qt_tempo_pos_atendimento,int,>)

COMMIT TRANSACTION
--------------------------------------------------


CREATE TABLE #ERF
( C1 INT )

INSERT INTO #ERF  WITH (ROWLOCK) (C1) VALUES (1)

SELECT * FROM #ERF

DROP TABLE #ERF