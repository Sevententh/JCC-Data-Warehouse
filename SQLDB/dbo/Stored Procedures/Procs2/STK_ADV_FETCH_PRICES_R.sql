CREATE PROCEDURE [dbo].[STK_ADV_FETCH_PRICES_R]
@customer VARCHAR (20) NULL, @customertype VARCHAR (1) NULL, @product VARCHAR (25) NULL, @producttype VARCHAR (1) NULL, @customerpriority VARCHAR (10) NULL, @productpriority VARCHAR (10) NULL, @orderdate DATETIME NULL, @currency VARCHAR (5) NULL, @homecurr VARCHAR (5) NULL, @pricelist FLOAT (53) NULL, @pricelisttype VARCHAR (3) NULL, @quantity FLOAT (53) NULL, @exchrate DECIMAL (16, 6) NULL, @prodcustprior INT NULL, @ordervalue FLOAT (53) NULL, @subanalysis1 VARCHAR (30) NULL, @subanalysis2 VARCHAR (30) NULL, @subanalysis3 VARCHAR (30) NULL, @subanalysis4 VARCHAR (30) NULL, @subanalysis5 VARCHAR (30) NULL, @subanalysis6 VARCHAR (30) NULL, @partkey VARCHAR (10) NULL, @cucode VARCHAR (50) NULL, @cusort VARCHAR (50) NULL, @cuuser1 VARCHAR (50) NULL, @cuuser2 VARCHAR (50) NULL, @cuuser3 VARCHAR (50) NULL, @ohuser1 VARCHAR (20) NULL, @ohuser2 VARCHAR (20) NULL, @ohuser3 VARCHAR (20) NULL, @soploccode VARCHAR (30) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


