exec sp_SendMail 'sqlserver2000@sa.praxair.com','ivaldo_gomes@praxair.com','Anexado','Ha algum arquivo anexado?'

drop procedure sp_SendMail

CREATE PROCEDURE sp_SendMail
   @From varchar(100) ,
   @To varchar(200) ,
   @Subject varchar(100)=" ",
   @Body varchar(4000) =" "
/*********************************************************************

This stored procedure takes the above parameters and sends an e-mail. 
All of the mail configurations are hard-coded in the stored procedure. 
Comments are added to the stored procedure where necessary.
Reference to the CDOSYS objects are at the following MSDN Web site:
http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cdosys/html/_cdosys_messaging.asp

***********************************************************************/ 
   AS
   Declare @iMsg int
   Declare @hr int
   Declare @source varchar(255)
   Declare @description varchar(500)
   Declare @output varchar(1000)

--************* Create the CDO.Message Object ************************
   EXEC @hr = sp_OACreate 'CDO.Message', @iMsg OUT

--***************Configuring the Message Object ******************
-- This is to configure a remote SMTP server.
-- http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cdosys/html/_cdosys_schema_configuration_sendusing.asp
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendusing").Value','2'
-- This is to configure the Server Name or IP address. 
-- Replace MailServerName by the name or IP of your SMTP Server.
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpserver").Value', 'smtpgate.sa.praxair.com' 

-- Save the configurations to the message object.
   EXEC @hr = sp_OAMethod @iMsg, 'Configuration.Fields.Update', null

-- Set the e-mail parameters.
   EXEC @hr = sp_OASetProperty @iMsg, 'To', @To
   EXEC @hr = sp_OASetProperty @iMsg, 'From', @From
   EXEC @hr = sp_OASetProperty @iMsg, 'Subject', @Subject
--   EXEC @hr = sp_OASetProperty @iMsg, 'Attachment', 'd:\cognoswm\TexteMail.txt'
--   EXEC @hr = sp_OASetProperty @iMsg, 'AttachFile', 'd:\cognoswm\TexteMail.txt'

-- If you are using HTML e-mail, use 'HTMLBody' instead of 'TextBody'.
   EXEC @hr = sp_OASetProperty @iMsg, 'TextBody', @Body
   EXEC @hr = sp_OAMethod @iMsg, 'Send', NULL

-- Sample error handling.
   IF @hr <>0 
     select @hr
     BEGIN
       EXEC @hr = sp_OAGetErrorInfo NULL, @source OUT, @description OUT
       IF @hr = 0
         BEGIN
           SELECT @output = '  Source: ' + @source
           PRINT  @output
           SELECT @output = '  Description: ' + @description
           PRINT  @output
         END
       ELSE
         BEGIN
           PRINT '  sp_OAGetErrorInfo failed.'
           RETURN
         END
     END

-- Do some error handling after each step if you need to.
-- Clean up the objects created.
   EXEC @hr = sp_OADestroy @iMsg
