/*
select 'select max(o.name), sum(c.length)
from sysobjects O, syscolumns C
where o.id = c.id
and o.name = ''' + name + ''' AND o.type = ''U''
group by o.id
order by 1'
from sysobjects
where type = 'U'
and name like 'F_contas_receber%'
*/

-----
select 'select max(o.name), sum(c.length)
from sysobjects O, syscolumns C
where o.id = c.id
and o.name = ''' + name + ''' AND o.type = ''U''
group by o.id
order by 1'
from sysobjects
where type = 'U'
order by name

--------------------------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------------------------

select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Agente_Cobrador' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'ANO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Aplicacao' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'AUX_CARGA_HIST_APLICACAO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'AUX_CARGA_HIST_CDL_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Banco_Duplicata' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Canal_Atendimento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'CDL_Entrega' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Condicao_Pagamento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Contrato' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Controle' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Controle_Num' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'CR_AUX' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'D_TESTE' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Data' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'DIA_MES' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'DIA_SEMANA' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Duplicata' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'DWVENDAS_STG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Empresa' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Equipamento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Erick' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Acompanhamento_Diario_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Cliente_Unidade' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Contas_Receber' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Contas_Receber_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Contratos' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_CR_Pagamentos' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Custos_Despesas_Associadas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Gases' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Gases_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Liquidos' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Distribuicao_Liquidos_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Estatistica_Diaria_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Informacoes_Mercado' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Informacoes_Mercado_AG' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_Orcamento_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'F_TESTE' AND o.type = 'U'  group by o.id  order by 1
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
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Localizacao' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Localizacao_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'MES' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'MES_DO_ANO' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Movimento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Natureza_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Operacao' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'ParCBR1' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'ParCBR2' AND o.type = 'U'  group by o.id  order by 1
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
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_CLI_UNI' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Stg_Cliente' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_CR' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Custos_Despesas_Assc' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Filial_Emp' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_produto' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'STG_Tipo_Produto' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'stg_Vendas' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tanque' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'teste_cr' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tipo_Cobranca' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Tipo_Orcamento' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'TRIMESTRE' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'URC' AND o.type = 'U'  group by o.id  order by 1
select max(o.name), sum(c.length)  from sysobjects O, syscolumns C  where o.id = c.id  and o.name = 'Zona_Atendimento' AND o.type = 'U'  group by o.id  order by 1
