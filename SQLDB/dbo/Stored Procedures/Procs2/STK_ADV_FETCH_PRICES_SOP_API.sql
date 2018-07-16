CREATE PROCEDURE [dbo].[STK_ADV_FETCH_PRICES_SOP_API]
@custcode VARCHAR (20) NULL, @stockcode VARCHAR (25) NULL, @custpriority VARCHAR (10) NULL, @prodpriority VARCHAR (10) NULL, @date DATETIME NULL, @currency VARCHAR (5) NULL, @homecurrency VARCHAR (5) NULL, @primary FLOAT (53) NULL, @quantity FLOAT (53) NULL, @exchrate DECIMAL (16, 6) NULL, @overallpriority INT NULL, @listtype VARCHAR (3) NULL, @subanalysis VARCHAR (30) NULL, @key VARCHAR (10) NULL, @includeWOD TINYINT NULL, @custuser1 VARCHAR (20) NULL, @custuser2 VARCHAR (20) NULL, @custuser3 VARCHAR (20) NULL, @custsort VARCHAR (20) NULL, @username VARCHAR (5) NULL, @orderType VARCHAR (1) NULL, @homeprice FLOAT (53) NULL OUTPUT, @currprice FLOAT (53) NULL OUTPUT, @baseprice FLOAT (53) NULL OUTPUT, @percent FLOAT (53) NULL OUTPUT, @disccash FLOAT (53) NULL OUTPUT, @currencypriority FLOAT (53) NULL OUTPUT, @pricefound FLOAT (53) NULL OUTPUT, @priceprimary FLOAT (53) NULL OUTPUT, @grossPrices TINYINT NULL OUTPUT, @STP_PRIMARY INT NULL OUTPUT, @ListContentType TINYINT NULL OUTPUT, @ChainDiscount FLOAT (53) NULL OUTPUT, @DoNotIgnoreLineDisc BIT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


