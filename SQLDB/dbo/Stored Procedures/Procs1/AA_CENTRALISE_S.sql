CREATE PROCEDURE [dbo].[AA_CENTRALISE_S]
@PS_Module VARCHAR (3) NULL, @PS_Tran_Type VARCHAR (3) NULL, @PS_Tran_Batch_Ref VARCHAR (10) NULL, @PS_Tran_Archive_Flg TINYINT NULL, @PS_Tran_Header_Ref VARCHAR (25) NULL, @PS_Tran_Date DATETIME NULL, @PS_Tran_Curr_Code VARCHAR (4) NULL, @PS_Tran_CurrRte_Flg TINYINT NULL, @PS_Tran_ImpExp_Code CHAR (1) NULL, @PS_Tran_Country_Code VARCHAR (4) NULL, @PS_Tran_Period_Number TINYINT NULL, @PS_Tran_Year CHAR (1) NULL, @PS_Tran_User_Putin VARCHAR (4) NULL, @PS_Tran_Account VARCHAR (10) NULL, @PS_Tran_Primary INT NULL, @PS_Tran_Sub_Ledger VARCHAR (10) NULL, @PS_Tran_Ec_TranNat VARCHAR (2) NULL, @PS_Tran_Home_Nett DECIMAL (24, 8) NULL, @PS_Tran_Vat DECIMAL (24, 8) NULL, @PS_Tran_Curr_Rate DECIMAL (24, 8) NULL, @PS_Tran_Curr_Nett DECIMAL (24, 8) NULL, @PS_Tran_Curr_Tax DECIMAL (24, 8) NULL, @PS_2nd_Base_Rate DECIMAL (24, 8) NULL, @PS_Curr_Euro_Rate DECIMAL (24, 8) NULL, @PS_Home_Euro_Rate DECIMAL (24, 8) NULL, @PS_2nd_Base_Nett DECIMAL (24, 8) NULL, @PS_2nd_Base_Vat DECIMAL (24, 8) NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


