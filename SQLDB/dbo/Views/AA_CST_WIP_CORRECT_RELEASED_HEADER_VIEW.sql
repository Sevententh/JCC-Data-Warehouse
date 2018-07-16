create view AA_CST_WIP_CORRECT_RELEASED_HEADER_VIEW
/*
** Returns a table to be used specifically with AA_CST_WIP_CORRECT_RELEASED_HEADER_LIST_S
**
** Written     :  24/01/2006 DB
** Last Amended:  03/02/2006 SH
**
*/
as

select distinct
   CAH_PRIMARY                            as [PRIMARY]
,  CAH_REFERENCE                          as Reference
,  (
      select
         sum(CAD_VALUE)
         from
            CST_ALLOC_HISTORY_DETAIL
         where
            CAD_HEADER_LINK=CAH_PRIMARY
   )                                      as TotalReleased
,  CAH_ALLOC_DATE                         as DateReleased
,  YEAR_COSTING_CODE
   +
   case
      when CAH_PERIOD<10 then '0'
      else
         ''
   end
   +
   convert(varchar,CAH_PERIOD)            as Period
,  CAH_ALLOC_USER                         as ReleasedBy
,  CH_NAME                                as ProjectName
,  CH_PRIMARY                             as ProjectPrimary

-- For Searching only
,  CT_COSTHEADER                          as ProjectCode

   from
      CST_ALLOC_HISTORY_HEADER
         inner join  SYS_YEAR       on YEAR_PRIMARY      = CAH_YEAR_LINK
         inner join  (
                        select
                           max(CAD_HEADER_LINK) as CAD_HEADER_LINK
                        ,  CAD_TRANSACTION_LINK
                           from
                              CST_ALLOC_HISTORY_DETAIL
                           group by
                              CAD_TRANSACTION_LINK
                     ) M            on CAD_HEADER_LINK   = CAH_PRIMARY
         inner join CST_DETAIL      on CT_PRIMARY        = CAD_TRANSACTION_LINK
         inner join CST_COSTHEADER  on CH_CODE           = CT_COSTHEADER
   where
            isnull(CT_ALLOCATED,0)  = 1
      and   isnull(CT_BATCH_FLAG,0) = 0
      and   isnull(CT_STATUS,'')    = 'A'
