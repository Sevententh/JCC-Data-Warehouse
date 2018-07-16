create view AA_SL_HEADER_TRAN_VIEW
/*
** Written: 29/03/04 SR;
** Last Amended: 06/10/04 ROBB; 15/10/2004 ROBB; 23/12/2004 ROBB; 15/03/2005 ROBB, 13/05/05 NC, 03/01/06 LM, 13/09/2011 CC
*/
as

select
   c.CUNAME,
   c.CU_ON_STOP,
   c.CU_MULTI_CURR,
   dbo.AA_PRICE_DPS_F(c.CU_CREDIT_LIMIT) as CU_CREDIT_LIMIT,
   dbo.AA_PRICE_DPS_F(c.CUBALANCE) as CUBALANCE,
   dbo.AA_PRICE_DPS_F(c.CUTURNOVERYTD) as CUTURNOVERYTD,
   c.CU_A_P_DAYS,
   c.CU_NOTES,
   c.CU_TERMS,
   c.CU_DUE_DAYS,
   c.CU_DUEDATE_TYPE,
   a.AD_ADDRESS,
   a.AD_ADDRESS_USER1,
   a.AD_ADDRESS_USER2,
   a.AD_POSTCODE,
   a.AD_COUNTRY,
   a.AD_E_MAIL,
   a.AD_PHONE,
   a.AD_FAX,
   a.AD_CONTACT,
   a.AD_ACCOUNTNAME,
   (case t.ST_TRANTYPE
      when 'INV' then 0
      when 'CRN' then 1
      when 'PAY' then 2
      when 'ADR' then 3
      when 'ACR' then 4 end)  as ST_TRANTYPE,
   t.ST_COPYCUST,
   t.ST_CURRENCYCODE,
   (case
      when t.ST_CURR_TYPE ='E' then t.ST_TRI_RATE1
         else  t.ST_CURRENCYRATE   end) as ST_CURRENCYRATE,
   (case t.ST_CURR_TYPE
      when 'H' then 0
      when 'E' then 1
      when '2' then 2
      when 'D' then 3 end) as ST_CURR_TYPE,
   t.ST_TRI_RATE2,
   (case t.ST_EXPORT_CODE
      when 'O' then 2
      when 'E' then 1
         else 0 end) as ST_EXPORT_CODE,
   case t.ST_EXPORT_CODE
      when 'E' then (case (case when t.ST_EC_DEL_TERMS<>'' then t.ST_EC_DEL_TERMS
                               when c.CU_EC_DELIVERY<>'' then c.CU_EC_DELIVERY
                               else co.CO_DEL_TERMS end)
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
                                             as ST_EC_DEL_TERMS,
   case t.ST_EXPORT_CODE
      when 'E' then convert(int, (case when t.ST_EC_T_NATURE<>'' and t.ST_EC_T_NATURE<>'0' then t.ST_EC_T_NATURE
                                       when c.CU_EC_T_NATURE<>'' and c.CU_EC_T_NATURE<>'0' then c.CU_EC_T_NATURE
                                       when co.CO_TRN_NATURE<>'' then co.CO_TRN_NATURE
                                       else 10 end))
      else -1 end
                                             as ST_EC_T_NATURE,   -- 10=Change of Ownership,
                                                                  -- 20=Returned/Replacement,
                                                                  -- 30=Free of Charge,
                                                                  -- 40=Processing/Repair,
                                                                  -- 50=Returned after Processing/Repair,
                                                                  -- 60=Temporary Usage,
                                                                  -- 70=Joint Projects,
                                                                  -- 80=Construction/Engineering,
                                                                  -- 90=Other
   case t.ST_EXPORT_CODE
      when 'E' then convert(int, (case when t.ST_EC_T_MODE<>'' and t.ST_EC_T_MODE<>'0' then t.ST_EC_T_MODE
                                       when c.CU_EC_T_MODE<>'' and c.CU_EC_T_MODE<>'0' then c.CU_EC_T_MODE
                                       when co.CO_TRNSPRT_MODE<>'' then co.CO_TRNSPRT_MODE
                                       else 1 end))
      else -1 end
                                             as ST_EC_T_MODE,     -- 1=Sea,
                                                                  -- 2=Rail,
                                                                  -- 3=Road,
                                                                  -- 4=Air,
                                                                  -- 5=Post,
                                                                  -- 6=Not Allocated,
                                                                  -- 7=Fixed Installations,
                                                                  -- 8=Inland Waterway,
                                                                  -- 9=Own Propulsion
   t.ST_SETT_DISC_1,
   t.ST_SETT_DAYS_1,
   t.ST_SETT_DISC_2,
   t.ST_SETT_DAYS_2,
   t.ST_HEADER_REF,
   t.ST_BATCH_REF,
   t.ST_DATE,
   (case t.ST_YEAR
      when 'C' then 0
      when 'N' then 1
      when 'L' then 2
      when 'O' then 3 end) as ST_YEAR,
   t.ST_PERIODNUMBER,
   t.ST_DUEDATE,
   t.ST_ANTICPAYDATE,
   t.ST_DESCRIPTION,
   t.ST_QUERY_FLAG,
   t.ST_ARCHIVE_FLAG,
   t.ST_HEADER_KEY,
   t.ST_BATCH_FLAG,
   t.ST_MU_STATUS,
   t.ST_SUB_LEDGER,
   l.SUBL_DESCRIPTION,
   t.ST_TRAN_OPTIONS,
   t.ST_PRIMARY,
   t2.STT_USRCHAR1,
   t2.ST_USRCHAR2,
   t2.ST_USRCHAR3,
   t2.ST_USRCHAR4,
   t2.ST_USRFLAG1,
   t2.ST_USRFLAG2,
   t2.ST_USRDATE1,
   t2.ST_USRDATE2,
   t2.ST_USRNUM1,
   t2.ST_USRNUM2,
   (case when substring(t.ST_TRAN_OPTIONS,3,1) is null then 0 else substring(t.ST_TRAN_OPTIONS,3,1) end) as GROSSENTRY,
   (case when substring(t.ST_TRAN_OPTIONS,3,1) is null then 0 else substring(t.ST_TRAN_OPTIONS,3,1) end) as CURRENCYENTRY,
   (case when substring(t.ST_TRAN_OPTIONS,6,1) is null then 0 else substring(t.ST_TRAN_OPTIONS,6,1) end) as DUERECEIPTDATEENTRY,
   c.CUAGED_1,
   c.CUAGED_2,
   c.CUAGED_3,
   c.CUAGED_4,
   c.CUAGED_UNALLOC,
   c.CUSORT,
   isnull(t.ST_USER1,'') as ST_USER1,
   isnull(t.ST_USER2,'') as ST_USER2,
   isnull(t.ST_USER3,'') as ST_USER3,
   isnull(n.ST_NOTE,'') as ST_NOTE
from
   SL_TRANSACTIONS t
   left outer join SL_TRANSACTIONS2 t2 with (nolock) on t.ST_PRIMARY = t2.ST_PRIMARY_2
   left outer join SL_ACCOUNTS c with (nolock) on t.ST_COPYCUST = c.CUCODE
   left outer join SL_ADDRESSES a with (nolock) on convert(char(10),c.CUCODE) + '1' = a.AD_CON_CODE
   left outer join SYS_SUB_LEDGERS l with (nolock) on l.SUBL_CODE = t.ST_SUB_LEDGER and l.SUBL_TYPE = 'S'
   left outer join SL_TRANSACTION_NOTES n with (nolock) on t.ST_HEADER_KEY = n.ST_COPY_HEADERKEY
   left outer join SYS_COUNTRY co with (nolock) on co.CO_CODE = c.CU_COUNTRY_CODE