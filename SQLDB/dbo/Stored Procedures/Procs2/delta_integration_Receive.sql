create procedure [dbo].delta_integration_Receive
AS
SET NOCOUNT ON;
DECLARE @dh uniqueidentifier;
DECLARE @mt SYSNAME;
DECLARE @MessageBody XML (DOCUMENT delta_integration_XMLSchema);
DECLARE @WMSI_TYPE varchar(3);
DECLARE @WMSI_ID int;
DECLARE @delta_integrationCount int;
DECLARE @delta_integrationCurrent int;
BEGIN TRANSACTION
WAITFOR (RECEIVE TOP (1) @dh=conversation_handle,
@mt=message_type_name,
@MessageBody=message_body
FROM [dbo].[delta_integration_Queue]), TIMEOUT 1000;
WHILE (@dh IS NOT NULL)
BEGIN
BEGIN TRY
IF @mt=N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
BEGIN
END CONVERSATION @dh;
END
ELSE IF (@mt=N'delta_integration_Message')
BEGIN
SET @delta_integrationCount=@MessageBody.value('count(/Root/delta_integration)','int');
SET @delta_integrationCurrent=1;
WHILE (@delta_integrationCurrent<=@delta_integrationCount)
BEGIN
SELECT
@WMSI_TYPE=Root.delta_integration.value('@WMSI_TYPE','varchar(3)'),
@WMSI_ID=Root.delta_integration.value('@WMSI_ID','int')
FROM @MessageBody.nodes('(/Root/delta_integration[sql:variable("@delta_integrationCurrent")])') AS Root(delta_integration)
if @WMSI_TYPE = 'SUP' or (@WMSI_TYPE = 'STK' and (exists (select 1 from SDK_WMS_TEMPLATE_ASSIGN where WMSS_STK_PRIMARY=@WMSI_ID)) or exists (select 1 from SDK_WMS_TEMPLATE where DELT_DEFAULT=1))
INSERT INTO dbo.SDK_WMS_INTEGRATION_BACK_LOG (
WMSI_TYPE,WMSI_ID) values (@WMSI_TYPE,@WMSI_ID)
SET @delta_integrationCurrent=@delta_integrationCurrent+1;
END
END CONVERSATION @dh;
END
COMMIT;
END TRY
BEGIN CATCH
END CONVERSATION @dh;
ROLLBACK TRANSACTION;
INSERT INTO [dbo].SDK_WMS_INTEGRATION_ERROR_LOG(WMSEL_QUEUENAME,WMSEL_ERROR_NO,WMSEL_ERROR,WMSEL_ERRORDATE)
values
('delta_integration_Queue',ERROR_NUMBER(),ERROR_MESSAGE(),GETDATE())
ALTER QUEUE [dbo].[delta_integration_Queue] WITH ACTIVATION (STATUS=OFF);
BEGIN TRANSACTION
END CATCH
SELECT @dh=NULL;
BEGIN TRANSACTION
WAITFOR (RECEIVE TOP (1) @dh=conversation_handle,
@mt=message_type_name,
@MessageBody=message_body
FROM dbo.delta_integration_Queue), TIMEOUT 1000;
END;
COMMIT;
