create view AA_NL_OPTIONS_VIEW
/*
** Written:      30/01/04
** Last Amended: 08/10/04 ROBB; 12/10/2004 ROBB; 17/03/2005 SRB, 13/05/2005 SH, 8/12/05 LM
** Comments:     Returns Nominal Options
*/
as

select

--Nominal Code Configuration
SYS_NL_MIN_LENGTH
,NL_FIX_LENGTH
,SYS_NL_NUMERIC_ONLY

,coalesce(NL_AUTO_ANALYSIS_CREATION,0) as NL_AUTO_ANALYSIS_CREATION

--Auto Transaction Ref
,AUTO_NUMBR_JNL
,NEXT_JNL_NUMBR


--Default Codes
--Sales
,NOM_SALES
,nomSales.NNAME AS NOM_SALES_NAME
--Sales Discount
,NOM_SALES_DISC
,nomSalesDisc.NNAME as  NOM_SALESDISC_NAME
--Purchase
,NOM_PURCHASE
,nomPurchase.NNAME as NOM_PURCHASE_NAME
--Purchase Discount
,NOM_PURCH_DISC
,nomPurchaseDisc.NNAME as NOM_PURCH_DISC_NAME
--Exchange Difference
,NOM_EXDIFF
,nomExchangeDiff.NNAME as NOM_EXDIFF_NAME
--Sales Control
,NOM_SALES_CNTRL
,nomSalesControl.NNAME as NOM_SALES_CNTRL_NAME
--Purchase Control
,NOM_PURCH_CNTRL
,nomPurchaseControl.NNAME as NOM_PURCH_CNTRL_NAME
--Tax Control
,NOM_VAT_CNTRL
,nomTaxControl.NNAME as NOM_VAT_CNTRL_NAME
--Year End Update
,NOM_YEAR_UPDATE
,nomYearUpdate.NNAME as NOM_YEAR_UPDATE_NAME
--Suspense
,NOM_SUSPENSE
,nomSuspense.NNAME as NOM_SUSPENSE_NAME
--Rounding Differences
,NOM_RND_DIF_BASE1
,nomRoundingDiff.NNAME as NOM_RND_DIF_BASE1_NAME

--Main Bank
,NOM_MAIN_BANK
,nomMainBank.NNAME as NOM_MAIN_BANK_NAME

--Allow Control Accounts to be Any Currency
,SYS_ANYCURR_CONTROL

-- Display Style for Categories
,NL_CATEGORY_DISPLAY_STYLE

from
SYS_DATAINFO
join SYS_DATAINFO2 on sys_primary_2 = 1
left join SYS_DATAINFO3 on sys_primary_3 = 1

--Joins for the Nominal Default Names
inner join nl_accounts nomSales on nomSales.ncode = NOM_SALES
inner join nl_accounts nomSalesDisc on nomSalesDisc.ncode = NOM_SALES_DISC
inner join nl_accounts nomPurchase on nomPurchase.ncode = NOM_PURCHASE
inner join nl_accounts nomPurchaseDisc on nomPurchaseDisc.ncode = NOM_PURCH_DISC
inner join nl_accounts nomExchangeDiff on nomExchangeDiff.ncode = NOM_EXDIFF
inner join nl_accounts nomSalesControl on nomSalesControl.ncode = NOM_SALES_CNTRL
inner join nl_accounts nomPurchaseControl on nomPurchaseControl.ncode = NOM_PURCH_CNTRL
inner join nl_accounts nomTaxControl on nomTaxControl.ncode = NOM_VAT_CNTRL
inner join nl_accounts nomYearUpdate on nomYearUpdate.ncode = NOM_YEAR_UPDATE
inner join nl_accounts nomSuspense on nomSuspense.ncode = NOM_SUSPENSE
inner join nl_accounts nomRoundingDiff on nomRoundingDiff.ncode = NOM_RND_DIF_BASE1

--Joins for the Nominal Bank Default Names
inner join nl_accounts nomMainBank on nomMainBank.ncode = NOM_MAIN_BANK
left outer join nl_accounts nomFinanceDiscC on nomFinanceDiscC.ncode = NOM_FINDISC_C
left outer join nl_accounts nomFinanceDiscI on nomFinanceDiscI.ncode = NOM_FINDISC_I
left outer join nl_accounts nomPayDiffC on nomPayDiffC.ncode = NOM_PAYDIFF_C
left outer join nl_accounts nomPayDiffI on nomPayDiffI.ncode = NOM_PAYDIFF_I
left outer join nl_accounts nomBankCost on nomBankCost.ncode = NOM_BANKCOST
left outer join nl_accounts nomDifference on nomDifference.ncode = NOM_DIFFERENCE

