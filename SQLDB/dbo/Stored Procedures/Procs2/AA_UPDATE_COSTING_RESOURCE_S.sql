CREATE PROCEDURE [dbo].[AA_UPDATE_COSTING_RESOURCE_S]
@PS_Costing_Resource VARCHAR (16) NULL, @PS_Cost_Period_Number TINYINT NULL, @PS_Cost_Year CHAR (1) NULL, @PS_Costing_Status CHAR (1) NULL, @PS_Costing_Quantity DECIMAL (24, 8) NULL, @PS_Costing_Net DECIMAL (24, 8) NULL, @PS_Costing_Gross DECIMAL (24, 8) NULL, @PS_Costing_Res_Uplv DECIMAL (24, 8) NULL, @PS_Costing_TranType VARCHAR (3) NULL, @PS_Update_Turnover TINYINT NULL, @PS_UserID VARCHAR (4) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


