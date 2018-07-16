CREATE PROCEDURE [dbo].[AA_SL_TERMS_TEMPLATE_INSERT_EDIT_S]
@PS_Default_String VARCHAR (150) NULL, @PS_MODE VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_UserId VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_TermsPrimary INT NULL OUTPUT, @PS_Code VARCHAR (10) NULL, @PS_Description VARCHAR (40) NULL, @PS_CreditController VARCHAR (4) NULL, @PS_TotalDisc FLOAT (53) NULL, @PS_LineDisc FLOAT (53) NULL, @PS_CreditLimit FLOAT (53) NULL, @PS_SettDisc1 FLOAT (53) NULL, @PS_SettDays1 INT NULL, @PS_SettDisc2 FLOAT (53) NULL, @PS_SettDays2 INT NULL, @PS_DeliveryCharge FLOAT (53) NULL, @PS_DeliveryChargePcnt FLOAT (53) NULL, @PS_MinOrder FLOAT (53) NULL, @PS_Terms VARCHAR (40) NULL, @PS_DuedateType TINYINT NULL, @PS_DueDays INT NULL, @PS_DeliveryMethod VARCHAR (20) NULL, @PS_NormalDays TINYINT NULL, @PS_UrgentDays TINYINT NULL, @PS_DefaultTerms BIT NULL, @PS_Source VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


