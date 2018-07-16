create view AA_POP_OPTIONS_VIEW
/*
** Written:      03/11/05 SRB
** Last Amended: 03/11/05 NC
** Comments:     Returns Purchase Order Options.  This will in time have more items however this option
is currently needed for the Ledgers to hide the Allow Zero Budgets within the Nominal Ledger.
*/
as

select
   POP_AUTHORISATION
   from SYS_DATAINFO2
   where SYS_PRIMARY_2=1