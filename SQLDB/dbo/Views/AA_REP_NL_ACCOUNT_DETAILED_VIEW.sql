CREATE VIEW AA_REP_NL_ACCOUNT_DETAILED_VIEW
/*
** Written:      09/12/2005 RV
** Last Amended: 12/12/2005 RV, 20/04/2006 SB
*/
as

select
-- Display Fields
   N1.N_PRIMARY
,  N1.NMAJORHEADCODE
,  NL_MAJORNAME
--,  NL_MAJORMARKER
,  N1.NCODE
,  case N1.NTYPE
     when 'N' then 0
     when 'B' then 1
     when 'C' then 2
     when 'D' then 3
     when 'P' then 4
     when 'R' then 5
   end                                          as N_TYPE
,  N1.NNAME
,  N1.NCURRENCYCODE
,  CURREC_DESCRIPTION
,  isnull(N1.NCATEGORYCODE1,'')                 as N_CATEGORYCODE1
,  isnull(N1.NCATEGORYCODE2,'')                 as N_CATEGORYCODE2
,  isnull(N1.NCATEGORYCODE3,'')                 as N_CATEGORYCODE3
,  isnull(N1.NCATEGORYCODE4,'')                 as N_CATEGORYCODE4
,  isnull(N1.NCATEGORYCODE5,'')                 as N_CATEGORYCODE5
,  isnull(N1.NCATEGORYCODE6,'')                 as N_CATEGORYCODE6
,  isnull(N1.NCATEGORYCODE7,'')                 as N_CATEGORYCODE7
,  isnull(N1.NCATEGORYCODE8,'')                 as N_CATEGORYCODE8
,  cast (N1.N_USE_ZERO_BUDGET as bit)           as N_USE_ZERO_BUDGET
,  N1.NTURNOVRYTD_C
,  N1.NTURNOVERYTD
,  CAT1.NL_CATEGORYNAME                         as CAT1_NAME
,  CAT2.NL_CATEGORYNAME                         as CAT2_NAME
,  CAT3.NL_CATEGORYNAME                         as CAT3_NAME
,  CAT4.NL_CATEGORYNAME                         as CAT4_NAME
,  CAT5.NL_CATEGORYNAME                         as CAT5_NAME
,  CAT6.NL_CATEGORYNAME                         as CAT6_NAME
,  CAT7.NL_CATEGORYNAME                         as CAT7_NAME
,  CAT8.NL_CATEGORYNAME                         as CAT8_NAME
,  N1.NYEAR_END_CODE
,  N2.NNAME as NYEAR_END_NAME
,  N_LEVEL
,  cast (N1.N_EXCLUDE_TRNREP as bit)            as N_EXCLUDE_TRNREP
,  cast (N1.N_EXCLUDE_RECREP as bit)            as N_EXCLUDE_RECREP
,  cast (N1.N_CENTRALISED as bit)               as N_CENTRALISED
,  cast (N1.N_FORCE_COSTING as bit)             as N_FORCECOSTING
,  N1.NNOTES
,  cast (N1.N_PROFILE_REC as bit)               as N_PROFILEREC
,  N1.N_DATE_PUTIN
,  N1.N_DATE_EDITED
,  N_USRCHAR1
,  N_USRCHAR2
,  N_USRCHAR3
,  N_USRCHAR4
,  N_USRCHAR5
,  N_USRCHAR6
,  N_USRCHAR7
,  N_USRCHAR8
,  N_USRDATE1
,  N_USRDATE2
,  N_USRDATE3
,  cast (N_USRFLAG1 as bit)                     as N_USRFLAG1
,  cast (N_USRFLAG2 as bit)                     as N_USRFLAG2
,  cast (N_USRFLAG3 as bit)                     as N_USRFLAG3
,  dbo.AA_VALUE_DPS_F(N_USRNUM1)                as N_USR_NUM1
,  dbo.AA_VALUE_DPS_F(N_USRNUM2)                as N_USR_NUM2
,  dbo.AA_VALUE_DPS_F(N_USRNUM3)                as N_USR_NUM3
--,  cast (N1.NUSED as bit)                       as NUSED
,  N1.NBALANCE
,  dbo.AA_VALUE_DPS_F(N1.NBALANCE)              as N_BALANCE
,  dbo.AA_VALUE_DPS_F(N1.NBALANCE_C)            as NBALANCE_C
,  N1.N_USER_PUTIN
,  N1.N_USER_EDITED
,  dbo.AA_NL_ACCOUNT_EDITABLE_F( N1.NCODE, 1 )  as CODE_EDITABLE
,  dbo.AA_NL_ACCOUNT_EDITABLE_F( N1.NCODE, 2 )  as CURRENCY_EDITABLE

,  case when N1.NCODE in
      (
         SD.NOM_SALES
      ,  SD.NOM_SALES_DISC
      ,  SD.NOM_PURCHASE
      ,  SD.NOM_PURCH_DISC
      ,  SD2.NOM_EXDIFF
      ,  SD.NOM_SALES_CNTRL
      ,  SD.NOM_PURCH_CNTRL
      ,  SD.NOM_VAT_CNTRL
      ,  SD.NOM_YEAR_UPDATE
      ,  SD.NOM_SUSPENSE
      ,  SD2.NOM_RND_DIF_BASE1
      )
      then 1
      else 0
   end                                          as IS_SYSTEM_DEFAULT

,  CAT1.NL_SHORTNAME                            as CATEGORY_SHORT_NAME1
,  CAT2.NL_SHORTNAME                            as CATEGORY_SHORT_NAME2
,  CAT3.NL_SHORTNAME                            as CATEGORY_SHORT_NAME3
,  CAT4.NL_SHORTNAME                            as CATEGORY_SHORT_NAME4
,  CAT5.NL_SHORTNAME                            as CATEGORY_SHORT_NAME5
,  CAT6.NL_SHORTNAME                            as CATEGORY_SHORT_NAME6
,  CAT7.NL_SHORTNAME                            as CATEGORY_SHORT_NAME7
,  CAT8.NL_SHORTNAME                            as CATEGORY_SHORT_NAME8
,  N1.N_OVERDRAFT

-- Search Fields
,  N1.NCATEGORYCODE1
,  N1.NCATEGORYCODE2
,  N1.NCATEGORYCODE3
,  N1.NCATEGORYCODE4
,  N1.NCATEGORYCODE5
,  N1.NCATEGORYCODE6
,  N1.NCATEGORYCODE7
,  N1.NCATEGORYCODE8

,  N_USRNUM1
,  N_USRNUM2
,  N_USRNUM3

,  N1.N_FORCE_COSTING
,  N1.N_PROFILE_REC

from NL_ACCOUNTS N1

   inner join NL_ACCOUNTS2
   on N1.N_PRIMARY = NL_ACCOUNTS2.N_PRIMARY_2

   left join SYS_DATAINFO SD with ( nolock )
   on SD.SYS_PRIMARY = 1

   inner join SYS_DATAINFO2 SD2 with ( nolock )
   on SYS_PRIMARY_2 = SD.SYS_PRIMARY

   inner join NL_MAJORHEADING
   on N1.NMAJORHEADCODE = NL_MAJORHEADING.NL_MAJORCODE

   inner join SYS_CURRENCY_REC
   on N1.NCURRENCYCODE = SYS_CURRENCY_REC.CURREC_SYMBOL

   left outer join NL_ACCOUNTS N2
   on N1.NYEAR_END_CODE = N2.NCODE

   left outer join NL_CATEGORY CAT1
   on CAT1.NL_CAT_SORTCODE = '1' + N1.NCATEGORYCODE1

   left outer join NL_CATEGORY CAT2
   on CAT2.NL_CAT_SORTCODE = '2' + N1.NCATEGORYCODE2

   left outer join NL_CATEGORY CAT3
   on CAT3.NL_CAT_SORTCODE = '3' + N1.NCATEGORYCODE3

   left outer join NL_CATEGORY CAT4
   on CAT4.NL_CAT_SORTCODE = '4' + N1.NCATEGORYCODE4

   left outer join NL_CATEGORY CAT5
   on CAT5.NL_CAT_SORTCODE = '5' + N1.NCATEGORYCODE5

   left outer join NL_CATEGORY CAT6
   on CAT6.NL_CAT_SORTCODE = '6' + N1.NCATEGORYCODE6

   left outer join NL_CATEGORY CAT7
   on CAT7.NL_CAT_SORTCODE = '7' + N1.NCATEGORYCODE7

   left outer join NL_CATEGORY CAT8
   on CAT8.NL_CAT_SORTCODE = '8' + N1.NCATEGORYCODE8
