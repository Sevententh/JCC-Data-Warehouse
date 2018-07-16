﻿create view AA_ACD_DELIVERY_REPRINT_VIEW
/*
** Written     : 11/10/2005 DB
** Last Amended: 11/10/2005 DB, 06/01/2006 RV, 20/09/2006 RV, 18/02/08 NC,14/4/08chw
** Comments    : Returns SOP Delivery Note information for crystal reports
*/
as
select
   DOC_ORDER_HEADER.DOH_PRIMARY
,  DOC_ORDER_HEADER.DOH_ORDER_LINK
,  DOC_ORDER_HEADER.DOH_DOC_TYPE
,  DOC_ORDER_HEADER.DOH_DOC_DATE
,  DOC_ORDER_HEADER.DOH_COMP_ADDRESS
,  DOC_ORDER_HEADER.DOH_USER_ID

,  ORD_HEADER.OH_ORDER_REF
,  ORD_HEADER.OH_DEL_METHOD
,  ORD_HEADER.OH_ORDER_NUMBER
,  ORD_HEADER.OH_ACCOUNT_DELIVERY

,  DEL_ACCOUNT.CUNAME               as DEL_ACCOUNT__CUNAME
,  DHH_DELIVERYNOTE_NO
,  DHH_DELIVERY_ADDRESS

,  ORD_ACCOUNT.CUNAME               as ORD_ACCOUNT__CUNAME
,  DHH_INVOICE_ADDRESS

,  DOC_ORDER_DETAIL.DOD_PRIMARY
,  DOC_ORDER_DETAIL.DOD_HEADER_LINK
,  DOC_ORDER_DETAIL.DOD_QUANTITY
,  DOC_ORDER_DETAIL.DOD_QUANTITY_OS
,  DOC_ORDER_DETAIL.DOD_SERIAL_NO

,  ORD_DETAIL.OD_ENTRY_TYPE
,  ORD_DETAIL.OD_DETAIL
,  ORD_DETAIL.OD_QTYORD
,  ORD_DETAIL.OD_QTYUNIT
,  ORD_DETAIL.OD_TABLECODE
,  ORD_DETAIL.OD_SERIALTRACK
,  ORD_DETAIL.OD_LOCATN
,  ORD_DETAIL.OD_STOCK_CODE
,  ORD_DETAIL.OD_PRICE_CODE
,  ORD_DETAIL.OD_DELIVERY_CHARGE_FLAG

,  STK_STOCK.STKNAME

,  STK_STOCK_2.STK_SELL_NAME1
,  STK_STOCK_2.STK_SELL_NAME2
,  STK_STOCK_2.STK_SELL_NAME3
,  STK_STOCK_2.STK_SELL_NAME4
,  STK_STOCK_2.STK_SELL_NAME5
,  STK_STOCK_2.STK_SELL_NAME6
,  STK_STOCK_2.STK_SELL_NAME7
,  STK_STOCK_2.STK_SELL_NAME8
,  STK_STOCK_2.STK_SELL_NAME9
,  STK_STOCK_2.STK_SELL_NAME10

,  SYS_DATAINFO.SHOW_STOCK_CODE

,  SYS_DATAINFO2.STK_SOP_COPY_DESC

from
   DOC_ORDER_HEADER
      inner join  ORD_HEADER                       on       ORD_HEADER.OH_PRIMARY            = DOC_ORDER_HEADER.DOH_ORDER_LINK
      inner join  SL_ACCOUNTS    as DEL_ACCOUNT    on       DEL_ACCOUNT.CUCODE               = ORD_HEADER.OH_ACCOUNT_DELIVERY
      inner join  SYS_DEL_HISTORY_HEADER as DEL_ADDRESS on  DHH_ORDER_NO              = cast(cast(ORD_HEADER.OH_ORDER_NUMBER as bigint) as varchar(15))
      and (substring(DHH_ORIGIN,1,1) = 'S') and DOH_DOC_NUMBER = cast(DHH_DELIVERYNOTE_NO as varchar(15))
      inner join  SL_ACCOUNTS    as ORD_ACCOUNT    on       ORD_ACCOUNT.CUCODE               = ORD_HEADER.OH_ACCOUNT
      inner join  DOC_ORDER_DETAIL                 on       DOC_ORDER_DETAIL.DOD_HEADER_LINK = DOC_ORDER_HEADER.DOH_PRIMARY
      inner join  ORD_DETAIL                       on       ORD_DETAIL.OD_PRIMARY            = DOC_ORDER_DETAIL.DOD_ORDER_LINK
      left join   STK_STOCK                        on       STK_STOCK.STKCODE                = ORD_DETAIL.OD_STOCK_CODE
      left join   STK_STOCK_2                      on       STK_STOCK_2.STKCODE2             = STK_STOCK.STKCODE
      inner join  SYS_DATAINFO                     on       SYS_DATAINFO.SYS_PRIMARY         = DOC_ORDER_HEADER.DOH_SYS_LINK
      inner join  SYS_DATAINFO2                    on       SYS_DATAINFO2.SYS_PRIMARY_2      = SYS_DATAINFO.SYS_PRIMARY
