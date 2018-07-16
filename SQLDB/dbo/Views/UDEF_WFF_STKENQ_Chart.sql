
CREATE VIEW [dbo].[UDEF_WFF_STKENQ_Chart]
As
-- Created By:		Mike Young
-- Created On:		19/11/2014
-- Description:		Used by STKENQ WFF to lookup Stock Code
Select
	POD_QTYORD As [Qty Ordered],
	Case When IsDate(POD_DIMENSION1) = 1 Then Convert(DateTime, POD_DIMENSION1, 3) Else Null End As [Actual Shipment Date],
	Case When IsDate(POD_DIMENSION2) = 1 Then Convert(DateTime, POD_DIMENSION2, 3) Else Null End AS [Estimated Arrival Date],
	POD_STOCK_CODE As [__Stock Code]
From
	POP_HEADER With (NoLock)
	Inner Join POP_DETAIL With (NoLock) On POH_ORDER_NUMBR = POD_ORDER_NO
Where
	POH_BATCH_FLAG = 1 And -- in the batch
	POD_QTYDELVD < POD_QTYORD And
	POD_ENTRY_TYPE = 'S'
	
	
