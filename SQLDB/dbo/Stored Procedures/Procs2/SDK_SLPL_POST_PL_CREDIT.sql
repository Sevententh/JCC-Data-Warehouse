CREATE PROCEDURE [dbo].[SDK_SLPL_POST_PL_CREDIT]
@UserID VARCHAR (5) NULL, @Currency VARCHAR (5) NULL, @CurrencyCode VARCHAR (5) NULL, @HomeCurrency VARCHAR (5) NULL, @Exchange FLOAT (53) NULL, @Account VARCHAR (10) NULL, @Date DATETIME NULL, @Year VARCHAR (1) NULL, @Period INT NULL, @SettleDiscAnalysis VARCHAR (25) NULL, @SettleVal FLOAT (53) NULL, @GroupRef VARCHAR (20) NULL, @Description VARCHAR (240) NULL, @CostHeader VARCHAR (10) NULL, @CostCentre VARCHAR (10) NULL, @VATCode VARCHAR (4) NULL, @HomeVATValue FLOAT (53) NULL, @CurrencyVATValue FLOAT (53) NULL, @HomeVal FLOAT (53) NULL, @PostTransaction BIT NULL, @TranId INT NULL OUTPUT, @LineNo INT NULL OUTPUT, @HeaderPrimary FLOAT (53) NULL OUTPUT, @HeaderKey VARCHAR (20) NULL OUTPUT, @HeaderReference VARCHAR (10) NULL OUTPUT, @PS_Base2_Rate FLOAT (53) NULL, @PS_Base2_Gross FLOAT (53) NULL, @PS_Base2_VAT FLOAT (53) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


