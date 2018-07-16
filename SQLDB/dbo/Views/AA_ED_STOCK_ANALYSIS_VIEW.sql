﻿CREATE VIEW dbo.AA_ED_STOCK_ANALYSIS_VIEW
AS
select		LOC_STOCK_CODE,
		STKNAME,
		STK_SORT_KEY,
		STK_SORT_KEY1,
		STK_SORT_KEY2,
		STK_SORT_KEY3,
		LOC_SORT_KEY,
		LOC_CODE,
		LOC_NAME,
		LOC_MIN_QTY,
		LOC_MAX_QTY,
		LOC_USERSORT1,LOC_USERSORT2,LOC_USERSORT3,LOC_USERSORT4,
		LOC_USERSORT5,LOC_USERSORT6,
		Lev1.LCDE_DESCRIPTION as LEVEL1NAME,
		Lev2.LCDE_DESCRIPTION as LEVEL2NAME,
		Lev3.LCDE_DESCRIPTION as LEVEL3NAME,
		Lev4.LCDE_DESCRIPTION as LEVEL4NAME,
		Lev5.LCDE_DESCRIPTION as LEVEL5NAME,
		Lev6.LCDE_DESCRIPTION as LEVEL6NAME,
		LOC_PHYSICAL,
		LOC_RESERVE_OUT,
		LOC_ORDER_IN,
		LOC_AV_VALU,
		LOC_FIFO_VALU,
		LOC_STNDRD_COST,
		STK_COSTPRICE,
		(isnull(LOC_PHYSICAL,0) + isnull(LOC_QTYPRINTED,0) +
			(case STK_FREE_METHOD 
				when 'F' 
				then isnull(LOC_ORDER_IN,0) 
				else 0 
				end)
			 - isnull(LOC_RESERVE_OUT,0)) AS STOCKFREE

FROM		STK_STOCK INNER JOIN STK_LOCATION ON STKCODE=LOC_STOCK_CODE
		join SYS_DATAINFO2 on sys_primary_2 = 1
		LEFT OUTER JOIN
	      	SYS_LOOKUP_CODE Lev1 ON 
	      	LOC_USERSORT1 = Lev1.LCDE_CODE and Lev1.LCDE_TYPE=1
		LEFT OUTER JOIN
	      	SYS_LOOKUP_CODE Lev2 ON 
	      	LOC_USERSORT2 = Lev2.LCDE_CODE and Lev2.LCDE_TYPE=2
		LEFT OUTER JOIN
	      	SYS_LOOKUP_CODE Lev3 ON 
	      	LOC_USERSORT3 = Lev3.LCDE_CODE and Lev3.LCDE_TYPE=3
		LEFT OUTER JOIN
	      	SYS_LOOKUP_CODE Lev4 ON 
	      	LOC_USERSORT4 = Lev4.LCDE_CODE and Lev4.LCDE_TYPE=4
		LEFT OUTER JOIN
	      	SYS_LOOKUP_CODE Lev5 ON 
	      	LOC_USERSORT5 = Lev5.LCDE_CODE and Lev5.LCDE_TYPE=5
		LEFT OUTER JOIN
	      	SYS_LOOKUP_CODE Lev6 ON 
	      	LOC_USERSORT6 = Lev6.LCDE_CODE and Lev6.LCDE_TYPE=6