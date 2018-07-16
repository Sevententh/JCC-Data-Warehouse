CREATE PROCEDURE [dbo].[AA_EURO_ROUNDING_LINE_S]
@PS_Module VARCHAR (3) NULL, @PS_Tran_Primary INT NULL, @PS_Tran_Sub_Ledger VARCHAR (10) NULL, @PS_Tran_Type VARCHAR (3) NULL, @PS_Tran_ImpExp_Cde CHAR (1) NULL, @PS_Country_Code VARCHAR (4) NULL, @PS_Tran_Curr_Symbol VARCHAR (4) NULL, @PS_Tran_Period_Number TINYINT NULL, @PS_Tran_Year CHAR (1) NULL, @PS_Tran_Date DATETIME NULL, @PS_Tran_Header_Ref VARCHAR (25) NULL, @PS_Tran_Archive_Flg TINYINT NULL, @PS_Tran_Batch_Ref VARCHAR (10) NULL, @PS_Account_Code VARCHAR (10) NULL, @PS_Tran_User_Putin VARCHAR (5) NULL, @PS_Rounding_Diff_Value DECIMAL (24, 8) NULL, @PS_Rounding_Diff_Base2 DECIMAL (24, 8) NULL, @PS_Source VARCHAR (1) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


