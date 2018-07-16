CREATE VIEW AA_WORKS_ORDER_DETAILS_VIEW
/*
** View to find the components (includes Assemblies (Child Works Orders) and stock/price/text items) for a Works Order 
**
** Written:			5/8/05 chw
** Last Amended:		18/8/05chw;19/8/05chw;10/10/05chw
*/

( OrderNumber
,STKCODE
,STKNAME
,WC_TYPE
,WC_QUANTITY_REQUIRED
,WC_QUANTITY_ISSUED
,WC_QUANTITY_ALLOC
,Needed
,RTPFlag
,WcType
,Parent
,Toplevel
,WcPrimary
,WcRoute
,Status
)
as
(
select
--Child WOs
(case when WO_LEVEL > 1 then WO_ORDER_NUMBER else '' end) as OrderNumber
,STKCODE
,STKNAME
,'S' as WC_TYPE
,WO_QUANTITY as WC_QUANTITY_REQUIRED
,isnull(WO_QUANTITY_ISSUED,0) as WC_QUANTITY_ISSUED
,0 as WC_QUANTITY_ALLOC
,WO_QUANTITY-isnull(WO_QUANTITY_ISSUED,0) as Needed
,' ' as RTPFlag
,'Z' as WCType
,WO_PARENT_ORDER_NUMBER as Parent
,WO_TOP_LEVEL_ORDER_NUMBER as Toplevel
,0 as WcPrimary
--Child Route
,WR_ROUTE as WcRoute
,WO_STATUS as Status 
from WO_ORDERS left join STK_STOCK on STK_PRIMARY = WO_STOCK_LINK 
left join WO_ROUTES  on WR_PRIMARY = WO_ROUTE_LINK 

union
select
--Stock Components
 null
,STKCODE
,STKNAME
,WC_TYPE
,isnull(WC_QUANTITY_REQUIRED,0)
,isnull(WC_QUANTITY_ISSUED,0)
,isnull(WC_QUANTITY_ALLOC,0)
,WC_QUANTITY_REQUIRED-isnull(WC_QUANTITY_ISSUED,0)-isnull(WC_QUANTITY_ALLOC,0) as Needed
,(case WC_RTP_FLAG when 0 then '' when 1 then 'RTP' when 2 then 'PO' else '' end) as RTPFlag 
,WC_TYPE as WCType
,WC_ORDER_NUMBER
,WC_TOP_LEVEL_ORDER_NUMBER
,WC_PRIMARY
,null
,null
from WO_COMPONENTS left join STK_STOCK on STK_PRIMARY = WC_PART_LINK where WC_TYPE = 'S'
--Price Components
union
select
null
,PRCODE
,PRNAME
,WC_TYPE
,isnull(WC_QUANTITY_REQUIRED,0)
,isnull(WC_QUANTITY_ISSUED,0)
,isnull(WC_QUANTITY_ALLOC,0)
,WC_QUANTITY_REQUIRED-isnull(WC_QUANTITY_ISSUED,0) as Needed
,(case WC_RTP_FLAG when 0 then '' when 1 then 'RTP' when 2 then 'PO' else '' end) as RTPFlag
,(case WC_LABOUR when 0 then WC_TYPE else 'L' end) as WCType
,WC_ORDER_NUMBER
,WC_TOP_LEVEL_ORDER_NUMBER
,WC_PRIMARY
,null
,null
from WO_COMPONENTS left join PRC_PRICE_RECS on PR_PRIMARY = WC_PART_LINK where WC_TYPE = 'P' 
--Text Components
union
select
null
,TEXT
,WC_TEXT
,WC_TYPE
,isnull(WC_QUANTITY_REQUIRED,0)
,isnull(WC_QUANTITY_ISSUED,0)
,isnull(WC_QUANTITY_ALLOC,0)
,WC_QUANTITY_REQUIRED-isnull(WC_QUANTITY_ISSUED,0) as Needed
,(case WC_RTP_FLAG when 0 then '' when 1 then 'RTP' when 2 then 'PO' else '' end) as RTPFlag
,(case WC_LABOUR when 0 then WC_TYPE else 'L' end) as WCType
,WC_ORDER_NUMBER
,WC_TOP_LEVEL_ORDER_NUMBER
,WC_PRIMARY
,null
,null
from WO_COMPONENTS,LANG_DEF1 where WC_TYPE = 'T' and LANGCODE_DEF1='ENGLISH'
--
)

 
