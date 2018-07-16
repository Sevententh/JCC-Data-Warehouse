CREATE PROCEDURE [dbo].[STK_ADV_FETCH_PRICES_U]
@customer VARCHAR (20) NULL, @product VARCHAR (25) NULL, @customerpriority VARCHAR (10) NULL, @productpriority VARCHAR (10) NULL, @orderdate DATETIME NULL, @currency VARCHAR (5) NULL, @homecurr VARCHAR (5) NULL, @quantity FLOAT (53) NULL, @exchrate DECIMAL (16, 6) NULL, @prodcustprior INT NULL, @key VARCHAR (5) NULL, @subanalysis VARCHAR (30) NULL, @sopcurrentry TINYINT NULL, @check_order_keys TINYINT NULL, @userkey1 VARCHAR (20) NULL, @userkey2 VARCHAR (20) NULL, @userkey3 VARCHAR (20) NULL, @homeprice FLOAT (53) NULL OUTPUT, @currprice FLOAT (53) NULL OUTPUT, @baseprice FLOAT (53) NULL OUTPUT, @percent FLOAT (53) NULL OUTPUT, @disccash FLOAT (53) NULL OUTPUT, @currencypriority TINYINT NULL OUTPUT, @pricefound TINYINT NULL OUTPUT, @priceprimary INT NULL OUTPUT, @orderType VARCHAR (1) NULL, @grossPrices TINYINT NULL OUTPUT, @stp_primary INT NULL OUTPUT, @ListContentType TINYINT NULL OUTPUT, @ChainDiscount FLOAT (53) NULL OUTPUT, @DoNotIgnoreLineDisc BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


