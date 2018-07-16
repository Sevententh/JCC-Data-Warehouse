﻿CREATE PROCEDURE [dbo].[AA_SL_BATCH_DETAIL_S]
@PS_Defs VARCHAR (150) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Header_Primary INT NULL OUTPUT, @PS_Module VARCHAR (2) NULL, @PS_Transaction_Type VARCHAR (3) NULL, @PS_Customer_Code VARCHAR (10) NULL, @PS_SubLedger VARCHAR (10) NULL, @PS_Currency_Type VARCHAR (2) NULL, @PS_Currency_Code VARCHAR (6) NULL, @PS_Currency_Symbol VARCHAR (4) NULL, @PS_Currency_Rate DECIMAL (16, 6) NULL, @PS_Euro_Home_Rate DECIMAL (16, 6) NULL, @PS_Base2_Rate DECIMAL (16, 6) NULL, @PS_Curr_Rate_Changed TINYINT NULL, @PS_Euro_Home_Rate_Changed TINYINT NULL, @PS_Base2_Rate_Changed TINYINT NULL, @PS_EC_Delivery_Terms VARCHAR (3) NULL, @PS_EC_Transaction_Nature VARCHAR (2) NULL, @PS_EC_Transportation_Mode VARCHAR (2) NULL, @PS_Transaction_Reference VARCHAR (10) NULL, @PS_Batch_Reference VARCHAR (10) NULL, @PS_Transaction_Date DATETIME NULL, @PS_Year VARCHAR (2) NULL, @PS_Period_Number TINYINT NULL, @PS_Due_Date DATETIME NULL, @PS_Anticipated_Pay_Date DATETIME NULL, @PS_Header_Description VARCHAR (30) NULL, @PS_Detail_Primary INT NULL OUTPUT, @PS_Detail_Analysis_Code VARCHAR (25) NULL, @PS_Detail_VAT_Code VARCHAR (4) NULL, @PS_Detail_Home_Value DECIMAL (24, 8) NULL, @PS_Detail_Home_TAX_Value DECIMAL (24, 8) NULL, @PS_Detail_Curr_Gross DECIMAL (24, 8) NULL, @PS_Detail_Curr_Tax DECIMAL (24, 8) NULL, @PS_Detail_Base2_Gross DECIMAL (24, 8) NULL, @PS_Detail_Base2_Tax DECIMAL (24, 8) NULL, @PS_Detail_Costheader_Code VARCHAR (10) NULL, @PS_Detail_Costcentre_Code VARCHAR (10) NULL, @PS_Detail_Description VARCHAR (240) NULL, @PS_Detail_Dimension1 VARCHAR (20) NULL, @PS_Detail_Dimension2 VARCHAR (20) NULL, @PS_Detail_Dimension3 VARCHAR (20) NULL, @PS_Disputed TINYINT NULL, @PS_Settle_Discount_1 DECIMAL (24, 8) NULL, @PS_Settle_Days_1 INT NULL, @PS_Settle_Discount_2 DECIMAL (24, 8) NULL, @PS_Settle_Days_2 INT NULL, @PS_Archive_Flag TINYINT NULL, @PS_Do_Not_Batch TINYINT NULL, @PS_Gross_Home_Entry_Mode TINYINT NULL, @PS_Currency_Entry_Mode VARCHAR (2) NULL, @PS_Source VARCHAR (1) NULL, @PS_Enter_Due_Receipt_Date TINYINT NULL, @PS_Header_User_Char1 VARCHAR (20) NULL, @PS_Header_User_Char2 VARCHAR (20) NULL, @PS_Header_User_Char3 VARCHAR (100) NULL, @PS_Header_User_Char4 VARCHAR (100) NULL, @PS_Header_User_Flag1 TINYINT NULL, @PS_Header_User_Flag2 TINYINT NULL, @PS_Header_User_Date1 DATETIME NULL, @PS_Header_User_Date2 DATETIME NULL, @PS_Header_User_Number1 DECIMAL (24, 8) NULL, @PS_Header_User_Number2 DECIMAL (24, 8) NULL, @PS_Detail_User_Char1 VARCHAR (20) NULL, @PS_Detail_User_Char2 VARCHAR (20) NULL, @PS_Detail_User_Char3 VARCHAR (100) NULL, @PS_Detail_User_Char4 VARCHAR (100) NULL, @PS_Detail_User_Flag1 TINYINT NULL, @PS_Detail_User_Flag2 TINYINT NULL, @PS_Detail_User_Date1 DATETIME NULL, @PS_Detail_User_Date2 DATETIME NULL, @PS_Detail_User_Number1 DECIMAL (24, 8) NULL, @PS_Detail_User_Number2 DECIMAL (24, 8) NULL, @PS_Transaction_Options VARCHAR (30) NULL, @PS_User_Sort1 VARCHAR (20) NULL, @PS_User_Sort2 VARCHAR (20) NULL, @PS_User_Sort3 VARCHAR (20) NULL, @PS_Replace_Notes TEXT NULL, @PS_Append_Notes TEXT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_LockType VARCHAR (1) NULL OUTPUT, @PS_LastSaveDateTime DATETIME NULL, @PS_ConcurrentUser VARCHAR (4) NULL OUTPUT, @PS_IgnoreCompulsoryCosting BIT NULL, @PS_DifferenceAdjustment BIT NULL, @PS_CalledFrom INT NULL, @PS_IgnoreCompulsorySubLedger BIT NULL, @PS_SL_TRAN_ID INT NULL, @PS_SL_DETAIL_LINE_NO INT NULL, @PS_InsertNewHeader BIT NULL OUTPUT, @PS_DeliveryAccount VARCHAR (10) NULL, @PS_DeliveryAddressNumber INT NULL, @PS_InvoiceAddressNumber INT NULL, @PS_LastLine BIT NULL, @PS_ErrorIfPeriodClosed BIT NULL, @PS_ForceVATRateRefresh BIT NULL, @PS_AccrualNominalAccount VARCHAR (25) NULL, @PS_AccrualNoOfPeriods SMALLINT NULL, @PS_AccrualScheduleStartDate DATETIME NULL, @PS_AccrualScheduleDatesXML XML NULL, @PS_UseMultipleDueDates BIT NULL, @PS_MultipleDueDateDepositPerc DECIMAL (16, 2) NULL, @PS_MultipleDueDateDepositVal FLOAT (53) NULL, @PS_MultipleDueDateStartDate DATETIME NULL, @PS_MultipleDueDatePaymentNo INT NULL, @PS_MultipleDueDatesXml XML NULL, @PS_SettlementDiscountCreditNote BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


