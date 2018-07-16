 
CREATE VIEW [dbo].[dhc_JCC_StockLeadTime]
AS
	SELECT STKCODE as LeadTimeStockCode,		
			round((case when isnull(stk_usrnum1,0)=0 then 
				isnull(SU_LEAD_TIME,0)
			else isnull(stk_usrnum1,0) end),1) as LeadTimeWeeks,	-- Stock lead time if available, else supplier lead time
			(case when isnull(stk_usrnum1,0)=0 then 
				isnull(SU_LEAD_TIME,0)
			else isnull(stk_usrnum1,0) end)*7 as LeadTimeDays	-- Stock lead time if available, else supplier lead time
				
	FROM STK_STOCK
		LEFT OUTER JOIN STK_STOCK3 on STKCODE=STKCODE3
		LEFT OUTER JOIN PL_ACCOUNTS on SUCODE=isnull(STK_SORT_KEY2,'') and isnull(STK_SORT_KEY2,'')<>''

	where isnull(STKNAME,'')<>'DISCONTINUED'

