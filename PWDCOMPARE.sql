SELECT PWDCOMPARE('A',pwdencrypt('A'))

select password from master.dbo.sysxlogins where name='sa'

select password from master.dbo.sysxlogins where name='dwuser'

SELECT PWDCOMPARE('dwuser',(select top 1 password from master.dbo.sysxlogins where name='dwuser'))


DECLARE @Senha VARCHAR(10)

SET @Senha = 'dwuser'

WHILE (PWDCOMPARE(@Senha,(select password from master.dbo.sysxlogins where name='sa')) = 0)
BEGIN

--  SELECT PWDCOMPARE('admin',(select password from master.dbo.sysxlogins where name='sa'))
--  PRINT 'loop'

END

PRINT @Senha


'[A-Z]'
'[a-z]'
'[0-9]'
'[!,@,#,$,%,�,&,*]'

SELECT CASE WHEN PATINDEX('%[A-Z,a-z,0-9,!,@,#,$,%,�,&,*]%','00000D') <> 0 THEN 'A' ELSE 'B' END

------------------------------------------------------------------------------------------------

DECLARE @Senha  VARCHAR(10),
	@Opcoes VARCHAR(46)

SET @Senha = 'dwuser'

SET @Opcoes = ('ABC�DEFGHIJKLMNOPQRSTUWVXYZ0123456789"!@#$%�&*')

SET @Senha = SUBSTRING(@Opcoes,1,@Pos)


WHILE (PWDCOMPARE(@Senha,(select password from master.dbo.sysxlogins where name='sa')) = 0)
BEGIN

SET @Senha = SUBSTRING(@Opcoes,1,@Pos)

END

PRINT @Senha


-------------------------------------------------------------------------------

--Delphi

{ 'ent' recebe a string a ser permutada. 'compl' recebe o complemento, a ser
  adicionado � frente da permuta��o. }
procedure permuta(ent, compl: string);
var
  i: integer;
  entcalc: string; { Recebe uma substring parcial, sem um dos caracteres }
begin
  if length(ent)<=1 then
  { Se temos apenas um caracter (ou nenhum), ent�o est� na hora de guardar,
    pois n�o h� mais o que permutar. }
  begin
    { gravar em disco, jogar em uma lista, mostrar no v�deo, ... }
    writeln(compl+ent);
  end else
  { Se temos mais de um caracter, temos que realizar a permuta��o destes. }
  begin
    for i:=1 to length(ent) do
    { Separa-se individualmente, caracter a caracter, somando ao 'complemento'
      recebido por par�metro. O que sobra, � permutado. }
    begin
      entcalc:=ent;
      { 'i' tem a posi��o do caracter que est� sendo separado nesta passagem }
      delete(entcalc, i, 1);
      { Faz-se a permuta��o da entrada sem um dos caracteres, e joga-se o
        caracter separado no par�metro 'complemento'. }
      permuta(entcalc, compl+ent[i]);
    end;
  end;
end;

begin
  permuta('abcd', '');
end.


-------------------------------------------------------------------




PWDCOMPARE(@Senha,(select password from master.dbo.sysxlogins where name='sa'))


select password from master.dbo.sysxlogins where name='sa'
select ENCRYPT(password) from master.dbo.sysxlogins where name='sa'
select PWDENCRYPT(password) from master.dbo.sysxlogins where name='sa'

