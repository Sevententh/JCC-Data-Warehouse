CREATE PROCEDURE [dbo].[AA_WO_STAGE_ADVANCEMENT_S]
@PS_DefaultString NVARCHAR (100) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_OrderNumber INT NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_FromStage VARCHAR (30) NULL, @PS_ToStage VARCHAR (30) NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


