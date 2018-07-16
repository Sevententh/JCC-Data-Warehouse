create view AA_PL_TRANSACTION_THREESIXTY_HEADER_VIEW
/*
** Returns transaction header information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select P.PT_PRIMARY as [PRIMARY],
   P.PT_TRANTYPE,
   isnull(P.PT_HEADER_REF,'') as PT_HEADER_REF,
   P.PT_DATE,
   P.PT_GROSS,
   P.PT_CURR_VALU,
   P.PT_COPYSUPP,
   S.SUNAME,
   P.PT_CURRENCYCODE
from PL_TRANSACTIONS P
   inner join PL_ACCOUNTS S on S.SUCODE = P.PT_COPYSUPP