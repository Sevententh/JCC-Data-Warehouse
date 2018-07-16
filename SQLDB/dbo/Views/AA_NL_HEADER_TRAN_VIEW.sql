create view AA_NL_HEADER_TRAN_VIEW
/*
** Written: 30/03/04 SR
** Last Amended: 14/06/05 NC; 15/06/05 ROBB; 01/07/05 ROBB, 06/09/2005 SH, 20/09/2005 ROBB, 20/10/2005 ROBB, 13/09/2011 CC
*/
as

select 
   NL_GROSS_CONTRA.NNAME as CONTRANAME, 
   NL_VAT_CONTRA.NNAME as VATCONTRANAME,
   (case NT_IMPEXP_CODE 
      when 'O' then 2 
      when 'E' then 1 
         else 0 end) as NT_IMPEXP_CODE,
   NT_SUB_LEDGER,
   SUBL_DESCRIPTION,
   NT_GROSS_CONTRA,
   NT_VAT_CONTRA,
   NT_HEADER_REF,
   (case NT_EC_DEL_TERM
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
         else -1 end)  as NT_EC_DEL_TERM,
   (case 
      when isnull(NT_EC_T_NATURE,'') = '' then -1 
         else convert(int, NT_EC_T_NATURE) end) as NT_EC_T_NATURE,   -- 10=Change of Ownership,
                                                      -- 20=Returned/Replacement, 
                                                      -- 30=Free of Charge, 
                                                      -- 40=Processing/Repair, 
                                                      -- 50=Returned after Processing/Repair, 
                                                      -- 60=Temporary Usage, 
                                                      -- 70=Joint Projects, 
                                                      -- 80=Construction/Engineering, 
                                                      -- 90=Other 
   (case 
      when isnull(NT_EC_T_MODE,'') = '' then -1 
         else convert(int, NT_EC_T_MODE) end) as NT_EC_T_MODE,    -- 1=Sea, 
                                                      -- 2=Rail, 
                                                      -- 3=Road, 
                                                      -- 4=Air, 
                                                      -- 5=Post, 
                                                      -- 6=Not Allocated, 
                                                      -- 7=Fixed Installations, 
                                                      -- 8=Inland Waterway, 
                                                      -- 9=Own Propulsion
   NT_CURRENCYSYMB,
   NT_CURRENCYCODE,
   (case NT_CURR_TYPE
      when 'H' then 0
      when 'E' then 1
      when '2' then 2
      when 'D' then 3 end) as NT_CURR_TYPE,
   (case when NT_CURR_TYPE ='E' then NT_TRI_RATE1 else NT_CURRENCYRATE end) as NT_CURRENCYRATE,
   NT_TRI_RATE2,
   NT_DATE,
   NT_BATCH_REF,
   NT_FIRST_DATE,
   NT_NEXT_DATE,
   NT_POSTED_DATE,
   NT_MAX_POSTINGS,
   (case NT_YEAR 
      when 'C' then 0
      when 'N' then 1
      when 'L' then 2
      when 'O' then 3 end) as NT_YEAR,
   NT_PERIODNUMBER,
   NT_POSTINGS_CNT, -- Number of posted transactions
   NT_POSTINGS_PER, -- Posting frequency (number per week or month)
   NT_PERIOD_MAXC,  -- Posting frequency (Expected number of postings per period)
   (case when substring(NT_POSTINGS_FRQ,1,1)='M' then 1 else 0 end) as NOMINAL_RECURRING_POSTING_FREQUENCY_TYPE, -- weekly or monthly
   NT_REVERSE_FLAG,
   NT_DESCRIPTION, 
   NT_CONTRA_FLAG,
   NT_MULTI_CONTRA,
   NT_ARCHIVE_FLAG,
   NT_BATCH_FLAG,
   NT_RECUR_FLAG,
   NT_HEADER_KEY,
   NT_PRIMARY,
   NT_TRAN_OPTIONS,
   NT_SOURCE,
   NT_MU_STATUS,
   NT_USRCHAR1,
   NT_USRCHAR2,
   NT_USRCHAR3,
   NT_USRCHAR4,
   NT_USRFLAG1,
   NT_USRFLAG2,
   NT_USRDATE1,
   NT_USRDATE2,
   NT_USRNUM1,
   NT_USRNUM2,
   (case when substring(NT_TRAN_OPTIONS,3,1) is null then 0 else substring(NT_TRAN_OPTIONS,3,1) end) as GROSSENTRY,
   (case when substring(NT_TRAN_OPTIONS,3,1) is null then 0 else substring(NT_TRAN_OPTIONS,3,1) end) as CURRENCYENTRY,
   NT_PAYMENT_FLAG,
   NT_CHEQUE_PAYEE


from        
   NL_TRANSACTIONS
   left outer join NL_TRANSACTIONS2 on NL_TRANSACTIONS.NT_PRIMARY = NL_TRANSACTIONS2.NT_PRIMARY_2
   left outer join NL_ACCOUNTS as NL_GROSS_CONTRA on NL_TRANSACTIONS.NT_GROSS_CONTRA = NL_GROSS_CONTRA.NCODE  
   left outer join NL_ACCOUNTS as NL_VAT_CONTRA on NL_TRANSACTIONS.NT_VAT_CONTRA = NL_VAT_CONTRA.NCODE  
   left outer join SYS_SUB_LEDGERS on SYS_SUB_LEDGERS.SUBL_CODE = NT_SUB_LEDGER and SUBL_TYPE='N'