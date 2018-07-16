CREATE PROCEDURE [dbo].[AA_SYS_CONFIG_SL_INSERT_EDIT_S]
@PS_AutomaticCustomerCode BIT NULL, @PS_NextAccountNumber INT NULL, @PS_AccountNameInCapitals BIT NULL, @PS_DisableTaxPrompt BIT NULL, @PS_StatementsAllocMatch BIT NULL, @PS_AgeingByDays BIT NULL, @PS_AgeingDays1 TINYINT NULL, @PS_AgeingDays2 TINYINT NULL, @PS_AgeingDays3 TINYINT NULL, @PS_AgeingDays4 TINYINT NULL, @PS_TotalDiscount FLOAT (53) NULL, @PS_SettlementDiscount1 FLOAT (53) NULL, @PS_SettlementDays1 INT NULL, @PS_SettlementDiscount2 FLOAT (53) NULL, @PS_SettlementDays2 INT NULL, @PS_LineDiscount FLOAT (53) NULL, @PS_DeliveryChargeFixed FLOAT (53) NULL, @PS_DeliveryChargePercent FLOAT (53) NULL, @PS_CreditLimit FLOAT (53) NULL, @PS_DeliveryMethod VARCHAR (20) NULL, @PS_MinimumOrderValue FLOAT (53) NULL, @PS_DeliveryNormalDays TINYINT NULL, @PS_DeliveryUrgentDays TINYINT NULL, @PS_DeliveryTerms VARCHAR (40) NULL, @PS_DeliveryDueDays INT NULL, @PS_DeliveryDueDaysType TINYINT NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod INT NULL, @PS_DisableAutoCreateCustomerTask BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


