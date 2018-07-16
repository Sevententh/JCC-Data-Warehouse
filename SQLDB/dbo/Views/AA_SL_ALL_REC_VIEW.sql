create view AA_SL_ALL_REC_VIEW
/*
** View for prospect contact management module
**
** Written:      19/03/04 SA
** Last Amended: 19/03/04 NC,3/10/07chw, 12/1/09 NC
*/
as
select
case when CUPROSCODE <> '' then 'P' else 'C' end  as V_TYPE
, CU_ACC_CODE      as V_CODE
, CUNAME
, CUADDRESS
, CUPOSTCODE
, CUPHONE
, CUPHONE2
, CUFAX
, CUUSER2
, CUUSER3
, CU_ADDRESS_USER1
, CU_ADDRESS_USER2
, CU_DEALERCODE
, CU_PRIMARY
, CUSORT
, CUUSER1
, CUCONTACT
, CUCURRENCYCODE
, CU_COUNTRY_CODE
, CU_ON_STOP
, CU_CREDIT_LIMIT
, CUBALANCE
, convert(int,CU_DO_NOT_USE) as CU_DO_NOT_USE
      from SL_ACCOUNTS with (nolock)