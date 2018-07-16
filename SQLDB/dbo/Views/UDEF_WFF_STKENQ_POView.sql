
CREATE VIEW [dbo].[UDEF_WFF_STKENQ_POView]
As
-- Created By:		Mike Young
-- Created On:		19/11/2014
-- Description:		Used by STKENQ WFF to lookup Stock Code
Select
	POD_PRIMARY As [__Primary],
	POD_ORDER_NO As [Purchase Order No.],
	POD_STOCK_CODE As [__StockCode],
	POD_QTYORD As [Qty Ordered],
	POD_QTYDELVD As [Qty Delivered],
	POD_UNITCST	As [Unit Cost],
	POD_DIMENSION1 As [Actual Shipment Date],
	POD_DIMENSION2 As [Estimated Arrival Date],
	Case When IsDate(POD_DIMENSION2) = 1 Then Convert(DateTime, POD_DIMENSION2, 3) Else Null End AS [Sort Field]
From
	POP_HEADER With (NoLock)
	Inner Join POP_DETAIL With (NoLock) On POH_ORDER_NUMBR = POD_ORDER_NO
Where
	POH_BATCH_FLAG = 1 And -- in the batch
	POD_QTYDELVD < POD_QTYORD And
	POD_ENTRY_TYPE = 'S'