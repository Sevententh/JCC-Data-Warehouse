CREATE PROCEDURE [dbo].[AA_SL_NOTES_INSERT_EDIT_S]
@PS_DefaultString NVARCHAR (100) NULL, @PS_Mode NVARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_ErrorHandlingMethod INT NULL, @PS_ObjectGuid UNIQUEIDENTIFIER NULL, @PS_UserID VARCHAR (4) NULL, @PS_NotePrimary INT NULL OUTPUT, @PS_Note VARCHAR (MAX) NULL, @PS_NextContactDate DATETIME NULL, @PS_PromisedPaymentDate DATETIME NULL, @PS_PromisedPaymentValue FLOAT (53) NULL, @PS_PromisedPaymentCurrency VARCHAR (4) NULL, @PS_CustomerLink FLOAT (53) NULL, @PS_TransactionLinksXML VARCHAR (MAX) NULL, @PS_Source NVARCHAR (1) NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_DateStampNotes BIT NULL, @PS_SystemNote BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


