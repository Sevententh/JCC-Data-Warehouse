create view AA_SL_ALLOCATION_CORRECTION_DET_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SL_ALLOCATION_CORRECTION_DETAIL_LIST_S
**
** Written     :  19/01/2005 SH
** Last Amended:  16/09/2005 DB
**
*/
as
select ST_PRIMARY as [PRIMARY],
   cast( H.S_AL_REFERENCE as int ) as ALLOC_PRIMARY,
   S.ST_COPYCUST,
   S.ST_DATE,
   S.ST_YEAR +  cast( S.ST_PERIODNUMBER as varchar( 2 ) ) as ST_PERIOD,
   S.ST_TRANTYPE,
   isnull( S.ST_HEADER_REF, '' ) as ST_HEADER_REF,
   isnull( S.ST_DESCRIPTION, '' ) as ST_DESCRIPTION,
   S.ST_GROSS,
   S.ST_CURRENCYCODE,
   isnull( S.ST_CURR_VALU, 0 ) as ST_CURR_VALU,
   case when S.ST_TRANTYPE in ( 'INV', 'ADR' ) then S.ST_GROSS - S.ST_UNALLOCATED
         else 0
   end as ST_ALLOCATED_DR,

   case when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_GROSS - S.ST_UNALLOCATED
         else 0
   end as ST_ALLOCATED_CR,

   case when S.ST_CURR_VALU <> S.ST_CURR_UNAL and S.ST_TRANTYPE in ( 'INV', 'ADR' ) then S.ST_CURR_VALU - S.ST_CURR_UNAL
      else 0
   end as ST_CURR_ALLOCATED_DR,

   case when S.ST_CURR_VALU <> S.ST_CURR_UNAL and S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_CURR_VALU - S.ST_CURR_UNAL
         else 0
   end as ST_CURR_ALLOCATED_CR,
   isnull( S2.STT_USRCHAR1, '' ) as STT_USRCHAR1,
   isnull( S2.ST_USRCHAR2, '' ) as ST_USRCHAR2,
   isnull( S2.ST_USRCHAR3, '' ) as ST_USRCHAR3,
   isnull( S2.ST_USRCHAR4, '' ) as ST_USRCHAR4,
   isnull( S2.ST_USRNUM1, 0 ) as ST_USRNUM1,
   isnull( S2.ST_USRNUM2, 0 ) as ST_USRNUM2,
   S2.ST_USRDATE1,
   S2.ST_USRDATE2,
   isnull( S2.ST_USRFLAG1, 0 ) as ST_USRFLAG1,
   isnull( S2.ST_USRFLAG2, 0 ) as ST_USRFLAG2,
   isnull( S.ST_SUB_LEDGER, '' ) as ST_SUB_LEDGER,
   isnull( S.ST_USER1, '' ) as ST_USER1,
   isnull( S.ST_USER2, '' ) as ST_USER2,
   isnull( S.ST_USER3, '' ) as ST_USER3

   from SL_TRANSACTIONS S
      left join SL_TRANSACTIONS2 S2 on S2.ST_PRIMARY_2 = S.ST_PRIMARY
      inner join SL_ALLOC_HISTORY H on H.S_AL_HEADER_KEY = S.ST_HEADER_KEY and cast( H.S_AL_REFERENCE as int ) = (
               select max( cast( S_AL_REFERENCE as int ) ) -- Convert to int to simplify sorting
                  from SL_ALLOC_HISTORY
                  where S_AL_HEADER_KEY = S.ST_HEADER_KEY
      )

   where S.ST_BATCH_FLAG <> 1 and (S.ST_UNALLOCATED <> S.ST_GROSS or S.ST_CURR_UNAL <> S.ST_CURR_VALU) and
      isnull( nullif( H.S_AL_REFERENCE, '' ), '0' ) <> '0'