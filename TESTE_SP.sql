-- Criação da store procedure 
CREATE PROCEDURE ETL_MANETA 
                 @Cursor_F CURSOR VARYING OUTPUT
AS
SET @Cursor_F = CURSOR FOR select * from segmento
OPEN @Cursor_F
GO


-- =============================================
-- Execução da Procedure
-- =============================================
DECLARE @variavel CURSOR
DECLARE @cod_subseg NUMERIC(6)
DECLARE @cod_segm NUMERIC(6)
DECLARE @dsc_segm VARCHAR(50)
DECLARE @sk_segm INT
DECLARE @dsc_subseg VARCHAR(50)
DECLARE @incdor_reg_corren CHAR(1)
DECLARE @num_carga NUMERIC(10)

EXEC ETL_MANETA @Cursor_F = @variavel OUTPUT

    FETCH NEXT FROM @variavel INTO @cod_subseg, @cod_segm, @dsc_segm, @sk_segm,
                                   @dsc_subseg, @incdor_reg_corren,   @num_carga


WHILE (@@FETCH_STATUS = 0)
BEGIN

    select @cod_subseg as cod_subseg, @cod_segm as cod_segm, @dsc_segm as dsc_segm, 
           @sk_segm as sk_segm, @dsc_subseg as dsc_subseg, @incdor_reg_corren as incdor_reg_corren, 
           @num_carga as num_carga
    PRINT 'put user defined code here'

    FETCH NEXT FROM @variavel INTO @cod_subseg, @cod_segm, @dsc_segm, @sk_segm,
                                   @dsc_subseg, @incdor_reg_corren,   @num_carga

END

CLOSE @variavel

DEALLOCATE @variavel