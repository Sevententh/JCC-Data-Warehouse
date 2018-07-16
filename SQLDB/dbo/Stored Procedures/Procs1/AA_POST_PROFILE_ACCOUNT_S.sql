CREATE PROCEDURE [dbo].[AA_POST_PROFILE_ACCOUNT_S]
@PS_Module VARCHAR (3) NULL, @PS_Origin VARCHAR (5) NULL, @PS_Tran_Archive_Flag TINYINT NULL, @PS_Tran_Type VARCHAR (3) NULL, @PS_Tran_Header_Ref VARCHAR (25) NULL, @PS_Tran_Date DATETIME NULL, @PS_Tran_Curr_Code VARCHAR (4) NULL, @PS_Tran_Curr_Rate DECIMAL (24, 8) NULL, @PS_Tran_Curr_Rate_Flg TINYINT NULL, @PS_Tran_ImpExp_Code CHAR (1) NULL, @PS_Tran_Country_Code VARCHAR (4) NULL, @PS_Tran_Period_Number TINYINT NULL, @PS_Tran_Year CHAR (1) NULL, @PS_Tran_User_Putin VARCHAR (5) NULL, @PS_Order_Primary INT NULL, @PS_Tran_Ec_TranNat VARCHAR (2) NULL, @PS_Tran_Primary INT NULL, @PS_Analysis_Type CHAR (1) NULL, @PS_Update_Type_Flg BIT NULL, @PS_Analysis_Type_Flg BIT NULL, @PS_TRN_Type_Flg BIT NULL, @PS_Orig_Nom_Code VARCHAR (25) NULL, @PS_Orig_Nom_Type CHAR (1) NULL, @PS_Orig_Nom_Curr VARCHAR (4) NULL, @PS_Orig_Nom_Primary INT NULL, @PS_Profile_Value DECIMAL (24, 8) NULL, @PS_Profile_Curr_Value DECIMAL (24, 8) NULL, @PS_Profile_Base2_Value DECIMAL (24, 8) NULL, @PS_Using_Us1099 TINYINT NULL, @PS_2nd_Base_Rate DECIMAL (24, 8) NULL, @PS_Jnl_Line_Ref VARCHAR (10) NULL, @PS_Source VARCHAR (1) NULL, @PS_Description VARCHAR (240) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_MovementLink INT NULL, @PS_Master_Det_Primary INT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


