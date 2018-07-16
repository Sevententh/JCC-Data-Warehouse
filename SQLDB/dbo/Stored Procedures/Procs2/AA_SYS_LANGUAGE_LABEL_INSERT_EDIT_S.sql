CREATE PROCEDURE [dbo].[AA_SYS_LANGUAGE_LABEL_INSERT_EDIT_S]
@PS_UserId NVARCHAR (4) NULL, @PS_LanguagePrimary INT NULL, @PS_Language NVARCHAR (10) NULL, @PS_Mode VARCHAR (1) NULL, @PS_LanguageLabelPrimary INT NULL, @PS_LanguageText NVARCHAR (250) NULL, @PS_FormKey NVARCHAR (120) NULL, @PS_LabelTag NVARCHAR (120) NULL, @PS_ApplySystemWide BIT NULL, @PS_Standard BIT NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod BIT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_LanguageLinkPrimary INT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


