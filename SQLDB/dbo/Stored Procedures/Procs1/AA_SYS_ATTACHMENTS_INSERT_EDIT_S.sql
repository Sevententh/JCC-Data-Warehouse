CREATE PROCEDURE [dbo].[AA_SYS_ATTACHMENTS_INSERT_EDIT_S]
@PS_DefaultString NVARCHAR (100) NULL, @PS_Mode NVARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_ErrorHandlingMethod INT NULL, @PS_UserID NVARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_Filename NVARCHAR (256) NULL, @PS_Description NVARCHAR (1024) NULL, @PS_Module INT NULL, @PS_RecordType INT NULL, @PS_DocumentType INT NULL, @PS_AuditNo INT NULL, @PS_RecordCode NVARCHAR (40) NULL, @PS_Source NVARCHAR (1) NULL, @PS_FileRepositoryPrimary INT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


