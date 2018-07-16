create view AA_SL_TRANSACTION_THREESIXTY_ORDER_DET_VIEW
/*
** Returns order detail line information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select OH.OH_ORDER_NUMBER as ORDER_NUMBER,
   isnull(OD.OD_STOCK_CODE,'') as OD_STOCK_CODE,
   isnull(OD.OD_PRICE_CODE,'') as OD_PRICE_CODE,
   case OD.OD_ENTRY_TYPE
      when 'T' then OD.OD_DETAIL
      else ''
   end as TEXT_LINE,
   isnull(STK.STKNAME,'') as STKNAME,
   isnull(P.PRNAME,'') as PRNAME,
   OD.OD_QTYORD,
   OD.OD_QTYDELVD,
   OD.OD_UNITCST,
   OD.OD_UNITCST_C,
   case OD.OD_TABLECODE
      when 'S1' then isnull(STK1.STK_SELL_NAME1,'')
      when 'S2' then isnull(STK1.STK_SELL_NAME2,'')
      when 'S3' then isnull(STK1.STK_SELL_NAME3,'')
      when 'S4' then isnull(STK1.STK_SELL_NAME4,'')
      when 'S5' then isnull(STK1.STK_SELL_NAME5,'')
      when 'S6' then isnull(STK1.STK_SELL_NAME6,'')
      when 'S7' then isnull(STK1.STK_SELL_NAME7,'')
      when 'S8' then isnull(STK1.STK_SELL_NAME8,'')
      when 'S9' then isnull(STK1.STK_SELL_NAME9,'')
      when 'S10' then isnull(STK1.STK_SELL_NAME10,'')
      else ''
   end as STOCK_UNIT,
   OH.OH_CURRENCYCODE,
   isnull(OD.OD_LOCATN,'') as OD_LOCATN,
   isnull(L.LOC_NAME,'') as LOC_NAME,
   isnull(OD.OD_SERIALNO,'') as OD_SERIALNO,
   isnull(STK.STK_SORT_KEY1,'') as STK_SORT_KEY1,
   isnull(STK.STK_SORT_KEY2,'') as STK_SORT_KEY2,
   isnull(STK.STK_SORT_KEY3,'') as STK_SORT_KEY3,
   isnull(D.DET_DIMENSION1,'') as DET_DIMENSION1,
   isnull(D.DET_DIMENSION2,'') as DET_DIMENSION2,
   isnull(D.DET_DIMENSION3,'') as DET_DIMENSION3,
   isnull(OD.OD_RTP_POPNO,'') as OD_RTP_POPNO,
   isnull(PH.POH_ACCOUNT,'') as POH_ACCOUNT,
   isnull(S.SUNAME,'') as SUNAME,
   OD.OD_PRIMARY --Required for ordering

from ORD_HEADER OH
   inner join ORD_DETAIL OD on OD.OD_ORDER_NUMBER = OH.OH_ORDER_NUMBER
   left join SL_PL_NL_DETAIL D on D.DET_ORDER_LINK = OD.OD_PRIMARY and D.DET_LEDGER = 'SL'
   left join STK_STOCK STK on STK.STKCODE = OD.OD_STOCK_CODE and OD.OD_ENTRY_TYPE = 'S'
   left join STK_STOCK_2 STK1 on STK1.STK_PRIMARY_2 = STK_PRIMARY
   left join PRC_PRICE_RECS P on P.PRCODE = OD.OD_PRICE_CODE and OD.OD_ENTRY_TYPE = 'P'
   left join STK_LOCATION L on L.LOC_CONCATCODE = OD.OD_STOCK_CODE + OD.OD_LOCATN and OD.OD_ENTRY_TYPE = 'S'
   left join POP_HEADER PH on PH.POH_ORDER_NUMBR = OD.OD_RTP_POPNO
   left join PL_ACCOUNTS S on S.SUCODE = PH.POH_ACCOUNT