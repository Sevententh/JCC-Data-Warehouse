create view AA_PL_TRANSACTION_THREESIXTY_ALLOCATION_VIEW
/*
** Returns transaction allocation information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select
   isnull(P.PT_HEADER_REF,'') as PT_HEADER_REF,
   H.P_AL_HEADER_KEY,
   P.PT_TRANTYPE,
   H.P_AL_DATE,
   H.P_AL_VALUE_HOME,
   H.P_AL_VALUE_CURR,
   P.PT_CURRENCYCODE,
   H.P_AL_REFERENCE,
   H.P_AL_ACCOUNT_CODE,
   H.P_AL_PRIMARY -- Required for ordering data.
from PL_ALLOC_HISTORY H
   inner join PL_TRANSACTIONS P on P.PT_HEADER_KEY = H.P_AL_HEADER_KEY
where H.P_AL_REFERENCE <> '0'