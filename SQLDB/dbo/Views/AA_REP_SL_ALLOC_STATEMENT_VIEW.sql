CREATE VIEW AA_REP_SL_ALLOC_STATEMENT_VIEW
AS
/*
** Sales Allocation Statement view to be used by AA_REP_SL_ALLOC_STATEMENT_SEARCH_S.
** Written     : 11/10/2005 SB
** Last Amended: 
**
*/
select   C.CUCODE 
         ,C.CUNAME 
         ,dbo.AA_FORMAT_ADDRESS_F(A.AD_ADDRESS, A.AD_POSTCODE, A.AD_ADDRESS_USER1, A.AD_ADDRESS_USER2, null, null, A.AD_COUNTRY,1) ADDRESS
         ,S.ST_TRANTYPE
         ,S.ST_HEADER_REF 
         ,S.ST_DESCRIPTION
         ,S.ST_DATE
         ,dbo.AA_VALUE_DPS_F(case ST_TRANTYPE when 'INV' then S_AL_VALUE_HOME*(-1) when 'ADR' then S_AL_VALUE_HOME*(-1) else 0 end) HOME_DEBIT
         ,dbo.AA_VALUE_DPS_F(case ST_TRANTYPE when 'PAY' then S_AL_VALUE_HOME when 'ACR' then S_AL_VALUE_HOME when 'CRN' then S_AL_VALUE_HOME else 0 end) HOME_CREDIT
         ,dbo.AA_VALUE_DPS_F(case ST_TRANTYPE when 'INV' then S.ST_UNALLOCATED when 'PAY' then S.ST_UNALLOCATED*(-1) when 'ACR' then S.ST_UNALLOCATED*(-1) when 'ADR' then S.ST_UNALLOCATED when 'CRN' then S.ST_UNALLOCATED*(-1) else 0 end) HOME_OS
         ,S.ST_CURRENCYCODE
         ,dbo.AA_VALUE_DPS_F(case ST_TRANTYPE when 'INV' then S_AL_VALUE_CURR*(-1) when 'ADR' then S_AL_VALUE_CURR*(-1) else 0 end) CURR_DEBIT
         ,dbo.AA_VALUE_DPS_F(case ST_TRANTYPE when 'PAY' then S_AL_VALUE_CURR when 'ACR' then S_AL_VALUE_CURR when 'CRN' then S_AL_VALUE_CURR else 0 end) CURR_CREDIT
         ,dbo.AA_VALUE_DPS_F(case ST_TRANTYPE when 'INV' then S.ST_CURR_UNAL when 'PAY' then S.ST_CURR_UNAL*(-1) when 'ACR' then S.ST_CURR_UNAL*(-1) when 'ADR' then S.ST_CURR_UNAL when 'CRN' then S.ST_CURR_UNAL*(-1) else 0 end) CURR_OS
         ,H.S_AL_REFERENCE

from SL_ALLOC_HISTORY H
         inner join SL_TRANSACTIONS    S  on S.ST_PRIMARY  = cast(substring(H.S_AL_HEADER_KEY,2, len(H.S_AL_HEADER_KEY)-1) as float)
         inner join SL_ACCOUNTS        C  on C.CUCODE      = S.ST_COPYCUST
         inner join SL_ADDRESSES       A  on A.AD_CON_CODE = cast(cast(C.CUCODE as char(10)) + cast(C.CU_STAT_ADD_CDE as varchar(6)) as varchar(16))
