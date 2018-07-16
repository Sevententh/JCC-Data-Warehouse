CREATE PROCEDURE [dbo].[AA_CRC_REVERSE_WRITE_OFF_TRANS_S]
@PS_DefaultString VARCHAR (50) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_ProfileLevel INT NULL, @PS_Source VARCHAR (3) NULL, @PS_Reference VARCHAR (25) NULL OUTPUT, @PS_TransactionDate DATETIME NULL, @PS_TransactionDescription VARCHAR (30) NULL, @PS_AnalysisCode VARCHAR (25) NULL, @PS_XMLTransPrimaryList NTEXT NULL, @PS_AllocationDate DATETIME NULL OUTPUT, @PS_Allocation_Period TINYINT NULL OUTPUT, @PS_Allocation_Year VARCHAR (1) NULL OUTPUT, @PS_Allocation_YearEnum INT NULL OUTPUT, @PS_CurrencyCode VARCHAR (6) NULL, @PS_CurrencySymbol VARCHAR (4) NULL OUTPUT, @PS_MinAllocPeriod TINYINT NULL OUTPUT, @PS_MinAllocYear VARCHAR (1) NULL OUTPUT, @PS_Difference_Home_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Difference_Base2_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Difference_Type TINYINT NULL OUTPUT, @PS_Difference_Currency_Type TINYINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


