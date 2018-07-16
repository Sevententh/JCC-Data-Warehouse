create view AA_SL_ANALYSIS_VIEW
/*
** Written: 26/02/04 SR
** Last Amended: 23/07/04 SR, 10/08/04 SR, 28/10/04 SR, 02/11/2004 SH, 01/12/2004 SH, 17/01/05 SRB, 13/12/05 NC, 19/12/05 NC
*/
as

select 
   SA_PRIMARY as [PRIMARY],
   (case D.DUPLICATE when 1 then '' else SACODE end) as SACODE,
   SANAME,
   SASORT,
   SAVATCODE,
   dbo.AA_VALUE_DPS_F(VAT_RATE) as VAT_RATE,
   SACURRENCYSYMBL,
   SYS_CURRENCY_REC.CURREC_DESCRIPTION,
   SANOMINALDR,
   NominalDebit.NNAME as SANOMINALDRNAME,
   SANOMINALCR,
   NominalCredit.NNAME as SANOMINALCRNAME,
   SANOMINALVAT,
   NominalTax.NNAME as SANOMINALVATNAME,
   (case SATYPE_S_B_D when 'S' then 0 when 'B' then 1 when 'D' then 2 when 'K' then 3 else 0 end) as SATYPE_S_B_D,
   (case D.DUPLICATE when 1 then 0 else case when (SATYPE_S_B_D = 'B' AND SADEFAULT_BANK = 1) then 1 when (SATYPE_S_B_D = 'S' AND SADEFAULT_SALES = 1) then 1 else 0 end end) as SADEFAULT,
   SA_LEVEL,
   (case D.DUPLICATE when 1 then NULL else SA_DATE_PUTIN end) as SA_DATE_PUTIN,
   (case D.DUPLICATE when 1 then NULL else SA_DATE_EDITED end) as SA_DATE_EDITED,
   SA_FORCE_COSTING,
   SA_ANALYSIS_MATRIX,
   (case D.DUPLICATE when 1 then '' else SANOTES end) as SANOTES,
   (case D.DUPLICATE when 1 then 0 else SATURNOVERPTD end) as SATURNOVERPTD,
   (case D.DUPLICATE when 1 then 0 else SATURNOVERYTD end) as SATURNOVERYTD,
   (case D.DUPLICATE when 1 then 0 else SATURNOVR_PTD_C end) as SATURNOVR_PTD_C,
   (case D.DUPLICATE when 1 then 0 else SATURNOVR_YTD_C end) as SATURNOVR_YTD_C,
   SA_USRCHAR1,
   SA_USRCHAR2,
   SA_USRCHAR3,
   SA_USRCHAR4,
   SA_USRCHAR5,
   SA_USRCHAR6,
   SA_USRCHAR7,
   SA_USRCHAR8,
   SA_USRDATE1,
   SA_USRDATE2,
   SA_USRDATE3,
   SA_USRFLAG1,
   SA_USRFLAG2,
   SA_USRFLAG3,
   SA_USRNUM1,
   SA_USRNUM2,
   SA_USRNUM3,
   (case D.DUPLICATE when 1 then NULL else SA_PRIMARY end) as SA_PRIMARY,
   (case D.DUPLICATE when 1 then 0 else SAUSED end) as SAUSED,
   SADEFAULT_ROUNDING,
   SAUSER1,
   SAUSER2,
   SAUSER3,
   (case D.DUPLICATE when 1 then NULL else SA_USER_PUTIN end) as SA_USER_PUTIN,
   (case D.DUPLICATE when 1 then NULL else SA_USER_EDITED end) as SA_USER_EDITED,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_ANALYSIS_EDITABLE_F( SACODE, 1 ) end) as ANALYSIS_CODE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_ANALYSIS_EDITABLE_F( SACODE, 2 ) end) as ANALYSIS_TYPE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_ANALYSIS_EDITABLE_F( SACODE, 3 ) end) as CURRENCY_EDITABLE,
   case when SalesExchange.CURREC_SALES_AN_EX is null then 0 else 1 end as EXCHANGE_DIFFERENCE,
   (case D.DUPLICATE when 1 then SA_PRIMARY else 0 end) as DUPLICATE_PRIMARY,
   (case D.DUPLICATE when 0 then SA_DO_NOT_USE else 0 end) as SA_EXCLUDED
from 
   SL_ANALYSIS
   left outer join SL_ANALYSIS2 on SL_ANALYSIS.SA_PRIMARY = SL_ANALYSIS2.SA_PRIMARY_2
   cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
   left outer join SYS_VATCONTROL on SL_ANALYSIS.SAVATCODE = SYS_VATCONTROL.VAT_CODE
   inner join SYS_CURRENCY_REC on SL_ANALYSIS.SACURRENCYSYMBL = SYS_CURRENCY_REC.CURREC_SYMBOL
   left outer join NL_ACCOUNTS NominalDebit on SL_ANALYSIS.SANOMINALDR = NominalDebit.NCODE
   left outer join NL_ACCOUNTS NominalCredit on SL_ANALYSIS.SANOMINALCR = NominalCredit.NCODE
   left outer join NL_ACCOUNTS NominalTax on SL_ANALYSIS.SANOMINALVAT = NominalTax.NCODE
   left outer join SYS_CURRENCY_REC SalesExchange on SL_ANALYSIS.SACODE = SalesExchange.CURREC_SALES_AN_EX