CREATE PROCEDURE [dbo].[AA_SYS_TRANSACTION_TEMPLATE_INSERT_EDIT_S]
@PS_User_Id VARCHAR (4) NULL, @PS_Insert_Flag BIT NULL, @PS_Primary INT NULL OUTPUT, @PS_TransactionId INT NULL, @PS_TemplateName VARCHAR (128) NULL, @PS_DisplayLayoutObject IMAGE NULL, @PS_CopyLineFieldsObject IMAGE NULL, @PS_OptionsObject IMAGE NULL, @PS_TabConfigurationObject IMAGE NULL, @PS_SetAsUserDefault TINYINT NULL, @PS_SetAsSystemDefault TINYINT NULL, @PS_ModifiedDate DATETIME NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_SplitterConfigurationObject IMAGE NULL, @PS_TabbingOrder INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


