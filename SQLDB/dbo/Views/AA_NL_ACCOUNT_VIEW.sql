create view AA_NL_ACCOUNT_VIEW
/*
** Written:      27/02/04 SR
** Last Amended: 06/08/04 SRB, 09/08/04 SRB, 10/08/04 NC, 01/11/04 SH, 01/12/2004 SH, 21/04/05 SRB, 27/07/2005 DB, 12/08/2005 SH, 8/12/05 LM, 08/12/2005 JC, 13/12/05 NC, 19/12/05 NC, 12/03/2007 SH
*/
as

select
   NOne.N_PRIMARY as [PRIMARY],
   NOne.NMAJORHEADCODE,
   NL_MAJORNAME,
   NL_MAJORMARKER,
   (case D.DUPLICATE when 1 then '' else NOne.NCODE end) as NCODE,
   case NOne.NTYPE
      when 'N' then 0
      when 'B' then 1
      when 'C' then 2
      when 'D' then 3
      when 'P' then 4
      when 'R' then 5 end AS N_TYPE,
   NOne.NNAME,
   NOne.NCURRENCYCODE,
   CURREC_DESCRIPTION,
   NOne.NCATEGORYCODE1,
   NOne.NCATEGORYCODE2,
   NOne.NCATEGORYCODE3,
   NOne.NCATEGORYCODE4,
   NOne.NCATEGORYCODE5,
   NOne.NCATEGORYCODE6,
   NOne.NCATEGORYCODE7,
   NOne.NCATEGORYCODE8,
   NOne.N_USE_ZERO_BUDGET,
   NOne.NTURNOVRYTD_C,
   NOne.NTURNOVERYTD,
   CategoryOne.NL_CATEGORYNAME as CATEGORY_NAME1,
   CategoryTwo.NL_CATEGORYNAME as CATEGORY_NAME2,
   CategoryThree.NL_CATEGORYNAME as CATEGORY_NAME3,
   CategoryFour.NL_CATEGORYNAME as CATEGORY_NAME4,
   CategoryFive.NL_CATEGORYNAME as CATEGORY_NAME5,
   CategorySix.NL_CATEGORYNAME as CATEGORY_NAME6,
   CategorySeven.NL_CATEGORYNAME as CATEGORY_NAME7,
   CategoryEight.NL_CATEGORYNAME as CATEGORY_NAME8,
   NOne.NYEAR_END_CODE,
   NTwo.NNAME as NYEAR_END_NAME,
   N_LEVEL,
   NOne.N_EXCLUDE_TRNREP,
   NOne.N_EXCLUDE_RECREP,
   NOne.N_CENTRALISED,
   NOne.N_FORCE_COSTING,
   (case D.DUPLICATE when 1 then '' else NOne.NNOTES end) as NNOTES,
   NOne.N_PROFILE_REC,
   (case D.DUPLICATE when 1 then NULL else NOne.N_DATE_PUTIN end) as N_DATE_PUTIN,
   (case D.DUPLICATE when 1 then NULL else NOne.N_DATE_EDITED end) as N_DATE_EDITED,
   N_USRCHAR1,
   N_USRCHAR2,
   N_USRCHAR3,
   N_USRCHAR4,
   N_USRCHAR5,
   N_USRCHAR6,
   N_USRCHAR7,
   N_USRCHAR8,
   N_USRDATE1,
   N_USRDATE2,
   N_USRDATE3,
   N_USRFLAG1,
   N_USRFLAG2,
   N_USRFLAG3,
   dbo.AA_VALUE_DPS_F(N_USRNUM1) as N_USRNUM1,
   dbo.AA_VALUE_DPS_F(N_USRNUM2) as N_USRNUM2,
   dbo.AA_VALUE_DPS_F(N_USRNUM3) as N_USRNUM3,
   (case D.DUPLICATE when 1 then 0 else NOne.NBUDGET_N1_O end) as NBUDGET_N1_O,
   (case D.DUPLICATE when 1 then 0 else NOne.N_PRIMARY end) as N_PRIMARY,
   (case D.DUPLICATE when 1 then 0 else NOne.NUSED end) as NUSED,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(NOne.NBALANCE) end) as NBALANCE,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(NOne.NBALANCE_C) end) as NBALANCE_C,
   (case D.DUPLICATE when 1 then NULL else NOne.N_USER_PUTIN end) as N_USER_PUTIN,
   (case D.DUPLICATE when 1 then NULL else NOne.N_USER_EDITED end) as N_USER_EDITED,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_NL_ACCOUNT_EDITABLE_F( NOne.NCODE, 1 ) end) as CODE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_NL_ACCOUNT_EDITABLE_F( NOne.NCODE, 2 ) end) as CURRENCY_EDITABLE,
   (case D.DUPLICATE when 1 then NOne.N_PRIMARY else 0 end) as DUPLICATE_PRIMARY,

   (case D.DUPLICATE when 1 then 0 else case when NOne.NCODE in (SD.NOM_SALES,SD.NOM_SALES_DISC,SD.NOM_PURCHASE,
                                                                  SD.NOM_PURCH_DISC,SD2.NOM_EXDIFF,SD.NOM_SALES_CNTRL,
                                                                  SD.NOM_PURCH_CNTRL,SD.NOM_VAT_CNTRL,SD.NOM_YEAR_UPDATE,
                                                                  SD.NOM_SUSPENSE,SD2.NOM_RND_DIF_BASE1)
                                             then 1
                                          else 0
   end end) as IS_SYSTEM_DEFAULT,

   CategoryOne.NL_SHORTNAME as CATEGORY_SHORT_NAME1,
   CategoryTwo.NL_SHORTNAME as CATEGORY_SHORT_NAME2,
   CategoryThree.NL_SHORTNAME as CATEGORY_SHORT_NAME3,
   CategoryFour.NL_SHORTNAME as CATEGORY_SHORT_NAME4,
   CategoryFive.NL_SHORTNAME as CATEGORY_SHORT_NAME5,
   CategorySix.NL_SHORTNAME as CATEGORY_SHORT_NAME6,
   CategorySeven.NL_SHORTNAME as CATEGORY_SHORT_NAME7,
   CategoryEight.NL_SHORTNAME as CATEGORY_SHORT_NAME8,
   NOne.N_OVERDRAFT,
   (case D.DUPLICATE when 0 then NOne.N_DO_NOT_USE else 0 end) as N_EXCLUDED,
   NThree.NCODE as DefaultYearEndCode,
   NThree.NNAME as DefaultYearEndName
from
   NL_ACCOUNTS NOne
   inner join NL_ACCOUNTS2 on NOne.N_PRIMARY = NL_ACCOUNTS2.N_PRIMARY_2
   cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
   left join SYS_DATAINFO SD with ( nolock ) on SD.SYS_PRIMARY = 1
   inner join SYS_DATAINFO2 SD2 with ( nolock ) on SYS_PRIMARY_2 = SD.SYS_PRIMARY
   inner join NL_MAJORHEADING on NOne.NMAJORHEADCODE = NL_MAJORHEADING.NL_MAJORCODE
   inner join SYS_CURRENCY_REC   on NOne.NCURRENCYCODE = SYS_CURRENCY_REC.CURREC_SYMBOL
   left outer join NL_ACCOUNTS NTwo on NOne.NYEAR_END_CODE = NTwo.NCODE
   left outer join NL_ACCOUNTS NThree on CURREC_NOM_YEAR_END = NThree.NCODE
   left outer join NL_CATEGORY CategoryOne on NOne.NCATEGORYCODE1 = CategoryOne.NL_CAT_CODE1
   left outer join NL_CATEGORY CategoryTwo on NOne.NCATEGORYCODE2 = CategoryTwo.NL_CAT_CODE2
   left outer join NL_CATEGORY CategoryThree on NOne.NCATEGORYCODE3 = CategoryThree.NL_CAT_CODE3
   left outer join NL_CATEGORY CategoryFour on NOne.NCATEGORYCODE4 = CategoryFour.NL_CAT_CODE4
   left outer join NL_CATEGORY CategoryFive on NOne.NCATEGORYCODE5 = CategoryFive.NL_CAT_CODE5
   left outer join NL_CATEGORY CategorySix on NOne.NCATEGORYCODE6 = CategorySix.NL_CAT_CODE6
   left outer join NL_CATEGORY CategorySeven on NOne.NCATEGORYCODE7 = CategorySeven.NL_CAT_CODE7
   left outer join NL_CATEGORY CategoryEight on NOne.NCATEGORYCODE8 = CategoryEight.NL_CAT_CODE8