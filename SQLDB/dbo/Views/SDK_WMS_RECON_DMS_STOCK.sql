create view dbo.SDK_WMS_RECON_DMS_STOCK
as
SELECT stkcode as 'ProductCode'
, STKNAME as 'Description'
, Batch as 'Batch'
, PhysQuantity+NonPhysicalQty as 'Quantity'
, NonPhysicalQty as 'NonPhysicalQuantity'
FROM 
(
SELECT
 StkCode
,STKNAME
,Batch
,SUM(PhysQuantity) as PhysQuantity
,Sum(SdkQuantity) as NonPhysicalQty
FROM
(
/* Stock physical */
Select
 STKCODE as StkCode
,STKNAME
,SUM(dbo.AA_QUANTITY_DPS_F(case when DELT_BATCH_TRACE = 1 then LOC_PHYSICAL+LOC_QTYPRINTED else STK_PHYSICAL+STK_QTYPRINTED end )) as PhysQuantity
,0 SdkQuantity
,isnull(case DELT_BATCH_REF when 'LOC_USERSORT1' then LOC_USERSORT1 when 'LOC_USERSORT2' then LOC_USERSORT2 when 'LOC_USERSORT3' then LOC_USERSORT3 end,'') as Batch
from STK_STOCK
left join SDK_WMS_TEMPLATE_ASSIGN on WMSS_STK_PRIMARY = STK_PRIMARY
left join SDK_WMS_TEMPLATE on WMSS_DELT_PRIMARY = DELT_PRIMARY
left join STK_LOCATION on LOC_STOCK_CODE = STKCODE and DELT_BATCH_TRACE = 1
where STK_SORT_KEY <> '08-ice-cream'
Group by STKCODE, STKNAME, isnull(case DELT_BATCH_REF when 'LOC_USERSORT1' then LOC_USERSORT1 when 'LOC_USERSORT2' then LOC_USERSORT2 when 'LOC_USERSORT3' then LOC_USERSORT3 end,'')
UNION all
/* Batched traced Purchase orders that have had their putaway notifiation from Delta accepted in Dimensions populating POD_LOCATN, but have not yet been delivered due to template option not to. */
select 
  POD_STOCK_CODE as StkCode
, STKNAME
, 0 PhysQuantity
, dbo.AA_QUANTITY_DPS_F((POD_QTYORD - POD_QTYDELVD)*POD_QTYUNIT) as SdkQuantity
, isnull(case DELT_BATCH_REF when 'LOC_USERSORT1' then LOC_USERSORT1 when 'LOC_USERSORT2' then LOC_USERSORT2 when 'LOC_USERSORT3' then LOC_USERSORT3 end,'') as Batch
FROM POP_DETAIL
     join POP_HEADER ON POD_ORDER_NO = POH_ORDER_NUMBR
     join STK_STOCK on POD_STOCK_CODE = STKCODE
     join STK_LOCATION on POD_LOCATN = LOC_CODE
     join SDK_WMS_TEMPLATE_ASSIGN on WMSS_STK_PRIMARY = STK_PRIMARY
     join SDK_WMS_TEMPLATE on WMSS_DELT_PRIMARY = DELT_PRIMARY
     join SDK_WMS_SETTINGS on SDK_WMS_SETTINGS.WMSS_PRIMARY = 1
WHERE POH_POP_ORDER_STATUS_LINK = WMSS_PO_STEP3 and POD_ENTRY_TYPE = 'S' and POH_TYPE = 'O' 
   and POH_BATCH_FLAG = 1 and DELT_PO_DO_NOT_UPD_STK = 1 and DELT_BATCH_TRACE = 1
   and STK_SORT_KEY <> '08-ice-cream'
UNION all
/* Non Batched traced Purchase orders that have had their putaway notifiation from Delta accepted in Dimensions, but have not yet been delivered due to template option not to. */
select 
  POD_STOCK_CODE as StkCode
, STKNAME
, 0 PhysQuantity
, dbo.AA_QUANTITY_DPS_F(WMTD_ITEM_QTY) as SdkQuantity
, '' as Batch
FROM POP_DETAIL
     join POP_HEADER ON POD_ORDER_NO = POH_ORDER_NUMBR
     join STK_STOCK on POD_STOCK_CODE = STKCODE
     join SDK_WMS_TEMPLATE_ASSIGN on WMSS_STK_PRIMARY = STK_PRIMARY
     join SDK_WMS_TEMPLATE on WMSS_DELT_PRIMARY = DELT_PRIMARY
     join SDK_WMS_SETTINGS on SDK_WMS_SETTINGS.WMSS_PRIMARY = 1
     join SDK_WMS_REVIEW_HEADER on WMTH_TYPE = 'PUTAWAYEXP' and WMTH_SUBTYPE2 = 'GI' and WMTH_REF10 not like 'WO%' and WMTH_STATUS = 1 and POH_PRIMARY=case when isnumeric(WMTH_REF10) = 1 then convert(float,WMTH_REF10) else 0 end
     join SDK_WMS_REVIEW_DETAIL on WMTD_WMTH_PRIMARY = WMTH_PRIMARY and POD_PRIMARY=case when isnumeric(WMTD_LINE_REF) = 1 then convert(float,WMTD_LINE_REF) else 0 end
WHERE POH_POP_ORDER_STATUS_LINK = WMSS_PO_STEP3 and POD_ENTRY_TYPE = 'S' and POH_TYPE = 'O' 
   and POH_BATCH_FLAG = 1 and DELT_PO_DO_NOT_UPD_STK = 1 and DELT_BATCH_TRACE = 0
   and STK_SORT_KEY <> '08-ice-cream'
UNION all
/* POP & WO Putaway notifiation from Delta that have not yet been accepted by Dimensions*/
select
     b.WMTD_STKCODE as StkCode
   , c.STKNAME
   , 0 PhysQuantity
   , sum(b.WMTD_ITEM_QTY) as SdkQuantity
   , isnull(b.WMTD_BATCH,'') as Batch
   FROM SDK_WMS_REVIEW_DETAIL as b
      JOIN SDK_WMS_REVIEW_HEADER as A on A.WMTH_PRIMARY = b.WMTD_WMTH_PRIMARY and A.WMTH_TYPE = 'PUTAWAYEXP' and A.WMTH_SUBTYPE2 = 'GI' and A.WMTH_STATUS = 0
      JOIN STK_STOCK as c on c.STKCODE = b.WMTD_STKCODE
   where c.STK_SORT_KEY <> '08-ice-cream'
   group by b.WMTD_STKCODE, c.STKNAME, b.WMTD_BATCH
UNION all
/* SOP Putaway notifiation from Delta that have not yet been accepted by Dimensions*/
select
     b.WMTD_STKCODE as StkCode
   , c.STKNAME
   , 0 PhysQuantity
   , sum(b.WMTD_ITEM_QTY) as SdkQuantity
   , isnull(b.WMTD_BATCH,'') as Batch
   FROM SDK_WMS_REVIEW_DETAIL as b
      JOIN SDK_WMS_REVIEW_HEADER as A on A.WMTH_PRIMARY = b.WMTD_WMTH_PRIMARY and A.WMTH_TYPE = 'PUTAWAYEXP' and A.WMTH_SUBTYPE2 = 'RT' and A.WMTH_STATUS = 0
      JOIN STK_STOCK as c on c.STKCODE = b.WMTD_STKCODE
   where STK_SORT_KEY <> '08-ice-cream'
   group by b.WMTD_STKCODE, c.STKNAME, b.WMTD_BATCH
UNION all
/* Pick notifiation from Delta that have not yet been accepted by Dimensions*/
select
     b.WMTD_STKCODE as StkCode
   , c.STKNAME
   , 0 PhysQuantity
   , sum(- b.WMTD_ITEM_QTY) as SdkQuantity
   , isnull(b.WMTD_BATCH,'') as Batch
   FROM SDK_WMS_REVIEW_DETAIL as b
      JOIN SDK_WMS_REVIEW_HEADER as A on A.WMTH_PRIMARY = b.WMTD_WMTH_PRIMARY and A.WMTH_TYPE = 'PICKEXPORT' and A.WMTH_STATUS = 0
      JOIN STK_STOCK as c on c.STKCODE = b.WMTD_STKCODE
   where STK_SORT_KEY <> '08-ice-cream'
   group by b.WMTD_STKCODE, c.STKNAME, b.WMTD_BATCH
UNION all
/* Adjustments from Delta that have not yet been accepted by Dimensions*/
select
     b.WMTD_STKCODE as StkCode
   , c.STKNAME
   , 0 PhysQuantity
   , sum(case WMTH_SUBTYPE when 'POS' then b.WMTD_ITEM_QTY else -b.WMTD_ITEM_QTY end) as SdkQuantity
   , isnull(b.WMTD_BATCH,'') as Batch
   FROM SDK_WMS_REVIEW_DETAIL as b
      JOIN SDK_WMS_REVIEW_HEADER as A on A.WMTH_PRIMARY = b.WMTD_WMTH_PRIMARY and A.WMTH_TYPE = 'ADJUSTEXP' and A.WMTH_STATUS = 0
      JOIN STK_STOCK as c on c.STKCODE = b.WMTD_STKCODE
   where STK_SORT_KEY <> '08-ice-cream'
   group by b.WMTD_STKCODE, c.STKNAME, b.WMTD_BATCH
) as D
GROUP BY StkCode, STKNAME, Batch) as F
Where f.PhysQuantity+f.NonPhysicalQty <> 0
