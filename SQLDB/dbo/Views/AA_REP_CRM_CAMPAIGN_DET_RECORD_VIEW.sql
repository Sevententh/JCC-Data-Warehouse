﻿CREATE VIEW AA_REP_CRM_CAMPAIGN_DET_RECORD_VIEW
/*
** Written     :  23/03/2006 RV
** Last Amended:  07/04/2006 RV, 10/04/2006 RV, 18/04/2006 RV, 19/07/2006 RV
**
** Used by     :  Campaign Detailed Report.rpt
*/
AS
Select


CRM_CAMPAIGN.CMP_CODE,
CMP_DESCRIPTION,
CMP_ACTIVE,
CMP_STARTDATE,
CMP_CAMPAIGN_COST,
CMP_USRCHAR1,
CMP_USRCHAR2,
CMP_USRCHAR3,
CMP_USRCHAR4,
CMP_USRCHAR5,
CMP_USRCHAR6,
CMP_USRCHAR7,
CMP_USRCHAR8,
CMP_USRCHAR9,
CMP_USRCHAR10,
CMP_USRCHAR11,
CMP_USRCHAR12,
CMP_USRDATE1,
CMP_USRDATE2,
CMP_USRDATE3,
CMP_USRDATE4,
CMP_USRDATE5,
CMP_USRNUM1,
CMP_USRNUM2,
CMP_USRNUM3,
CMP_USRNUM4,
CMP_USRNUM5,
CMP_NOTES,
CMP_DATE_PUTIN,
CMP_DATE_EDITED,

(select isnull(sum((OH_NETT*OH_PROBABILITY)/100),0) from ORD_HEADER where OH_CAMPAIGN_LINK = CMP_PRIMARY and OH_PRIORITY = 4)
as PipeLineValue,


(select isnull(sum(OH_NETT),0) from ORD_HEADER where OH_CAMPAIGN_LINK = CMP_PRIMARY and OH_PRIORITY = 4)
as EstimateValue,

(select isnull(sum(OD_NETT),0) from ORD_HEADER,ORD_DETAIL where OH_CAMPAIGN_LINK = CMP_PRIMARY
       and OH_ORDER_NUMBER = OD_ORDER_NUMBER and OD_QTYINVD = 0 and OH_PRIORITY <> 4 )
as CommittedSalesValue,

(select isnull(sum(OD_NETT),0) from ORD_HEADER,ORD_DETAIL where OH_CAMPAIGN_LINK = CMP_PRIMARY
      and OH_ORDER_NUMBER = OD_ORDER_NUMBER and OD_QTYINVD <> 0 )
as ActualSalesValue,

isnull(L.CountOrders,0) as CountOrders,
isnull(M.CountConfOrders,0) as CountConfOrders,
isnull(CH_CODE,'') As CH_CODE,
isnull(CH_NAME,'') As CH_NAME,
'ENGLISH   ' As LANGUAGE_LINK

from CRM_CAMPAIGN
   left outer join SL_CAMPAIGN_ASSIGN
   on CMP_PRIMARY = SLC_CMP_LINK

   left outer join SL_ACCOUNTS
   on SLC_CU_LINK = CU_PRIMARY

   left outer join CST_COSTHEADER
   on CH_CAMPAIGN_CODE = CMP_CODE

   Left Outer Join (select count(CMP_CODE) AS CountOrders, CMP_CODE from CRM_CAMPAIGN
               LEFT OUTER JOIN ORD_HEADER       ON OH_CAMPAIGN_LINK = CMP_PRIMARY
                           where OH_PRIORITY = 4
   Group By CMP_CODE) L on L.CMP_CODE = CRM_CAMPAIGN.CMP_CODE

   Left Outer Join (select count(CMP_CODE) AS CountConfOrders, CMP_CODE from CRM_CAMPAIGN
               LEFT OUTER JOIN ORD_HEADER       ON OH_CAMPAIGN_LINK = CMP_PRIMARY
                           where OH_PRIORITY <> 4
   Group By CMP_CODE) M on M.CMP_CODE = CRM_CAMPAIGN.CMP_CODE


where CRM_CAMPAIGN.CMP_CODE <> ''

