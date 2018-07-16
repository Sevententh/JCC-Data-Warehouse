
CREATE VIEW [dbo].[UDEF_WFF_STKENQ_LocationView]
As
-- Created By:		Mike Young
-- Created On:		19/11/2014
-- Description:		Used by STKENQ WFF to lookup Stock Code
Select
	LOC_PRIMARY As [__Primary],
	LOC_STOCK_CODE As [__Stock Code],
	LOC_CODE As [Location],
	LOC_PHYSICAL As [Physical],
	LOC_RESERVE_OUT As [Allocated],
	LOC_BACK_ORDER_QTY As [Back Order Qty],
	LOC_WO_ALLOC_QUANTITY As [Works Order Allocated Qty],
    LOC_WO_UNALLOC_QUANTITY As [Works Order Unallocated Qty]
From
	STK_LOCATION With (NoLock)
