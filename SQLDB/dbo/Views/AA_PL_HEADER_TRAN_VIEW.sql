create view AA_PL_HEADER_TRAN_VIEW
/*
** Written: 30/03/04 SR
** Last Amended: 25/04/05 SR, 10/05/05 SR, 17/05/05 NC, 03/01/06 LM, 29/01/07 NC, 13/09/2011 CC
*/
as

select
   isnull(SUNAME,'') as SUNAME,
   SU_ON_STOP,
   SU_MULTI_CURR,
   dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) as SU_CREDIT_LIMIT,
   dbo.AA_VALUE_DPS_F(SUBALANCE) as SUBALANCE,
   dbo.AA_VALUE_DPS_F(SUTURNOVERYTD) as SUTURNOVERYTD,
   SU_A_P_DAYS,
   isnull(SU_VAT_REG_NO,'') as SU_VAT_REG_NO,
   isnull(SYS_COUNTRY.CO_NAME,'') as SU_VAT_COUNTRY,
   isnull(SU_NOTES,'') as SU_NOTES,
   isnull(SU_TERMS,'') as SU_TERMS,
   SU_DUE_DAYS,
   SU_DUEDATE_TYPE,
   isnull(PL_AD_ADDRESS,'') as PL_AD_ADDRESS,
   isnull(PL_AD_ADDRESS_USER1,'') as PL_AD_ADDRESS_USER1,
   isnull(PL_AD_ADDRESS_USER2,'') as PL_AD_ADDRESS_USER2,
   isnull(PL_AD_POSTCODE,'') as PL_AD_POSTCODE,
   isnull(PL_AD_COUNTRY,'') as PL_AD_COUNTRY,
   isnull(PL_AD_EMAIL,'') as PL_AD_EMAIL,
   isnull(PL_AD_PHONE,'') as PL_AD_PHONE,
   isnull(PL_AD_FAX,'') as PL_AD_FAX,
   isnull(PL_AD_CONTACT,'') as PL_AD_CONTACT,
   (case PT_TRANTYPE
      when 'INV' then 0
      when 'CRN' then 1
      when 'PAY' then 2
      when 'ADR' then 3
      when 'ACR' then 4 end) as PT_TRANTYPE,
   PT_COPYSUPP,
   PT_CURRENCYCODE,
   (case when PT_CURR_TYPE ='E' then PT_TRI_RATE1 else PT_CURRENCYRATE end) as PT_CURRENCYRATE,
   (case PT_CURR_TYPE
      when 'H' then 0
      when 'E' then 1
      when '2' then 2
      when 'D' then 3 end) as PT_CURR_TYPE,
   PT_TRI_RATE2,
   (case PT_IMPORT_CODE
      when 'O' then 2
      when 'E' then 1
         else 0 end) as PT_IMPORT_CODE,
   case PT_IMPORT_CODE
      when 'E' then (case (case when PT_EC_DEL_TERMS<>'' then PT_EC_DEL_TERMS
                               when SU_EC_DELIVERY<>'' then SU_EC_DELIVERY
                               else CO_DEL_TERMS end)
                           when 'EXW' then 1
                           when 'FOB' then 2
                           when 'CIF' then 3
                           when 'CFR' then 4
                           when 'CIP' then 5
                           when 'CPT' then 6
                           when 'DDU' then 7
                           when 'DAF' then 8
                           when 'DDP' then 9
                           when 'DEQ' then 10
                           when 'DES' then 11
                           when 'FAS' then 12
                           when 'FCA' then 13
                           when 'XXX' then 14
                           else 1
                     end)
      else -1 end
                                             as PT_EC_DEL_TERMS,
   case PT_IMPORT_CODE
      when 'E' then convert(int, (case when PT_EC_T_NATURE<>'' and PT_EC_T_NATURE<>'0' then PT_EC_T_NATURE
                                       when SU_EC_T_NATURE<>'' and SU_EC_T_NATURE<>'0' then SU_EC_T_NATURE
                                       when CO_TRN_NATURE<>'' then CO_TRN_NATURE
                                       else 10 end))
      else -1 end
                                             as PT_EC_T_NATURE,   -- 10=Change of Ownership,
                                                                  -- 20=Returned/Replacement,
                                                                  -- 30=Free of Charge,
                                                                  -- 40=Processing/Repair,
                                                                  -- 50=Returned after Processing/Repair,
                                                                  -- 60=Temporary Usage,
                                                                  -- 70=Joint Projects,
                                                                  -- 80=Construction/Engineering,
                                                                  -- 90=Other
   case PT_IMPORT_CODE
      when 'E' then convert(int, (case when PT_EC_T_MODE<>'' and PT_EC_T_MODE<>'0' then PT_EC_T_MODE
                                       when SU_EC_T_MODE<>'' and SU_EC_T_MODE<>'0' then SU_EC_T_MODE
                                       when CO_TRNSPRT_MODE<>'' then CO_TRNSPRT_MODE
                                       else 1 end))
      else -1 end
                                             as PT_EC_T_MODE,     -- 1=Sea,
                                                                  -- 2=Rail,
                                                                  -- 3=Road,
                                                                  -- 4=Air,
                                                                  -- 5=Post,
                                                                  -- 6=Not Allocated,
                                                                  -- 7=Fixed Installations,
                                                                  -- 8=Inland Waterway,
                                                                  -- 9=Own Propulsion
   PT_SETT_DISC1,
   PT_SETT_DAYS1,
   PT_SETT_DISC2,
   PT_SETT_DAYS2,
   PT_HEADER_REF,
   PT_BATCH_REF,
   PT_DATE,
   (case PT_YEAR
      when 'C' then 0
      when 'N' then 1
      when 'L' then 2
      when 'O' then 3 end) as PT_YEAR,
   PT_PERIODNUMBER,
   PT_DUEDATE,
   PT_ANTICPAYDATE,
   PT_DESCRIPTION,
   PT_QUERY_FLAG,
   PT_ARCHIVE_FLAG,
   PT_HEADER_KEY,
   PT_BATCH_FLAG,
   PT_MU_STATUS,
   PT_SUB_LEDGER,
   SUBL_DESCRIPTION,
   PT_INTERNAL_REF,
   PT_PRIMARY,
   PT_TRAN_OPTIONS,
   PT_USRCHAR1,
   PT_USRCHAR2,
   PT_USRCHAR3,
   PT_USRCHAR4,
   PT_USRFLAG1,
   PT_USRFLAG2,
   PT_USRDATE1,
   PT_USRDATE2,
   PT_USRNUM1,
   PT_USRNUM2,
   (case when substring(PT_TRAN_OPTIONS,3,1) is null then 0 else substring(PT_TRAN_OPTIONS,3,1) end) as GROSSENTRY,
   (case when substring(PT_TRAN_OPTIONS,3,1) is null then 0 else substring(PT_TRAN_OPTIONS,3,1) end) as CURRENCYENTRY,
   (case when substring(PT_TRAN_OPTIONS,6,1) is null then 0 else substring(PT_TRAN_OPTIONS,6,1) end) as DUERECEIPTDATEENTRY,
   SUAGED_1,
   SUAGED_2,
   SUAGED_3,
   SUAGED_4,
   SUAGED_UNALLOC,
   SUSORT,
   isnull(PT_USER1,'') as PT_USER1,
   isnull(PT_USER2,'') as PT_USER2,
   isnull(PT_USER3,'') as PT_USER3,
   isnull(PT_NOTE,'') as PT_NOTE
from
   PL_TRANSACTIONS
   left outer join PL_TRANSACTIONS2 with (nolock) on PL_TRANSACTIONS.PT_PRIMARY = PL_TRANSACTIONS2.PT_PRIMARY_2
   left outer join PL_ACCOUNTS with (nolock) on PL_TRANSACTIONS.PT_COPYSUPP = PL_ACCOUNTS.SUCODE
   left outer join PL_ADDRESSES with (nolock) on convert(char(10),PL_ACCOUNTS.SUCODE) + '1' = PL_ADDRESSES.PL_AD_CON_CODE
   left outer join SYS_SUB_LEDGERS with (nolock) on SYS_SUB_LEDGERS.SUBL_CODE = PT_SUB_LEDGER and SUBL_TYPE = 'P'
   left outer join SYS_COUNTRY with (nolock) on SYS_COUNTRY.CO_CODE = PL_ACCOUNTS.SU_COUNTRY_CODE
   left outer join PL_TRANSACTION_NOTES with (nolock) on PT_HEADER_KEY = PT_COPY_HEADERKEY