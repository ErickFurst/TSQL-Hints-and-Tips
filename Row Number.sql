select * from dbo.Dim_COD_SEX_SHR

select IDENTITYCOL, cod_sex_name from dbo.Dim_COD_SEX_SHR
where cod_sex_name = 'Feminino'

select (SELECT COUNT(*) FROM dbo.Dim_COD_SEX_SHR WHERE COD_SEX_Idx <= S.COD_SEX_Idx), 
cod_sex_name from dbo.Dim_COD_SEX_SHR S
where cod_sex_name = 'Feminino'