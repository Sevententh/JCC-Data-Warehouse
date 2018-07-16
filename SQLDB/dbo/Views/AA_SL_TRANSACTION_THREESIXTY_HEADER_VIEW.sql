create view AA_SL_TRANSACTION_THREESIXTY_HEADER_VIEW
/*
** Returns transaction header information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select S.ST_PRIMARY as [PRIMARY],
   S.ST_TRANTYPE,
   isnull(S.ST_HEADER_REF,'') as ST_HEADER_REF,
   S.ST_DATE,
   S.ST_GROSS,
   S.ST_CURR_VALU,
   S.ST_COPYCUST,
   C.CUNAME,
   S.ST_CURRENCYCODE
from SL_TRANSACTIONS S
   inner join SL_ACCOUNTS C on C.CUCODE = S.ST_COPYCUST