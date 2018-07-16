CREATE PROCEDURE [dbo].[AA_CST_WIP_INV_SALES_ORDER_POST_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_CodeSearchFrom VARCHAR (16) NULL, @PS_CodeSearchTo VARCHAR (16) NULL, @PS_SortKeySearch VARCHAR (20) NULL, @PS_BatchRef VARCHAR (10) NULL, @PS_CurrencySymbol VARCHAR (4) NULL, @PS_CurrencyRate DECIMAL (24, 8) NULL, @PS_Source VARCHAR (1) NULL, @PS_Error_Count INT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceId BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Batch_GUID UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


