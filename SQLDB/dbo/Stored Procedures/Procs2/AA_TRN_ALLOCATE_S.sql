CREATE PROCEDURE [dbo].[AA_TRN_ALLOCATE_S]
@PS_Alloc_Ref VARCHAR (10) NULL, @PS_Ledger VARCHAR (1) NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Tran_Primary INT NULL, @PS_Home_Value DECIMAL (24, 8) NULL, @PS_Curr_Value DECIMAL (24, 8) NULL, @PS_Date DATETIME NULL, @PS_Period TINYINT NULL, @PS_Year VARCHAR (1) NULL, @PS_Account VARCHAR (10) NULL, @PS_Home_Unallocated_Value DECIMAL (24, 8) NULL, @PS_Curr_Unallocated_Value DECIMAL (24, 8) NULL, @PS_Correction BIT NULL, @PS_Value_DPS TINYINT NULL, @PS_Gross_Home_Value DECIMAL (24, 8) NULL, @PS_Gross_Curr_Value DECIMAL (24, 8) NULL, @PS_Tran_Type VARCHAR (3) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ClearSuggestedPayment BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


