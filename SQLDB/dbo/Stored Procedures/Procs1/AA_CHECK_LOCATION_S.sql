CREATE PROCEDURE [dbo].[AA_CHECK_LOCATION_S]
@PS_Stock_Code VARCHAR (25) NULL, @PS_Location_Code VARCHAR (25) NULL OUTPUT, @PS_Analysis_Code VARCHAR (25) NULL OUTPUT, @PS_Default_String CHAR (5) NULL, @PS_Location_Latest_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_Module VARCHAR (3) NULL, @PS_Location_Standard_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Physical DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Quantity_Printed DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Wapu_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Wapu_Quantity DECIMAL (24, 8) NULL OUTPUT, @PS_Location_Average_Value DECIMAL (24, 8) NULL OUTPUT, @PS_Landed_Cost DECIMAL (24, 8) NULL OUTPUT, @PS_SOP_Stock_Analysis VARCHAR (25) NULL OUTPUT, @PS_POP_Stock_Analysis VARCHAR (25) NULL OUTPUT, @PS_Out_Stock_Analysis VARCHAR (25) NULL OUTPUT, @PS_In_Stock_Analysis VARCHAR (25) NULL OUTPUT, @PS_OH_TYPE CHAR (1) NULL, @PS_UnallocatedQuantity DECIMAL (24, 8) NULL OUTPUT, @PS_AllocatedQuantity DECIMAL (24, 8) NULL OUTPUT, @PS_OnOrderQuantity DECIMAL (24, 8) NULL OUTPUT, @PS_FreeWorksOrderQuantity DECIMAL (24, 8) NULL OUTPUT, @PS_WorksOrderUnallocatedQuantity DECIMAL (24, 8) NULL OUTPUT, @PS_WorksOrderAllocatedQuantity DECIMAL (24, 8) NULL OUTPUT, @PS_UserId VARCHAR (4) NULL, @PS_OldSubAnlaysis VARCHAR (25) NULL, @PS_Direction VARCHAR (1) NULL, @PS_ConsolidateRequests BIT NULL, @PS_SubAnalysisPrimary INT NULL OUTPUT, @PS_UseProfileSADefaultsInTrans BIT NULL, @PS_UPGDefaultSAOutbound VARCHAR (25) NULL, @PS_UPGDefaultSAInbound VARCHAR (25) NULL, @PS_CheckSubAnalysisSecurityLevels BIT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


