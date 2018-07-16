create view AA_SL_TRANSACTION_THREESIXTY_ORDER_INV_VIEW
/*
** Returns order invoice line information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select
   ST_ORDER_NUMBER as ORDER_NUMBER,
   isnull(ST_HEADER_REF,'') as ST_HEADER_REF,
   ST_DATE,
   ST_GROSS,
   ST_CURR_VALU,
   ST_CURRENCYCODE
from SL_TRANSACTIONS
where ST_TRANTYPE = 'INV'