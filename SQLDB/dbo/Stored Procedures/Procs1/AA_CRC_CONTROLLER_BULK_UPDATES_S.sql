CREATE PROCEDURE [dbo].[AA_CRC_CONTROLLER_BULK_UPDATES_S]
@PS_Validate_Only BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_Account_Type TINYINT NULL, @PS_Credit_controller_To VARCHAR (4) NULL, @PS_AccountCodeFrom VARCHAR (10) NULL, @PS_AccountCodeTo VARCHAR (10) NULL, @PS_SortKeyFrom VARCHAR (20) NULL, @PS_SortKeyTo VARCHAR (20) NULL, @PS_Credit_controller VARCHAR (4) NULL, @PS_Currency VARCHAR (3) NULL, @PS_CountOnly BIT NULL, @PS_RowCount INT NULL OUTPUT, @PS_Profile_Level INT NULL, @PS_Source VARCHAR (3) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


