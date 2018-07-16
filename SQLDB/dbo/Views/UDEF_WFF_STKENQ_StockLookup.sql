CREATE VIEW [dbo].[UDEF_WFF_STKENQ_StockLookup]
As
-- Created By:		Mike Young
-- Created On:		19/11/2014
-- Description:		Used by STKENQ WFF to lookup Stock Code
Select
	STKCODE As [Stock Code],
	STKNAME As [Stock Name]
From
	STK_STOCK With (NoLock)