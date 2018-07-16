CREATE PROCEDURE [dbo].[STK_ADV_FETCH_PRICES_W]
@customer VARCHAR (20) NULL, @product VARCHAR (25) NULL, @producttype VARCHAR (1) NULL, @customerpriority VARCHAR (10) NULL, @productpriority VARCHAR (10) NULL, @orderdate DATETIME NULL, @currency VARCHAR (5) NULL, @homecurr VARCHAR (5) NULL, @pricelist FLOAT (53) NULL, @quantity FLOAT (53) NULL, @exchrate DECIMAL (16, 6) NULL, @prodcustprior INT NULL, @listtype VARCHAR (3) NULL, @subanalysis VARCHAR (30) NULL, @partkey VARCHAR (10) NULL, @includewod TINYINT NULL, @user_1 VARCHAR (20) NULL, @user_2 VARCHAR (20) NULL, @user_3 VARCHAR (20) NULL, @sort_key VARCHAR (20) NULL, @orderType VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


