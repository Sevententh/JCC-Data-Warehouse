create view AA_SL_TRANSACTION_THREESIXTY_ALLOCATION_VIEW
/*
** Returns transaction allocation information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select
   isnull(S.ST_HEADER_REF,'') as ST_HEADER_REF,
   H.S_AL_HEADER_KEY,
   S.ST_TRANTYPE,
   H.S_AL_DATE,
   H.S_AL_VALUE_HOME,
   H.S_AL_VALUE_CURR,
   S.ST_CURRENCYCODE,
   H.S_AL_REFERENCE,
   H.S_AL_ACCOUNT_CODE,
   H.S_AL_PRIMARY -- Required for ordering data.
from SL_ALLOC_HISTORY H
   inner join SL_TRANSACTIONS S on S.ST_HEADER_KEY = H.S_AL_HEADER_KEY
where H.S_AL_REFERENCE <> '0'