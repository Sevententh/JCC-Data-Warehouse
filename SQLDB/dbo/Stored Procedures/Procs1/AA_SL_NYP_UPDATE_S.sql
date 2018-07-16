CREATE PROCEDURE [dbo].[AA_SL_NYP_UPDATE_S]
@PS_ValidateOnly BIT NULL, @PS_UserID VARCHAR (4) NULL, @PS_Invoices_Printed BIT NULL, @PS_CRN_Printed BIT NULL, @PS_Payments_Printed BIT NULL, @PS_DR_Adjustments_Printed BIT NULL, @PS_CR_Adjustments_Printed BIT NULL, @PS_Max_Update_Rows INT NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


