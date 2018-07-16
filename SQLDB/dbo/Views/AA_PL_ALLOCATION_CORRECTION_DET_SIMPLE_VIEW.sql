create view AA_PL_ALLOCATION_CORRECTION_DET_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_PL_ALLOCATION_CORRECTION_DETAIL_LIST_S
**
** Written     :  03/03/2005 SH
** Last Amended:  23/03/2005 SH, 16/09/2005 DB
**
*/
as

select PT_PRIMARY as [PRIMARY],
   cast( H.P_AL_REFERENCE as int ) as ALLOC_PRIMARY,
   P.PT_COPYSUPP,
   P.PT_DATE,
   P.PT_YEAR +  cast( P.PT_PERIODNUMBER as varchar( 2 ) ) as PT_PERIOD,
   P.PT_TRANTYPE,
   isnull( P.PT_HEADER_REF, '' ) as PT_HEADER_REF,
   isnull( P.PT_DESCRIPTION, '' ) as PT_DESCRIPTION,
   P.PT_GROSS,
   P.PT_CURRENCYCODE,
   isnull( P.PT_CURR_VALU, 0 ) as PT_CURR_VALU,
   case when P.PT_TRANTYPE in ( 'PAY', 'CRN', 'ADR' ) then P.PT_GROSS - P.PT_UNALLOCATED
         else 0
   end as PT_ALLOCATED_DR,

   case when P.PT_TRANTYPE in ( 'INV', 'ACR' ) then P.PT_GROSS - P.PT_UNALLOCATED
         else 0
   end as PT_ALLOCATED_CR,

   case when P.PT_CURR_VALU <> P.PT_CURR_UNAL and P.PT_TRANTYPE in ( 'PAY', 'CRN', 'ADR' ) then P.PT_CURR_VALU - P.PT_CURR_UNAL
      else 0
   end as PT_CURR_ALLOCATED_DR,

   case when P.PT_CURR_VALU <> P.PT_CURR_UNAL and P.PT_TRANTYPE in ( 'INV', 'ACR' ) then P.PT_CURR_VALU - P.PT_CURR_UNAL
      else 0
   end as PT_CURR_ALLOCATED_CR,
   isnull( P2.PT_USRCHAR1, '' ) as PT_USRCHAR1,
   isnull( P2.PT_USRCHAR2, '' ) as PT_USRCHAR2,
   isnull( P2.PT_USRCHAR3, '' ) as PT_USRCHAR3,
   isnull( P2.PT_USRCHAR4, '' ) as PT_USRCHAR4,
   isnull( P2.PT_USRNUM1, 0 ) as PT_USRNUM1,
   isnull( P2.PT_USRNUM2, 0 ) as PT_USRNUM2,
   P2.PT_USRDATE1,
   P2.PT_USRDATE2,
   isnull( P2.PT_USRFLAG1, 0 ) as PT_USRFLAG1,
   isnull( P2.PT_USRFLAG2, 0 ) as PT_USRFLAG2,
   isnull( P.PT_SUB_LEDGER, '' ) as PT_SUB_LEDGER,
   isnull( P.PT_USER1, '' ) as PT_USER1,
   isnull( P.PT_USER2, '' ) as PT_USER2,
   isnull( P.PT_USER3, '' ) as PT_USER3,
   P.PT_INTERNAL_REF

   from PL_TRANSACTIONS P
      left join PL_TRANSACTIONS2 P2 on P2.PT_PRIMARY_2 = P.PT_PRIMARY
      inner join PL_ALLOC_HISTORY H on H.P_AL_HEADER_KEY = P.PT_HEADER_KEY and cast( H.P_AL_REFERENCE as int ) = (
               select max( cast( P_AL_REFERENCE as int ) ) -- Convert to int to simplify sorting
                  from PL_ALLOC_HISTORY
                  where P_AL_HEADER_KEY = P.PT_HEADER_KEY
      )

   where P.PT_BATCH_FLAG <> 1 and (P.PT_UNALLOCATED <> P.PT_GROSS or P.PT_CURR_UNAL <> P.PT_CURR_VALU) and
      isnull( nullif( H.P_AL_REFERENCE, '' ), '0' ) <> '0'