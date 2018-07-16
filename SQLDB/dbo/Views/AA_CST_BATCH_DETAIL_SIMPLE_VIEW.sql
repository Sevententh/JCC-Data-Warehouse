create view AA_CST_BATCH_DETAIL_SIMPLE_VIEW

/*
** Written: 02/02/06 LM
** Last Amended: 09/02/06 LM
*/

as

select
coalesce(CT_HEADER_REF,'') as CT_HEADER_REF,                                        -- Reference
CT_COSTHEADER,                                                                      -- Project Code
CT_COSTCENTRE,                                                                      -- Cost Centre Code
coalesce(CT_RESOURCE,'') as CT_RESOURCE,                                            -- Resource Code
CT_YEAR + (case when CT_WEEK_NO < 10 then '0' else '' end)
        + convert(varchar,CT_WEEK_NO) as YEAR_WEEK,                                 -- Year/Period
CT_YEAR + (case when CT_PERIODNUMBR < 10 then '0' else '' end)
        + convert(varchar,CT_PERIODNUMBR) as YEAR_PERIOD,                           -- Year/Week
round(coalesce(CT_QUANTITY,0),QUANTITY_DPS) as CT_QUANTITY,                         -- Quantity
0 as UPLIFTED_HOURLY_COST,                                                          -- Uplifted Hourly Cost
/*
CT_PRICE + case CC_UPLTYPE when 0 then CT_PRICE * CT_CENTRE_UPLV
                           when 1 then CT_CENTRE_UPLV end
         + case
*/
0 as UPLIFTED_VALUE,                                                                -- Uplifted Value
/*
round(coalesce(CT_NETT,0) + coalesce(CT_CENTRE_UPLV,0)
                          + coalesce(CT_RES_UPLV,0),VALUE_DPS) as UPLIFTED_VALUE,
*/
CT_TRANTYPE,                                                                        -- Transaction Type
coalesce(CTT_NAME,'') as CTT_NAME,                                                  -- Transaction Subtype
coalesce(CT_DETAIL,'') as CT_DETAIL,                                                -- Detail
coalesce(CH_NAME,'') as CH_NAME,                                                    -- Project Name
coalesce(CC_NAME,'') as CC_NAME,                                                    -- Cost Centre Name
coalesce(PRNAME,'') as PRNAME,                                                      -- Resource Name
CT_STATUS,                                                                          -- Posting Status
coalesce(CT_BATCH_REF,'') as CT_BATCH_REF,                                          -- Batch Reference
CT_WEEK_NO,                                                                         -- Week No.
0 as CURR_UPLIFTED_HOURLY_COST,                                                     -- Currency Uplifted Hourly Cost
0 as CURR_UPLIFTED_VALUE,                                                           -- Currency Uplifted Value
/*
round(coalesce(CT_CURR_VALUE,0) + coalesce(CT_CURR_CNTUPLV,0)
                                + coalesce(CT_CURR_RESUPLV,0),VALUE_DPS) as CURR_UPLIFTED_VALUE,
*/
CT_PRIMARY as [PRIMARY],                                                            -- Audit No.
CT_USER_PUTIN,                                                                      -- User Entered
CT_DATE_PUTIN,                                                                      -- Date Entered
coalesce(CT_ACCOUNT,'') as CT_ACCOUNT,                                              -- Customer Code
CT_PERIODNUMBR,
CT_YEAR,
CT_DATE,
coalesce(PP_CODE,'') as PP_CODE,
coalesce(PP_DEPARTMENT,'') as PP_DEPARTMENT,
coalesce(PR_EMPLOYEE_CODE,'') as PR_EMPLOYEE_CODE,
CH_PRIMARY,                                                                         -- Project Primary
CC_PRIMARY,                                                                         -- Cost Centre Primary
coalesce(PR_PRIMARY,0) as PR_PRIMARY                                                -- Resource Primary

from CST_DETAIL
left outer join CST_COSTHEADER
   on CT_COSTHEADER = CH_CODE
left outer join CST_COSTCENTRE
   on convert(char(10),CT_COSTHEADER) + CT_COSTCENTRE = CC_CONCAT_CODES
left outer join CST_TRANSACTION_SUBTYPE
   on CT_TRANSACTION_SUBTYPE_LINK = CTT_PRIMARY
left outer join PRC_PRICE_RECS
   on CT_RESOURCE = PRCODE
left outer join SYS_PEOPLE
   on PR_PERSON_LINK = PP_PRIMARY,
SYS_DATAINFO

where SYS_PRIMARY = 1