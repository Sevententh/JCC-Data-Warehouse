create view AA_PL_ACCOUNT_VIEW
/*
** Written: 25/02/04 SR
** Last Amended: 16/06/04 NC; 23/07/04 DG, 10/08/04 NC; 10/08/04 SRB, 01/11/2004 SH, 01/12/2004, 11/12/2004 SH, 05/08/2005 SH, 13/12/05 NC, 19/12/05 NC, 07/04/06 SH
*/
as

select
   SU_PRIMARY as [PRIMARY],
   (case D.DUPLICATE when 1 then '' else SUCODE end) as SUCODE,
   SUNAME,
   SUADDRESS,
   SU_ADDRESS_USER1,
   SU_ADDRESS_USER2,
   SUPOSTCODE,
   SUPHONE,
   SUFAX,
   SU_MOBILE_NUMBER,
   SU_EMAIL,
   SU_WEBSITE_ADDRESS,
   SUCURRENCYCODE,
   SYS_CURRENCY.CURR_SYMBOL as CURRENCY_SYMBOL,
   SU_MULTI_CURR,
   (case SU_IMPORT_CODE when 'O' then 2 when 'E' then 1 else 0 end) as SU_IMPORT_CODE,
   SU_ANALYSIS,
   PURCHASE_ANALSYIS.PANAME as PURCHASE_ANALYSIS_NAME,
   PURCHASE_ANALSYIS.PACURRENCYSYMBL as PURCHASE_ANALYSIS_CURRENCY,
   SU_TAX_CODE,
   VAT_RATE as TAX_RATE,
   SU_BANK_ANALYS,
   BANK_ANALYSIS.PANAME as BANK_ANALYSIS_NAME,
   BANK_ANALYSIS.PACURRENCYSYMBL as BANK_ANALYSIS_CURRENCY,
   (case D.DUPLICATE when 1 then '' else SU_VAT_REG_NO end) as SU_VAT_REG_NO,
   SU_COUNTRY_CODE,
   CO_NAME,
   (case SU_EC_DELIVERY
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
          else -1 end)    as SU_EC_DELIVERY,
   case when isnull(SU_EC_T_NATURE,'') = '' then -1 else convert(int,SU_EC_T_NATURE) end SU_EC_T_NATURE,
   case when isnull(SU_EC_T_MODE,'') = '' then -1 else convert(int,SU_EC_T_MODE) end SU_EC_T_MODE,

   SU_LANG_CODE,
   L.DESCRIPTION as LANGUAGE_DESCRIPTION,
   SU_LEVEL,
   (case D.DUPLICATE when 1 then 0 else SU_ON_STOP end) as SU_ON_STOP,
   SU_PRICE_KEY,
   dbo.AA_TWO_DPS_F(SU_TOT_DISC) as SU_TOT_DISC,
   dbo.AA_TWO_DPS_F(SU_LINE_DISC) as SU_LINE_DISC,
   dbo.AA_VALUE_DPS_F(SU_CREDIT_LIMIT) as SU_CREDIT_LIMIT,
   SU_TERMS,
   case
      when SU_SETT_DISC1 >= 100 then dbo.AA_TWO_DPS_F(99.99)
      when SU_SETT_DISC1 < 0 then dbo.AA_TWO_DPS_F(0)
      else dbo.AA_TWO_DPS_F(SU_SETT_DISC1)
   end as SU_SETT_DISC1,
   SU_SETT_DAYS1,
   case
      when SU_SETT_DISC2 >= 99.99 then dbo.AA_TWO_DPS_F(99.98)
      when SU_SETT_DISC2 < 0 then dbo.AA_TWO_DPS_F(0)
      else dbo.AA_TWO_DPS_F(SU_SETT_DISC2)
   end as SU_SETT_DISC2,
   SU_SETT_DAYS2,
   dbo.AA_VALUE_DPS_F(SU_DEL_CHARGE) as SU_DEL_CHARGE,
   dbo.AA_TWO_DPS_F(SU_DEL_CHG_PCNT) as SU_DEL_CHG_PCNT,
   dbo.AA_VALUE_DPS_F(SU_MIN_ORDR) as SU_MIN_ORDR,
   SU_A_P_DAYS,
   SU_DUEDATE_TYPE,
   SU_DUE_DAYS,
   SUSORT,
   SUUSER1,
   SUUSER2,
   SUUSER3,

   (case D.DUPLICATE when 1 then '' else SU_NOTES end) as SU_NOTES,
   SU_CONTACT_COMPTYPE,
   SUCONTACT,
   SU_CONTACT_TITLE,
   SU_CONTACT_INITIALS,
   SU_CONTACT_SURNAME,
   SU_CONTACT_FIRSTNAME,
   SUSALUTE,
   SU_CONTACT_JOB,
   SU_BANK_SORT,
   SU_BANK_AC_NO,
   SU_BANK_AC_NAME,
   SU_BANK_BACSREF,
   SU_BANK_BANKNAME,
   SU_ISDN_NUMBER,
   SU_EDI_ANA,
   SU_EDI_SUPPIDN,
   SU_USRCHAR1,
   SU_USRCHAR2,
   SU_USRCHAR5,
   SU_USRCHAR6,
   SU_USRCHAR7,
   SU_USRCHAR8,
   SU_USRDATE1,
   SU_USRDATE2,
   SU_USRDATE3,
   SU_USRFLAG1,
   SU_USRFLAG2,
   SU_USRFLAG3,
   dbo.AA_VALUE_DPS_F(SU_USRNUM1) as SU_USRNUM1,
   dbo.AA_VALUE_DPS_F(SU_USRNUM2) as SU_USRNUM2,
   dbo.AA_VALUE_DPS_F(SU_USRNUM3) as SU_USRNUM3,
   SU_USRCHAR3 as SU_USER_LONG_CHAR1,
   SU_USRCHAR4 as SU_USER_LONG_CHAR2,
   SU_US1099,
   (case D.DUPLICATE when 1 then 0 else SU_PRIMARY end) as SU_PRIMARY,
   SU_COUNTRY,
   SU_XML_ORDER_FORMAT,
   SU_EMAIL_SUBJECT,
   SU_EMAIL_MESSAGE,
   SU_OUR_ACCOUNT_CODE,
   convert(int,substring(SU_DOC_DESTINATION,1,1)) as STATEMENT_DESTINATION,  -- (0=printer,2=file,3=fax,4=email,6=XML)
   convert(int,substring(SU_DOC_DESTINATION,2,1)) as REMITTANCE_DESTINATION, -- (0=printer,2=file,3=fax,4=email,6=XML)
   convert(int,substring(SU_DOC_DESTINATION,3,1)) as ORDER_DESTINATION,      -- (0=printer,2=file,3=fax,4=email,6=XML)
   SU_IBAN_NO,
   (case D.DUPLICATE when 1 then 0 else SUUSED end) as SUUSED,
   (case D.DUPLICATE when 1 then NULL else SU_DATE_PUTIN end) as SU_DATE_PUTIN,
   (case D.DUPLICATE when 1 then NULL else SU_DATE_EDITED end) as SU_DATE_EDITED,
   (case D.DUPLICATE when 1 then NULL else SU_DATE_INV end) as SU_DATE_INV,
   (case D.DUPLICATE when 1 then NULL else SU_DATE_PAY end) as SU_DATE_PAY,

   (case D.DUPLICATE when 1 then 1 else (case when SU_REM_ADD_CDE = 1 then 1 else 0 end) end) as REMITTANCE_ADDRESS,
   (case D.DUPLICATE when 1 then 1 else (case when SU_INV_ADD_CDE = 1 then 1 else 0 end) end) as DEFAULT_INVOICE_ADDRESS,
   (case D.DUPLICATE when 1 then 1 else (case when SU_ST_ADD_CODE = 1 then 1 else 0 end) end) as STATEMENT_ADDRESS,
   (case D.DUPLICATE when 1 then 1 else (case when SU_DEL_ADD_CDE = 1 then 1 else 0 end) end) as DELIVERY_ADDRESS,

   (case D.DUPLICATE when 1 then NULL else SU_USER_PUTIN end) as SU_USER_PUTIN,
   (case D.DUPLICATE when 1 then NULL else SU_USER_EDITED end) as SU_USER_EDITED,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(SUBALANCE) end) as SUBALANCE,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(SUTURNOVERYTD) end) as SUTURNOVERYTD,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(SUTURNOVR_YTD_C) end) as SUTURNOVR_YTD_C,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(SUBALANCE_C) end) as SUBALANCE_C,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_SUPPLIER_EDITABLE_F( SUCODE, 1 ) end) as CODE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_SUPPLIER_EDITABLE_F( SUCODE, 2 ) end) as CURRENCY_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_SUPPLIER_EDITABLE_F( SUCODE, 3 ) end) as MULTI_CURRENCY_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_SUPPLIER_EDITABLE_F( SUCODE, 4 ) end) as VAT_STATUS_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_PL_SUPPLIER_EDITABLE_F( SUCODE, 5 ) end) as COUNTRY_CODE_EDITABLE,
   dbo.AA_PL_SUPPLIER_EDITABLE_F( SUCODE, 6 ) as HAS_MULTIPLE_ADDRESSES,

   SU_IR_APPROVER1,
   SU_IR_APPROVER2,
   SU_IR_APPROVER3,
   (case D.DUPLICATE when 1 then SU_PRIMARY else 0 end) as DUPLICATE_PRIMARY,
   (case D.DUPLICATE when 0 then SU_DO_NOT_USE else 0 end) as SU_EXCLUDED
from
   PL_ACCOUNTS
   join PL_ACCOUNTS2 on PL_ACCOUNTS.SU_PRIMARY = PL_ACCOUNTS2.SU_PRIMARY_2
   cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
   left outer join PL_ANALYSIS as PURCHASE_ANALSYIS on PURCHASE_ANALSYIS.PACODE = PL_ACCOUNTS.SU_ANALYSIS
   left outer join PL_ANALYSIS as BANK_ANALYSIS on BANK_ANALYSIS.PACODE = PL_ACCOUNTS.SU_BANK_ANALYS
   left outer join SYS_CURRENCY on SYS_CURRENCY.CURR_CODE = PL_ACCOUNTS.SUCURRENCYCODE
   left outer join SYS_COUNTRY on SYS_COUNTRY.CO_CODE = SU_COUNTRY_CODE
   left outer join SYS_LANGUAGES L on L.LANGUAGE_CODE = SU_LANG_CODE
   left outer join SYS_VATCONTROL on VAT_CODE = SU_TAX_CODE