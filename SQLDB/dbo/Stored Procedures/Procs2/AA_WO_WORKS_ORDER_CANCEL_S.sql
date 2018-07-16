CREATE PROCEDURE [dbo].[AA_WO_WORKS_ORDER_CANCEL_S]
@PS_ValidateOnly BIT NULL, @PS_UserId NVARCHAR (4) NULL, @PS_Date DATETIME NULL, @PS_Year CHAR (1) NULL, @PS_Period TINYINT NULL, @PS_Description NVARCHAR (30) NULL, @PS_WorksOrderNumber INT NULL, @PS_RaiseRequestToPurchase BIT NULL, @PS_ComponentList NTEXT NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


