SELECT distinct 'EXEC sp_spaceused ' + NAME
FROM SYSOBJECTS WHERE type = 'U'


EXEC sp_helpindex f_vendas

select 
I.name, 
(case when (I.indid = 1) then 'Clustered'
     when (I.indid > 1) and (I.indid < 255 ) then 'Nonclustered'
     when (I.indid = 255) then 'Dados de texto ou imagem'
end),
I.dpages, 
I.reserved, 
I.used 
from sysindexes I, sysobjects O
where I.id = O.id
and O.name = 'F_Vendas'
and O.type = 'U'

exec sp_indexes

--Resultados:
/*

SELECT distinct NAME, 'EXEC sp_spaceused ' + NAME
FROM SYSOBJECTS WHERE type = 'U'
ORDER BY NAME

EXEC sp_spaceused

EXEC sp_spaceused Agente_Cobrador
EXEC sp_spaceused ANO
EXEC sp_spaceused Aplicacao
EXEC sp_spaceused aux_adv
EXEC sp_spaceused AUX_CARGA_HIST_APLICACAO
EXEC sp_spaceused AUX_CARGA_HIST_CDL_Cliente
EXEC sp_spaceused Banco_Duplicata
EXEC sp_spaceused bck_gases
EXEC sp_spaceused Canal_Atendimento
EXEC sp_spaceused CDL_Entrega
EXEC sp_spaceused Cliente
EXEC sp_spaceused Condicao_Pagamento
EXEC sp_spaceused Contrato
EXEC sp_spaceused Controle
EXEC sp_spaceused Controle_Num
EXEC sp_spaceused Data
EXEC sp_spaceused Data_ERF
EXEC sp_spaceused DIA_MES
EXEC sp_spaceused DIA_SEMANA
EXEC sp_spaceused dtproperties
EXEC sp_spaceused Duplicata
EXEC sp_spaceused Empresa
EXEC sp_spaceused Equipamento
EXEC sp_spaceused F_Acompanhamento_Diario_Vendas
EXEC sp_spaceused F_Cliente_Unidade
EXEC sp_spaceused F_Contas_Receber
EXEC sp_spaceused F_Contas_Receber_Mensal
EXEC sp_spaceused F_Contratos
EXEC sp_spaceused F_CR_Pagamentos
EXEC sp_spaceused F_Custos_Despesas_Associadas
EXEC sp_spaceused F_Distribuicao_Gases
EXEC sp_spaceused F_Distribuicao_Gases_AG
EXEC sp_spaceused F_Distribuicao_Liquidos
EXEC sp_spaceused F_Distribuicao_Liquidos_AG
EXEC sp_spaceused F_Estatistica_Diaria_Cobranca
EXEC sp_spaceused F_Estatistica_Diaria_Cobranca_Mensal
EXEC sp_spaceused F_Informacoes_Mercado
EXEC sp_spaceused F_Informacoes_Mercado_AG
EXEC sp_spaceused F_Orcamento_Vendas
EXEC sp_spaceused F_Vendas
EXEC sp_spaceused F_Vendas_Diario_AG
EXEC sp_spaceused F_Vendas_Mensal_AG
EXEC sp_spaceused Faixa_Aging
EXEC sp_spaceused feriado_nacional
EXEC sp_spaceused Filial_Cadastro
EXEC sp_spaceused Filial_Cobranca
EXEC sp_spaceused Filial_Emitente
EXEC sp_spaceused Filial_Responsavel
EXEC sp_spaceused Forma_Consumo
EXEC sp_spaceused Fornecedor
EXEC sp_spaceused Hora_Entrega
EXEC sp_spaceused Linha_Produto
EXEC sp_spaceused lixo_edc
EXEC sp_spaceused Localizacao
EXEC sp_spaceused Localizacao_Cobranca
EXEC sp_spaceused MES
EXEC sp_spaceused MES_DO_ANO
EXEC sp_spaceused Movimento
EXEC sp_spaceused Natureza_Cliente
EXEC sp_spaceused Operacao
EXEC sp_spaceused Produto
EXEC sp_spaceused Profissional_Venda
EXEC sp_spaceused Rateio_Aplicacao_Processo
EXEC sp_spaceused Restricao_Acesso
EXEC sp_spaceused Restricao_Dia_Consumo
EXEC sp_spaceused Restricao_Dia_Entrega
EXEC sp_spaceused Restricao_Horario
EXEC sp_spaceused Segmento
EXEC sp_spaceused SEMANA
EXEC sp_spaceused SEMESTRE
EXEC sp_spaceused Situacao_Cobranca
EXEC sp_spaceused Status_Cliente
EXEC sp_spaceused Stg_Cli_Gremp
EXEC sp_spaceused STG_CLI_UNI
EXEC sp_spaceused Stg_Cliente
EXEC sp_spaceused STG_CLIVND
EXEC sp_spaceused STG_CR
EXEC sp_spaceused STG_CR_PGTO
EXEC sp_spaceused STG_Distr_Gases
EXEC sp_spaceused STG_Distribuicao_Gases
EXEC sp_spaceused stg_edc
EXEC sp_spaceused STG_Vendas
EXEC sp_spaceused STG_Vendas_ANT
EXEC sp_spaceused STG_Vendas_ATUAL
EXEC sp_spaceused Tanque
EXEC sp_spaceused temp_1
EXEC sp_spaceused Tipo_Cobranca
EXEC sp_spaceused Tipo_Orcamento
EXEC sp_spaceused Tmp_Ano
EXEC sp_spaceused Tmp_Mensal
EXEC sp_spaceused TMP_VENDAS
EXEC sp_spaceused TMP_VENDAS_ANT
EXEC sp_spaceused TRIMESTRE
EXEC sp_spaceused URC
EXEC sp_spaceused Zona_Atendimento
*/

-------------------------------------------------------------------------------

--Tamanho das Linhas:
/*

select 'select max(o.name), sum(c.length)
from sysobjects O, syscolumns C
where o.id = c.id
and o.name = ''' + name + ''' AND o.type = ''U''
group by o.id
order by 1'
from sysobjects
where type = 'U'
and name <> 'DTPROPERTIES'
order by name


select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Agente_Cobrador' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'ANO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Aplicacao' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'aux_adv' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'AUX_CARGA_HIST_APLICACAO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'AUX_CARGA_HIST_CDL_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Banco_Duplicata' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'bck_gases' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Canal_Atendimento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'CDL_Entrega' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Condicao_Pagamento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Contrato' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Controle' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Controle_Num' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Data' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Data_ERF' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'DIA_MES' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'DIA_SEMANA' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Duplicata' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Empresa' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Equipamento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Acompanhamento_Diario_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Cliente_Unidade' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Contas_Receber' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Contas_Receber_Mensal' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Contratos' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_CR_Pagamentos' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Custos_Despesas_Associadas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Gases' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Gases_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Liquidos' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Liquidos_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Estatistica_Diaria_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Estatistica_Diaria_Cobranca_Mensal' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Informacoes_Mercado' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Informacoes_Mercado_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Orcamento_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Vendas_Diario_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Vendas_Mensal_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Faixa_Aging' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'feriado_nacional' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Filial_Cadastro' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Filial_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Filial_Emitente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Filial_Responsavel' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Forma_Consumo' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Fornecedor' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Hora_Entrega' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Linha_Produto' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'lixo_edc' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Localizacao' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Localizacao_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'MES' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'MES_DO_ANO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Movimento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Natureza_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Operacao' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Produto' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Profissional_Venda' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Rateio_Aplicacao_Processo' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Restricao_Acesso' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Restricao_Dia_Consumo' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Restricao_Dia_Entrega' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Restricao_Horario' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Segmento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'SEMANA' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'SEMESTRE' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Situacao_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Status_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Stg_Cli_Gremp' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_CLI_UNI' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Stg_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_CLIVND' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_CR' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_CR_PGTO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Distr_Gases' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Distribuicao_Gases' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'stg_edc' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Vendas_ANT' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Vendas_ATUAL' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tanque' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'temp_1' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tipo_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tipo_Orcamento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tmp_Ano' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tmp_Mensal' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'TMP_VENDAS' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'TMP_VENDAS_ANT' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'TRIMESTRE' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'URC' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Zona_Atendimento' AND o.type = 'U'  group by o.id  order by 1
*/