create view AA_PL_TRANSACTION_THREESIXTY_ORDER_INV_VIEW
/*
** Returns order invoice line information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select
   PT_ORDER_NUMBER as ORDER_NUMBER,
   isnull(PT_HEADER_REF,'') as PT_HEADER_REF,
   PT_DATE,
   PT_GROSS,
   PT_CURR_VALU,
   PT_CURRENCYCODE
from PL_TRANSACTIONS
where PT_TRANTYPE = 'INV'