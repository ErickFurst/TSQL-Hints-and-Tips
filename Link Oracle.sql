-- Script generated on 10/6/2004 12:04 PM
-- By: sc_dw
-- Server: BRARIODBV02

BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'[Uncategorized (Local)]') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'[Uncategorized (Local)]'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = N'Link Oracle')       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''Link Oracle'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = N'Link Oracle' 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = N'Link Oracle', @owner_login_name = N'SC_DW', @description = N'No description available.', @category_name = N'[Uncategorized (Local)]', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'TesteErro', @command = N'IF ( (SELECT 1) = 0  ) 
RAISERROR(''ERRO'', 16,1)', @database_name = N'WHITE_MARTINS', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 3, @on_fail_step_id = 3, @on_fail_action = 4
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 2, @step_name = N'Sucesso', @command = N'DECLARE @De           VARCHAR(100)
DECLARE @Para        VARCHAR(500)
DECLARE @Titulo       VARCHAR(100)
DECLARE @Conteudo VARCHAR(2000)
DECLARE @Data         DATETIME

SET @Data         = GETDATE()
SET @De            = ''erik_brito@praxair.com''
SET @Para         = ''erik_brito@praxair.com,ragy_basile@praxair.com''
SET @Titulo        = ''Sucesso: Verificação de lock Interface''
SET @Conteudo = ''Sucesso na verificação de lock na interface, em '' + CONVERT(VARCHAR,@Data,103) + '' as '' + CONVERT(VARCHAR,@Data,108)


exec sp_send_cdosysmail @De, @Para, @Titulo, @Conteudo', @database_name = N'WHITE_MARTINS', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 3, @step_name = N'Erro', @command = N'DECLARE @De           VARCHAR(100)
DECLARE @Para        VARCHAR(500)
DECLARE @Titulo       VARCHAR(100)
DECLARE @Conteudo VARCHAR(2000)
DECLARE @Data         DATETIME

SET @Data         = GETDATE()
SET @De            = ''erik_brito@praxair.com''
SET @Para         = ''erik_brito@praxair.com,ragy_basile@praxair.com''
SET @Titulo        = ''Erro: Verificação de lock Interface''
SET @Conteudo = ''Erro na verificação de lock na interface, em: '' + CONVERT(VARCHAR,@Data,103) + '' as '' + CONVERT(VARCHAR,@Data,108)

exec sp_send_cdosysmail @De, @Para, @Titulo, @Conteudo', @database_name = N'WHITE_MARTINS', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 2, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 


