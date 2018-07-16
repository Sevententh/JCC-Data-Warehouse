create view AA_CB_AUTOBANKREC_RUNNING_TOTAL_VIEW
/*
** Written     :  21/11/2006 Neal Wadeson
** Last Amended:  12/03/2009 SM
**
*/
(
   BankAccount
,  RunningTotal
)
as
select 
   ABRS_NL_ACCOUNT_LINK
,  sum(ABRST_VALUE)
   from 
      CB_AUTOBANKREC_STATEMENT_TRAN
         inner join CB_AUTOBANKREC_STATEMENT on ABRS_PRIMARY = ABRST_STATEMENT_LINK
   group by 
      ABRS_NL_ACCOUNT_LINK