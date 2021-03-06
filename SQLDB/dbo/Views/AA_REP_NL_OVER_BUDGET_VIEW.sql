﻿CREATE VIEW AA_REP_NL_OVER_BUDGET_VIEW
/*
** Written:     08/12/2005 RV
** Last Amended: 21/04/2006 SB
** Comments: returns turnover and budget revisions for over budget crystal reports
*/
as
select

   NL_MAJORHEADING.NL_MAJORCODE                 as NMAJORHEADCODE
,  NL_MAJORHEADING.NL_MAJORNAME
,  NL_ACCOUNTS.NCODE
,  NL_ACCOUNTS.NNAME
,  NL_ACCOUNTS.NCURRENCYCODE
,  NL_ACCOUNTS.NOPENBALYEAR
,  NL_ACCOUNTS.NTURNOVERLY
,  NL_ACCOUNTS.NCATEGORYCODE1
,  NL_ACCOUNTS.NCATEGORYCODE2
,  NL_ACCOUNTS.NCATEGORYCODE3
,  NL_ACCOUNTS.NCATEGORYCODE4
,  NL_ACCOUNTS.NCATEGORYCODE5
,  NL_ACCOUNTS.NCATEGORYCODE6
,  NL_ACCOUNTS.NCATEGORYCODE7
,  NL_ACCOUNTS.NCATEGORYCODE8
,  NL_ACCOUNTS.NOPENBALANCELY
,  NL_ACCOUNTS.NTURNOVER_C1
   +
   NL_ACCOUNTS.NTURNOVER_C2
   +
   NL_ACCOUNTS.NTURNOVER_C3
   +
   NL_ACCOUNTS.NTURNOVER_C4
   +
   NL_ACCOUNTS.NTURNOVER_C5
   +
   NL_ACCOUNTS.NTURNOVER_C6
   +
   NL_ACCOUNTS.NTURNOVER_C7
   +
   NL_ACCOUNTS.NTURNOVER_C8
   +
   NL_ACCOUNTS.NTURNOVER_C9
   +
   NL_ACCOUNTS.NTURNOVER_C10
   +
   NL_ACCOUNTS.NTURNOVER_C11
   +
   NL_ACCOUNTS.NTURNOVER_C12
   +
   NL_ACCOUNTS.NTURNOVER_C13                    as NTURNOVER_CURYR


from NL_MAJORHEADING

Left outer join NL_ACCOUNTS
   on NL_ACCOUNTS.NMAJORHEADCODE = NL_MAJORHEADING.NL_MAJORCODE and N_EXCLUDE_RECREP <> 1
