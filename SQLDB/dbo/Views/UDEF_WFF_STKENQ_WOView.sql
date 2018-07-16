


CREATE VIEW [dbo].[UDEF_WFF_STKENQ_WOView]
As
-- Created By:		Mike Young
-- Created On:		19/11/2014
-- Description:		Used by STKENQ WFF to lookup Stock Code
Select
	[WO_ORDER_NUMBER] As [__Primary],
	CONVERT(varchar(10),[WO_ORDER_NUMBER]) As [Works Order No.],
	[STKCODE] As [__StockCode],
	[WO_QUANTITY] As [Works Order Qty],
	[WO_QUANTITY_BUILT] As [Qty Built],
	[WO_QUANTITY] - [WO_QUANTITY_BUILT] As [Remaining Qty],
	[WR_ROUTE] As [WO Route],
	[WR_DESCRIPTION] As [Route Description],
	[WS_TEXT] as [Current Stage],
	CONVERT(VARCHAR(11),[WO_START_DATE],103) As [Start Date],
	CONVERT(VARCHAR(11),[WO_END_DATE],103) As [End Date],
	[WO_STATUS] As [WO Status]
From
	[WO_ORDERS] With (NoLock)
	LEFT OUTER JOIN [STK_STOCK] With (NoLock) On [WO_STOCK_LINK] = [STK_PRIMARY]
	LEFT OUTER JOIN [WO_ROUTES] With (NoLock) On [WO_ROUTE_LINK] = [WR_PRIMARY]
	LEFT OUTER JOIN [WO_STAGE_QUANTITIES] With (NoLock) On [WO_ORDER_NUMBER] = [WQ_ORDER_NUMBER]
    LEFT OUTER JOIN [WO_STAGES] With (NoLock) On [WQ_STAGE_LINK] = [WS_PRIMARY]
Where
	[WO_STATUS] < 10 And -- New or WIP
	[WO_QUANTITY_BUILT] < [WO_QUANTITY]


