CREATE PROCEDURE [dbo].[AA_WO_COMPONENT_INSERT_EDIT_S]
@PS_DefaultString VARCHAR (2) NULL, @PS_Mode VARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_OrderNumber INT NULL, @PS_Type VARCHAR (1) NULL, @PS_PartPrimary INT NULL, @PS_PartCode VARCHAR (25) NULL, @PS_Text VARCHAR (80) NULL, @PS_AssemblyQty DECIMAL (24, 8) NULL, @PS_Backflush BIT NULL, @PS_Labour BIT NULL, @PS_OriginalCostPrice DECIMAL (24, 8) NULL, @PS_ComponentPrimary INT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_RTP_Flag BIT NULL, @PS_AssemblyLink INT NULL, @PS_Source VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


