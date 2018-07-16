create view AA_CST_WIP_RELEASE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_WIP_RELEASE_LIST_S
**
** Written     :  12/01/2006 DB
** Last Amended:  13/01/2006 DB, 17/01/2006 NC, 23/01/2006 DB, 24/01/2006 DB, 09/02/2006 SH, 23/02/2006 DB
**
*/
as

select
   CT_PRIMARY                                                           as [PRIMARY]
,  CT_DATE                                                              as TransactionDate
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
,  CT_TRANTYPE                                                          as TransactionType
,  CT_HEADER_REF                                                        as HeaderReference
,  dbo.AA_VALUE_DPS_F
   (
      CT_UPLIFTED_COST
      -
      dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)
   )                                                                    as OutstandingValue
,  CT_COSTCENTRE                                                        as CostCentreCode
,  CT_RESOURCE                                                          as ResourceCode
,  CT_COSTHEADER                                                        as ProjectCode
,  CT_UPLIFTED_COST                                                     as UpliftedCostValue
,  isnull(CT_DESCRIPTION,'')                                            AS [Description]
,  isnull(CT_USRCHAR1,'')                                               as UserChar1
,  isnull(CT_USRCHAR2,'')                                               as UserChar2
,  isnull(CT_USRCHAR3,'')                                               as UserChar3
,  isnull(CT_USRCHAR4,'')                                               as UserChar4
,  isnull(CT_USRFLAG1,0)                                                as UserFlag1
,  isnull(CT_USRFLAG2,0)                                                as UserFlag2
,  CT_USRDATE1                                                          as UserDate1
,  CT_USRDATE2                                                          as UserDate2
,  isnull(CT_USRNUM1,0)                                                 as UserNumber1
,  isnull(CT_USRNUM2,0)                                                 as UserNumber2
,  CH_PRIMARY                                                           as CH_PRIMARY
,  isnull(CH_NAME,'')                                                   as CH_NAME
   from
      CST_DETAIL
         left  join CST_DETAIL2     on CT_PRIMARY_2   = CT_PRIMARY
         inner join CST_COSTHEADER  on CH_CODE        = CT_COSTHEADER
   where
            CT_POSTTYPE    = 'C'
      and   CT_ALLOCATED   = 0
      and   CT_STATUS      = 'A'
      and   CT_BATCH_FLAG  = 0

