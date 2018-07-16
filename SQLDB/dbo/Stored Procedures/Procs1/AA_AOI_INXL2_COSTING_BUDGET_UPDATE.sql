CREATE PROCEDURE [dbo].[AA_AOI_INXL2_COSTING_BUDGET_UPDATE]
@proj_code VARCHAR (25) NULL, @cc_code VARCHAR (25) NULL, @ProjectCC_Start_Date DATE NULL, @ProjectCC_Nbr_Of_Periods INT NULL, @revision SMALLINT NULL, @B_RECORD_TYPE VARCHAR (1) NULL, @B_BUDGET_TYPE VARCHAR (1) NULL, @Total_Qty FLOAT (53) NULL, @Total_Value FLOAT (53) NULL, @Profile VARCHAR (50) NULL, @VolumeBudget_Used TINYINT NULL, @Fixed_Price FLOAT (53) NULL, @Variable_Price FLOAT (53) NULL, @Discount_Percent FLOAT (53) NULL, @separator_char VARCHAR (1) NULL, @bud_value_separated_list NVARCHAR (MAX) NULL, @bud_sell_qty_separated_list NVARCHAR (MAX) NULL, @bud_purch_qty_separated_list NVARCHAR (MAX) NULL, @NBR_OF_NL_PERIODS TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


