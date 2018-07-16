﻿CREATE PROCEDURE [dbo].[AA_PL_ACCOUNT_INSERT_EDIT_S]
@PS_Default_String VARCHAR (150) NULL, @PS_Insert_Flag TINYINT NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Account_Code VARCHAR (10) NULL OUTPUT, @PS_Account_Name VARCHAR (40) NULL, @PS_Address VARCHAR (160) NULL, @PS_Town VARCHAR (30) NULL, @PS_County VARCHAR (30) NULL, @PS_Postcode VARCHAR (12) NULL, @PS_Phone VARCHAR (20) NULL, @PS_Fax VARCHAR (20) NULL, @PS_Mobile_Number VARCHAR (20) NULL, @PS_Email_Address VARCHAR (64) NULL, @PS_Internet_Address VARCHAR (116) NULL, @PS_Currency_Code VARCHAR (6) NULL, @PS_Multi_Curr_Flag BIT NULL, @PS_Vat_Type CHAR (1) NULL, @PS_Purchase_Analysis VARCHAR (25) NULL, @PS_Tax_Code VARCHAR (4) NULL, @PS_Bank_Analysis VARCHAR (25) NULL, @PS_Vat_Reg_No VARCHAR (15) NULL, @PS_Country_Code VARCHAR (4) NULL, @PS_EC_Delivery VARCHAR (3) NULL, @PS_EC_Trn_Nature VARCHAR (2) NULL, @PS_EC_Trn_Mode VARCHAR (2) NULL, @PS_Language_Code VARCHAR (10) NULL, @PS_Profile_Level INT NULL, @PS_On_Stop BIT NULL, @PS_Price_Key TINYINT NULL, @PS_Total_Discount DECIMAL (24, 8) NULL, @PS_Line_Discount DECIMAL (24, 8) NULL, @PS_Credit_Limit DECIMAL (24, 8) NULL, @PS_Terms VARCHAR (40) NULL, @PS_Sett_Discount_Pcnt1 DECIMAL (24, 8) NULL, @PS_Sett_Days1 INT NULL, @PS_Sett_Discount_Pcnt2 DECIMAL (24, 8) NULL, @PS_Sett_Days2 INT NULL, @PS_Delivery_Charge DECIMAL (24, 8) NULL, @PS_Del_Charge_Pcnt DECIMAL (24, 8) NULL, @PS_Minimum_Order DECIMAL (24, 8) NULL, @PS_Antcpt_Pay_Days INT NULL, @PS_Due_Date_Type TINYINT NULL, @PS_Due_Days INT NULL, @PS_Sort VARCHAR (20) NULL, @PS_User1 VARCHAR (20) NULL, @PS_User2 VARCHAR (20) NULL, @PS_User3 VARCHAR (20) NULL, @PS_Notes TEXT NULL, @PS_Contact VARCHAR (30) NULL, @PS_Contact_Title VARCHAR (5) NULL, @PS_Contact_Initials VARCHAR (15) NULL, @PS_Contact_Surname VARCHAR (30) NULL, @PS_Contact_Fname VARCHAR (30) NULL, @PS_Salute VARCHAR (20) NULL, @PS_Contact_Job VARCHAR (35) NULL, @PS_Bank_Sort VARCHAR (10) NULL, @PS_Bank_Account_No VARCHAR (18) NULL, @PS_Bank_Account_Name VARCHAR (30) NULL, @PS_BACS_Reference VARCHAR (18) NULL, @PS_Bank_Name VARCHAR (25) NULL, @PS_ISDN_No VARCHAR (20) NULL, @PS_EDI_ANA_Location VARCHAR (13) NULL, @PS_EDI_Delivery_Location VARCHAR (13) NULL, @PS_User_Char1 VARCHAR (20) NULL, @PS_User_Char2 VARCHAR (20) NULL, @PS_User_Char5 VARCHAR (20) NULL, @PS_User_Char6 VARCHAR (30) NULL, @PS_User_Char7 VARCHAR (30) NULL, @PS_User_Char8 VARCHAR (30) NULL, @PS_User_Date1 DATETIME NULL, @PS_User_Date2 DATETIME NULL, @PS_User_Date3 DATETIME NULL, @PS_User_Flag1 BIT NULL, @PS_User_Flag2 BIT NULL, @PS_User_Flag3 BIT NULL, @PS_User_Number1 DECIMAL (24, 8) NULL, @PS_User_Number2 DECIMAL (24, 8) NULL, @PS_User_Number3 DECIMAL (24, 8) NULL, @PS_Us_Tax_Report_Flag BIT NULL, @PS_Account_Primary INT NULL OUTPUT, @PS_Source VARCHAR (1) NULL, @PS_Country VARCHAR (35) NULL, @PS_XML_Order_Format VARCHAR (20) NULL, @PS_Email_Subject VARCHAR (100) NULL, @PS_Email_Message VARCHAR (2000) NULL, @PS_Our_Account_Code VARCHAR (20) NULL, @PS_Sta_Doc_Dest INT NULL, @PS_Rem_Doc_Dest INT NULL, @PS_Ord_Doc_Dest INT NULL, @PS_IBAN_Number VARCHAR (34) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_User_LongChar1 VARCHAR (100) NULL, @PS_User_LongChar2 VARCHAR (100) NULL, @PS_LastSaveDateTime DATETIME NULL, @PS_ApplyConcurrencyCheck BIT NULL, @PS_ConcurrentUser VARCHAR (4) NULL OUTPUT, @PS_DuplicationPrimary INT NULL, @PS_Copy_Addresses BIT NULL, @PS_IR_Approver1 VARCHAR (10) NULL, @PS_IR_Approver2 VARCHAR (10) NULL, @PS_IR_Approver3 VARCHAR (10) NULL, @PS_Append_Notes TEXT NULL, @PS_ExcludeFromLists BIT NULL, @PS_SupplierCIS BIT NULL, @PS_CISTaxStatus TINYINT NULL, @PS_CIS_UTR VARCHAR (10) NULL, @PS_CISInactive TINYINT NULL, @PS_CISBusinessType TINYINT NULL, @PS_CISNINumber VARCHAR (9) NULL, @PS_CISCompanyRegNo VARCHAR (8) NULL, @PS_CIS300Name VARCHAR (56) NULL, @PS_VerificationNumber VARCHAR (13) NULL, @PS_DateMatched DATETIME NULL, @PS_PartnershipLink VARCHAR (10) NULL, @PS_ContractAgreed TINYINT NULL, @PS_CISTitle VARCHAR (4) NULL, @PS_CISForename1 VARCHAR (35) NULL, @PS_CISForename2 VARCHAR (35) NULL, @PS_CISSurname VARCHAR (35) NULL, @PS_InsuranceCompany VARCHAR (40) NULL, @PS_InsurancePolicyNo VARCHAR (25) NULL, @PS_InsuranceExpiryDate DATETIME NULL, @PS_InsuranceChecked TINYINT NULL, @PS_CITB_Levy TINYINT NULL, @PS_LeadTime INT NULL, @PS_CurrCreditLimit DECIMAL (24, 8) NULL, @PS_AnticipatedDaysOption TINYINT NULL, @PS_CompanyRegNumber VARCHAR (20) NULL, @PS_IR_Approver1IsGroup BIT NULL, @PS_IR_Approver2IsGroup BIT NULL, @PS_IR_Approver3IsGroup BIT NULL, @PS_SwiftCode VARCHAR (11) NULL, @PS_MethodOfPayment VARCHAR (20) NULL, @PS_IR_ToleranceValue DECIMAL (24, 8) NULL, @PS_IR_TolerancePercentage DECIMAL (24, 8) NULL, @PS_ContraCustomer VARCHAR (10) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


