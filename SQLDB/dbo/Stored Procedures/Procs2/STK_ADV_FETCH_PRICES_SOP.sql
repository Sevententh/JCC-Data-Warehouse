CREATE PROCEDURE [dbo].[STK_ADV_FETCH_PRICES_SOP]
@custcode VARCHAR (20) NULL, @stockcode VARCHAR (25) NULL, @custpriority VARCHAR (10) NULL, @prodpriority VARCHAR (10) NULL, @date DATETIME NULL, @currency VARCHAR (5) NULL, @homecurrency VARCHAR (5) NULL, @primary FLOAT (53) NULL, @quantity FLOAT (53) NULL, @exchrate DECIMAL (16, 6) NULL, @overallpriority INT NULL, @listtype VARCHAR (3) NULL, @subanalysis VARCHAR (30) NULL, @key VARCHAR (10) NULL, @includeWOD TINYINT NULL, @custuser1 VARCHAR (20) NULL, @custuser2 VARCHAR (20) NULL, @custuser3 VARCHAR (20) NULL, @custsort VARCHAR (20) NULL, @username VARCHAR (5) NULL, @orderType VARCHAR (1) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


