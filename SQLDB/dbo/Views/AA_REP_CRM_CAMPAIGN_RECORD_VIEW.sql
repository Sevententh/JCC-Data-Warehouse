create view AA_REP_CRM_CAMPAIGN_RECORD_VIEW
/*
** Written     :  21/03/2006 RV
** Last Amended:  05/04/2006 RV, 19/07/2006 RV
**
** Used by     :  Campaign Records Report.rpt
*/
as
select
   CMP_CODE
,  CMP_DESCRIPTION
,  CMP_ACTIVE
,  CMP_STARTDATE
,  CMS_STATUS
,  (
      select
         isnull
         (
            sum((OH_NETT*OH_PROBABILITY)/100),0
         )
         from
            ORD_HEADER
         where
                  OH_CAMPAIGN_LINK  = CMP_PRIMARY
            and   OH_PRIORITY       = 4
   )  as PipeLineValue
,  (
      select
         isnull(sum(OD_NETT),0)
         from
            ORD_HEADER
         ,  ORD_DETAIL
         where
                  OH_CAMPAIGN_LINK  = CMP_PRIMARY
            and   OH_ORDER_NUMBER   = OD_ORDER_NUMBER
            and   OD_QTYINVD        = 0
            and   OH_PRIORITY       <>4
   )  as CommittedSalesValue
,  (
      select
         isnull(sum(OD_NETT),0)
         from
            ORD_HEADER
         ,  ORD_DETAIL
         where
                  OH_CAMPAIGN_LINK  = CMP_PRIMARY
            and   OH_ORDER_NUMBER   = OD_ORDER_NUMBER
            and   OD_QTYINVD<>0
   )  as ActualSalesValue
,  (
      select
         count(*)
         from
            SL_CAMPAIGN_ASSIGN
         where
            SLC_CMP_STATUS_LINK  = CMS_PRIMARY
   )  as StatusCount
,  isnull(CH_CODE,'') as CH_CODE
,  isnull(CH_NAME,'') as CH_NAME
,  'ENGLISH   '       as LANGUAGE_LINK
   from
      CRM_CAMPAIGN
         left join SL_CAMPAIGN_ASSIGN  with(nolock)   on SLC_CMP_LINK      = CMP_PRIMARY
         left join CRM_CAMPAIGN_STATUS with(nolock)   on CMS_CAMPAIGN_LINK = CMP_PRIMARY
         left join SL_ACCOUNTS         with(nolock)   on CU_PRIMARY        = SLC_CU_LINK
         left join CST_COSTHEADER      with(nolock)   on CH_CAMPAIGN_CODE  = CMP_CODE
   where
      CMP_CODE <> ''