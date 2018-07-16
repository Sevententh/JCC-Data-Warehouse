create view AA_PL_TRANSACTION_THREESIXTY_ORDER_DET_VIEW
/*
** Returns order detail line information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select POH.POH_ORDER_NUMBR as ORDER_NUMBER,
   isnull(POD.POD_STOCK_CODE,'') as POD_STOCK_CODE,
   isnull(POD.POD_PRICE_CODE,'') as POD_PRICE_CODE,
   case POD.POD_ENTRY_TYPE
      when 'T' then POD.POD_DETAIL
      else ''
   end as TEXT_LINE,
   isnull(STK.STKNAME,'') as STKNAME,
   isnull(P.PRNAME,'') as PRNAME,
   POD.POD_QTYORD,
   POD.POD_QTYDELVD,
   POD.POD_UNITCST,
   POD.POD_UNITCST_C,
   case POD.POD_TABLECODE
      when 'B1' then isnull(STK1.STK_BUY_NAME1,'')
      when 'B2' then isnull(STK1.STK_BUY_NAME2,'')
      when 'B3' then isnull(STK1.STK_BUY_NAME3,'')
      when 'B4' then isnull(STK1.STK_BUY_NAME4,'')
      when 'B5' then isnull(STK1.STK_BUY_NAME5,'')
      when 'B6' then isnull(STK1.STK_BUY_NAME6,'')
      when 'B7' then isnull(STK1.STK_BUY_NAME7,'')
      when 'B8' then isnull(STK1.STK_BUY_NAME8,'')
      when 'B9' then isnull(STK1.STK_BUY_NAME9,'')
      when 'B10' then isnull(STK1.STK_BUY_NAME10,'')
      else ''
   end as STOCK_UNIT,
   POH.POH_CURR_CODE,
   isnull(POD.POD_LOCATN,'') as POD_LOCATN,
   isnull(L.LOC_NAME,'') as LOC_NAME,
   isnull(POD.POD_SERIALNO,'') as POD_SERIALNO,
   isnull(STK.STK_SORT_KEY1,'') as STK_SORT_KEY1,
   isnull(STK.STK_SORT_KEY2,'') as STK_SORT_KEY2,
   isnull(STK.STK_SORT_KEY3,'') as STK_SORT_KEY3,
   isnull(D.DET_DIMENSION1,'') as DET_DIMENSION1,
   isnull(D.DET_DIMENSION2,'') as DET_DIMENSION2,
   isnull(D.DET_DIMENSION3,'') as DET_DIMENSION3,
   POD.POD_PRIMARY --Required for ordering

from POP_HEADER POH
   inner join POP_DETAIL POD on POD.POD_ORDER_NO = POH.POH_ORDER_NUMBR
   left join SL_PL_NL_DETAIL D on D.DET_ORDER_LINK = POD.POD_PRIMARY and D.DET_LEDGER = 'PL'
   left join STK_STOCK STK on STK.STKCODE = POD.POD_STOCK_CODE and POD.POD_ENTRY_TYPE = 'S'
   left join STK_STOCK_2 STK1 on STK1.STK_PRIMARY_2 = STK_PRIMARY
   left join PRC_PRICE_RECS P on P.PRCODE = POD.POD_PRICE_CODE and POD.POD_ENTRY_TYPE = 'P'
   left join STK_LOCATION L on L.LOC_CONCATCODE = POD.POD_STOCK_CODE + POD.POD_LOCATN and POD.POD_ENTRY_TYPE = 'S'