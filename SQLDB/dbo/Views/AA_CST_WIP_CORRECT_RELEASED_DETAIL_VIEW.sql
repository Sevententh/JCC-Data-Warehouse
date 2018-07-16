create view AA_CST_WIP_CORRECT_RELEASED_DETAIL_VIEW
/*
** Returns a table to be used specifically with AA_CST_WIP_CORRECT_RELEASED_DETAIL_LIST_S
**
** Written     :  25/01/2006 DB
** Last Amended:  30/01/2006 SH, 23/02/2006 DB
**
*/
as

select
   CAD_TRANSACTION_LINK                                                 as [PRIMARY]
,  CAD_HEADER_LINK
,  CAH_ALLOC_DATE                                                       as DateReleased
,  CT_YEAR                                                              as [Year]
,  CT_PERIODNUMBR                                                       as Period
,  CT_YEAR
   +
   case
      when CT_PERIODNUMBR<10 then '0'
      else
         ''
   end
   +
   convert(varchar,CT_PERIODNUMBR)                                      as YearPeriod
,  CT_TRANTYPE
,  isnull(CT_HEADER_REF,'')                                             as TransReference
,  isnull(CT_DESCRIPTION,'')                                            as [Description]
,  CT_UPLIFTED_COST                                                     as UpliftedCostValue
,  CAD_VALUE                                                            as ReleasedValue
,  CT_COSTCENTRE                                                        as CostCentreCode
,  CT_RESOURCE                                                          as ResourceCode
,  CAH_PROJECT_LINK                                                     as ProjectPrimary
,  CT_COSTHEADER                                                        as ProjectCode
,  isnull(CT_USRCHAR1,'')                                               as CT_USRCHAR1
,  isnull(CT_USRCHAR2,'')                                               as CT_USRCHAR2
,  isnull(CT_USRCHAR3,'')                                               as CT_USRCHAR3
,  isnull(CT_USRCHAR4,'')                                               as CT_USRCHAR4
,  dbo.AA_VALUE_DPS_F(CT_USRNUM1)                                       as CT_USRNUM1
,  dbo.AA_VALUE_DPS_F(CT_USRNUM2)                                       as CT_USRNUM2
,  CT_USRDATE1
,  CT_USRDATE2
,  isnull(CT_USRFLAG1,0)                                                as CT_USRFLAG1
,  isnull(CT_USRFLAG2,0)                                                as CT_USRFLAG2

-- Search Only fields
,  CT_DATE_PUTIN                                                        as TransDate
,  CT_GROSS                                                             as TransValue
,  CT_DESCRIPTION
,  CAH_REFERENCE                                                        as Reference
,  CAH_ALLOC_USER                                                       as ReleasedBy
   from
      CST_ALLOC_HISTORY_HEADER
         inner join CST_ALLOC_HISTORY_DETAIL on CAD_HEADER_LINK   = CAH_PRIMARY
            left  join CST_DETAIL               on CT_PRIMARY        = CAD_TRANSACTION_LINK
               left  join CST_DETAIL2              on CT_PRIMARY_2      = CT_PRIMARY
   where
            CT_ALLOCATED   = 1
      and   CT_BATCH_FLAG  = 0
      and   CT_STATUS      = 'A'
