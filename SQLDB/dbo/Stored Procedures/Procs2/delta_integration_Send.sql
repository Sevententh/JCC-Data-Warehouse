create procedure [dbo].delta_integration_Send
@body XML (document delta_integration_XMLSchema)
AS
DECLARE @handle uniqueidentifier
IF (convert(varchar, @body.query('count(/Root/*)'))!=0)
BEGIN
BEGIN DIALOG CONVERSATION @handle
FROM SERVICE delta_integration_Service
TO SERVICE 'delta_integration_Service'
 ON CONTRACT delta_integration_MessageContract
WITH ENCRYPTION=OFF;	SEND
ON CONVERSATION @handle
MESSAGE TYPE delta_integration_Message(@body);
END CONVERSATION @handle;
END
