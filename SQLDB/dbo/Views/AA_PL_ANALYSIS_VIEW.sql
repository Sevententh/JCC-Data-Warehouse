create view AA_PL_ANALYSIS_VIEW
/*
** Written: 27/02/04 SR
** Last Amended: 23/07/04 SR, 10/08/04 SR, 28/10/04 SR, 01/11/04 SH, 01/12/2004 SH, 17/01/05 SRB, 13/12/05 NC, 19/12/05 NC
*/
as

select
   PA_PRIMARY as [PRIMARY],
   (case D.DUPLICATE when 1 then '' else PACODE end) as PACODE,
   PANAME,
   PASORT,
   PAVATCODE,
   dbo.AA_TWO_DPS_F(VAT_RATE) as VAT_RATE,
   PACURRENCYSYMBL,
   SYS_CURRENCY_REC.CURREC_DESCRIPTION,
   PANOMINALDR,
   NominalDebit.NNAME as PANOMINALDRNAME,
   PANOMINALCR,
   NominalCredit.NNAME as PANOMINALCRNAME,
   PANOMINALVAT,
   NominalTax.NNAME as PANOMINALVATNAME,
   (case PATYPE_P_B_D when 'P' then 0 when 'B' then 1 when 'D' then 2 when 'K' then 3 else 0 end) as PATYPE_P_B_D,
   (case D.DUPLICATE when 1 then 0 else case when (PATYPE_P_B_D = 'B' AND PADEFAULT_BANK = 1) then 1 when (PATYPE_P_B_D = 'P' AND PADEFAULT_PURCH = 1) then 1 else 0 end end) as PADEFAULT,
   PA_LEVEL,
   (case D.DUPLICATE when 1 then NULL else PA_DATE_PUTIN end) as PA_DATE_PUTIN,
   (case D.DUPLICATE when 1 then NULL else PA_DATE_EDITED end) as PA_DATE_EDITED,
   PALANDEDCOST,
   PA_FORCE_COSTING,
   PA_ANALYSIS_MATRIX,
   (case D.DUPLICATE when 1 then '' else PANOTES end) as PANOTES,
   (case D.DUPLICATE when 1 then 0 else PATURNOVERPTD end) as PATURNOVERPTD,
   (case D.DUPLICATE when 1 then 0 else PATURNOVERYTD end) as PATURNOVERYTD,
   (case D.DUPLICATE when 1 then 0 else PATURNOVR_PTD_C end) as PATURNOVR_PTD_C,
   (case D.DUPLICATE when 1 then 0 else PATURNOVR_YTD_C end) as PATURNOVR_YTD_C,
   PA_USRCHAR1,
   PA_USRCHAR2,
   PA_USRCHAR3,
   PA_USRCHAR4,
   PA_USRCHAR5,
   PA_USRCHAR6,
   PA_USRCHAR7,
   PA_USRCHAR8,
   PA_USRDATE1,
   PA_USRDATE2,
   PA_USRDATE3,
   PA_USRFLAG1,
   PA_USRFLAG2,
   PA_USRFLAG3,
   PA_USRNUM1,
   PA_USRNUM2,
   PA_USRNUM3,
   (case D.DUPLICATE when 1 then NULL else PA_PRIMARY end) as PA_PRIMARY,
   (case D.DUPLICATE when 1 then 0 else PAUSED end) as PAUSED,
   PADEFAULT_ROUNDING,
   PAUSER1,
   PAUSER2,
   PAUSER3,
   (case D.DUPLICATE when 1 then NULL else PA_USER_PUTIN end) as PA_USER_PUTIN,
   (case D.DUPLICATE when 1 then NULL else PA_USER_EDITED end) as PA_USER_EDITED,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_ANALYSIS_EDITABLE_F( PACODE, 1 ) end) as ANALYSIS_CODE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_ANALYSIS_EDITABLE_F( PACODE, 2 ) end) as ANALYSIS_TYPE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_ANALYSIS_EDITABLE_F( PACODE, 3 ) end) as CURRENCY_EDITABLE,
   case when PurchaseExchange.CURREC_PURCH_AN_EX is null then 0 else 1 end as EXCHANGE_DIFFERENCE,
   (case D.DUPLICATE when 1 then PA_PRIMARY else 0 end) as DUPLICATE_PRIMARY,
   (case D.DUPLICATE when 0 then PA_DO_NOT_USE else 0 end) as PA_EXCLUDED
from
   PL_ANALYSIS
   left outer join PL_ANALYSIS2 on PL_ANALYSIS.PA_PRIMARY = PL_ANALYSIS2.PA_PRIMARY_2
   cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
   left outer join SYS_VATCONTROL on PL_ANALYSIS.PAVATCODE = SYS_VATCONTROL.VAT_CODE
   inner join SYS_CURRENCY_REC   on PL_ANALYSIS.PACURRENCYSYMBL = SYS_CURRENCY_REC.CURREC_SYMBOL
   left outer join NL_ACCOUNTS NominalDebit on PL_ANALYSIS.PANOMINALDR = NominalDebit.NCODE
   left outer join NL_ACCOUNTS NominalCredit on PL_ANALYSIS.PANOMINALCR = NominalCredit.NCODE
   left outer join NL_ACCOUNTS NominalTax on PL_ANALYSIS.PANOMINALVAT = NominalTax.NCODE
   left outer join SYS_CURRENCY_REC PurchaseExchange on PL_ANALYSIS.PACODE = PurchaseExchange.CURREC_PURCH_AN_EX