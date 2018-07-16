﻿CREATE PROCEDURE [dbo].[AA_SOP_PRINT_INVOICE_S]
@PS_Header_Link INT NULL, @PS_Order_Primary INT NULL, @PS_VALIDATE_ONLY BIT NULL, @PS_USER_ID VARCHAR (4) NULL, @PS_Quantity DECIMAL (24, 8) NULL, @PS_Quantity_OutStanding DECIMAL (24, 8) NULL, @PS_UNITCST_BASE1 DECIMAL (24, 8) NULL, @PS_UNITCST_BASE2 DECIMAL (24, 8) NULL, @PS_UNITCST_FOREIGN DECIMAL (24, 8) NULL, @PS_LINEDISC_BASE1 DECIMAL (24, 8) NULL, @PS_LINEDISC_BASE2 DECIMAL (24, 8) NULL, @PS_LINEDISC_FOREIGN DECIMAL (24, 8) NULL, @PS_LINEDISC_PERCENTAGE DECIMAL (16, 2) NULL, @PS_NET_BASE1 DECIMAL (24, 8) NULL OUTPUT, @PS_NET_BASE2 DECIMAL (24, 8) NULL, @PS_NET_FOREIGN DECIMAL (24, 8) NULL, @PS_VAT_BASE1 DECIMAL (24, 8) NULL OUTPUT, @PS_VAT_BASE2 DECIMAL (24, 8) NULL OUTPUT, @PS_VAT_FOREIGN DECIMAL (24, 8) NULL OUTPUT, @PS_TOTDISC_BASE1 DECIMAL (24, 8) NULL, @PS_TOTDISC_BASE2 DECIMAL (24, 8) NULL, @PS_TOTDISC_FOREIGN DECIMAL (24, 8) NULL, @PS_TOTDISC_PERCENTAGE DECIMAL (16, 2) NULL, @PS_Currency_Symbol VARCHAR (4) NULL, @PS_Currency_Type VARCHAR (1) NULL, @PS_Revalue_Currency TINYINT NULL, @PS_Revalue_Currency_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Euro_Rate DECIMAL (16, 6) NULL, @PS_Revalue_Base2_Rate DECIMAL (16, 6) NULL, @PS_Currency_Entry_Mode BIT NULL, @PS_Quantity_Ordered DECIMAL (24, 8) NULL, @PS_Error_Number INT NULL OUTPUT, @PS_SerialTrack BIT NULL, @PS_StockAnalysis VARCHAR (25) NULL, @PS_EntryType VARCHAR (1) NULL, @PS_REVERSE_VAT_BASE1 DECIMAL (24, 8) NULL OUTPUT, @PS_REVERSE_VAT_BASE2 DECIMAL (24, 8) NULL OUTPUT, @PS_REVERSE_VAT_FOREIGN DECIMAL (24, 8) NULL OUTPUT, @PS_OrderDetail VARCHAR (240) NULL, @PS_VAT_CODE VARCHAR (4) NULL, @PS_EC_TYPE VARCHAR (1) NULL OUTPUT, @PS_VAT_RATE DECIMAL (24, 8) NULL OUTPUT, @PS_CURRENCY_PRICE_ENTRY BIT NULL, @PS_DELIVERY_CHARGE_FLAG BIT NULL, @PS_SettlementDiscountPerc DECIMAL (24, 8) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

