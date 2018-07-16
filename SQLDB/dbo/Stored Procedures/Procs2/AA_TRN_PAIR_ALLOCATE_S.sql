CREATE PROCEDURE [dbo].[AA_TRN_PAIR_ALLOCATE_S]
@PS_Defs VARCHAR (40) NULL, @PS_Ledger VARCHAR (1) NULL, @PS_Alloc_User VARCHAR (4) NULL, @PS_First_Tran_Audit_No INT NULL, @PS_Second_Tran_Audit_No INT NULL, @PS_Alloc_Value DECIMAL (24, 8) NULL, @PS_Alloc_Curr_Value DECIMAL (24, 8) NULL, @PS_Alloc_Date DATETIME NULL, @PS_Alloc_Period TINYINT NULL, @PS_Alloc_Year VARCHAR (1) NULL, @PS_Exchange_Diff_Analysis VARCHAR (25) NULL, @PS_Exchange_Diff_Ref VARCHAR (10) NULL, @PS_Exchange_Diff_Description VARCHAR (30) NULL, @PS_Validate_Only BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


