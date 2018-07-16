create view AA_SL_ACCOUNT_VIEW
/*
** Written:			25/02/04 SR
** Last Amended:	27/07/04 NC, 10/08/04 NC; 10/08/04 SRB, 25/08/04 NC, 26/08/04 NC, 29/10/2004 SH, 30/11/2004 SH; 12/07/05 SRB, 05/08/2005 SH, 13/12/05 NC, 19/12/05 NC, 07/04/06 SH, 7/7/2010 RL
*/
as

select
   C.CU_PRIMARY AS [PRIMARY],
   (case D.DUPLICATE when 1 then '' else C.CUCODE end) as CUCODE,
   C.CUNAME,
   C.CUADDRESS,
   C.CU_ADDRESS_USER1,
   C.CU_ADDRESS_USER2,
   C.CUPOSTCODE,
   C.CU_COUNTRY,
   C.CUPHONE,
   C.CUFAX,
   C2.CU_MOBILE_NUMBER,
   C.CU_EMAIL,
   C2.CU_WEBSITE_ADDRESS,

   C.CUCURRENCYCODE,
   SYS_CURRENCY.CURR_SYMBOL as CURRENCY_SYMBOL,

   C.CU_MULTI_CURR,
   (case C.CU_EXPORT_CODE when 'O' then 2 when 'E' then 1 else 0 end) as CU_EXPORT_CODE,

   C.CU_ANALYSIS,
   SALES_ANALYSIS.SANAME as SALES_ANALYSIS_NAME,
   SALES_ANALYSIS.SACURRENCYSYMBL as SALES_ANALYSIS_CURRENCY,

   C.CU_BANK_ANALYS,
   BANK_ANALYSIS.SANAME as BANK_ANALYSIS_NAME,
   BANK_ANALYSIS.SACURRENCYSYMBL as BANK_ANALYSIS_CURRENCY,

   C.CU_TAX_CODE,
   VAT_RATE as TAX_RATE,
   (case D.DUPLICATE when 1 then '' else C.CU_VAT_REG_NO end) as CU_VAT_REG_NO,
   C.CU_COUNTRY_CODE,
   CO_NAME,
   (case C.CU_EC_DELIVERY
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
          else -1 end)    as CU_EC_DELIVERY, 
   case when isnull(C.CU_EC_T_NATURE,'') = '' then -1 else convert(int, C.CU_EC_T_NATURE) end as CU_EC_T_NATURE, -- 10=Change of Ownership, 20=Returned/Replacement, 30=Free of Charge, 40=Processing/Repair, 50=Returned after Processing/Repair, 60=Temporary Usage, 70=Joint Projects, 80=Construction/Engineering, 90=Other
   case when isnull(C.CU_EC_T_MODE,'') = '' then -1 else convert(int, C.CU_EC_T_MODE) end as CU_EC_T_MODE,     -- 1=Sea, 2=Rail, 3=Road, 4=Air, 5=Post, 6=Not Allocated, 7=Fixed Installations, 8=Inland Waterway, 9=Own Propulsion
   C2.CU_LANG_CODE,
   L.DESCRIPTION as LANGUAGE_DESCRIPTION,
   C.CU_USERDATE1, -- Next contact date
   C2.CU_LEVEL,
   (case D.DUPLICATE when 1 then 0 else C.CU_ON_STOP end) as CU_ON_STOP,
   isnull(SDL_DOC_NAME,'') as CU_INV_LAYOUT,
   C.CU_PRICE_KEY,
   dbo.AA_TWO_DPS_F(C.CU_TOT_DISC) as CU_TOT_DISC,
   dbo.AA_TWO_DPS_F(C.CU_LINE_DISC) as CU_LINE_DISC,
   dbo.AA_VALUE_DPS_F(C.CU_CREDIT_LIMIT) as CU_CREDIT_LIMIT,
   C.CU_TERMS,
   case
      when C.CU_SETT_DISC_1 >= 100 then dbo.AA_TWO_DPS_F(99.99)
      when C.CU_SETT_DISC_1 < 0 then dbo.AA_TWO_DPS_F(0)
      else dbo.AA_TWO_DPS_F(C.CU_SETT_DISC_1)
   end as CU_SETT_DISC_1,
   C.CU_SETT_DAYS_1,
   case
      when C.CU_SETT_DISC_2 >= 99.99 then dbo.AA_TWO_DPS_F(99.98)
      when C.CU_SETT_DISC_2 < 0 then dbo.AA_TWO_DPS_F(0)
      else dbo.AA_TWO_DPS_F(C.CU_SETT_DISC_2)
   end as CU_SETT_DISC_2,
   C.CU_SETT_DAYS_2,
   dbo.AA_VALUE_DPS_F(C.CU_DEL_CHARGE) as CU_DEL_CHARGE,
   dbo.AA_TWO_DPS_F(C.CU_DEL_CHG_PCNT) as CU_DEL_CHG_PCNT,
   dbo.AA_VALUE_DPS_F(C.CU_MIN_ORDR) as CU_MIN_ORDR,
   C.CU_A_P_DAYS,
   C.CU_DUEDATE_TYPE, -- 0=From invoice date, 1=End of following month, 2=Day of following month, 3=Days after end of the month
   C.CU_DUE_DAYS,
   C.CUSORT,
   C.CUUSER1,
   C.CUUSER2,
   C.CUUSER3,
   (case D.DUPLICATE when 1 then '' else C.CU_NOTES end) as CU_NOTES,
   (case D.DUPLICATE when 1 then '' else C.CUCONTACT end) as CUCONTACT,
   C2.CU_CONTACT_COMPTYPE as CU_CONTACT_COMPTYPE, --0=Company, 1=Private, 2=Education, 3=Government, 4=Corporate, 5=Charity, 6=Development
   C2.CU_CONTACT_TITLE,
   C2.CU_CONTACT_INITIALS,
   C2.CU_CONTACT_SURNAME,
   C2.CU_CONTACT_FIRSTNAME,
   C.CUSALUTE,
   C2.CU_CONTACT_JOB,
   C2.CU_BANK_SORT,
   C2.CU_BANK_AC_NO,
   C2.CU_BANK_BANKNAME,
   C2.CU_BANK_BACSREF,
   C2.CU_BANK_AC_NAME,
   C.CU_WEB_PASSWORD,
   C2.CU_ISDN_NUMBER,
   C2.CU_EDI_ANA,
   C2.CU_EDI_CUSTIDN,
   C2.CU_USRCHAR1,
   C2.CU_USRCHAR2,
   C2.CU_USRCHAR5,
   C2.CU_USRCHAR6,
   C2.CU_USRCHAR7,
   C2.CU_USRCHAR8,
   C2.CU_USRDATE1,
   C2.CU_USRDATE2,
   C2.CU_USRDATE3,
   C2.CU_USRFLAG1,
   C2.CU_USRFLAG2,
   C2.CU_USRFLAG3,
   dbo.AA_VALUE_DPS_F(C2.CU_USRNUM1) as CU_USRNUM1,
   dbo.AA_VALUE_DPS_F(C2.CU_USRNUM2) as CU_USRNUM2,
   dbo.AA_VALUE_DPS_F(C2.CU_USRNUM3) as CU_USRNUM3,
   C2.CU_USRCHAR3 as CU_USER_LONG_CHAR1,
   C2.CU_USRCHAR4 as CU_USER_LONG_CHAR2,
   (case D.DUPLICATE when 1 then 0 else C.CUUSED end) as CUUSED,
   (case D.DUPLICATE when 1 then NULL else C.CU_DATE_PUTIN end) as CU_DATE_PUTIN,
   (case D.DUPLICATE when 1 then NULL else C.CU_DATE_EDITED end) as CU_DATE_EDITED,
   (case D.DUPLICATE when 1 then NULL else C.CU_DATE_INV end) as CU_DATE_INV,
   (case D.DUPLICATE when 1 then NULL else C.CU_DATE_PAY end) as CU_DATE_PAY,
   (case when D.DUPLICATE = 1 then 1 when C.CU_INV_ADD_CDE = 1 then 1 else 0 end) as DEFAULT_INVOICE_ADDRESS,
   (case when D.DUPLICATE = 1 then 1 when C.CU_DEL_ADD_CDE = 1 then 1 else 0 end) as DEFAULT_DELIVERY_ADDRESS,
   (case when D.DUPLICATE = 1 then 1 when C.CU_STAT_ADD_CDE = 1 then 1 else 0 end) as STATEMENT_ADDRESS,
   (case D.DUPLICATE when 1 then 1 else A.AD_DEL_ADDRESS_2 end) as DELIVERY_ADDRESS,
   (case D.DUPLICATE when 1 then 0 else C.CU_PRIMARY end) as CU_PRIMARY,
   C2.CU_CNF_EMAIL_MESSAGE,
   C2.CU_CNF_EMAIL_SUBJECT,
   C2.CU_CNF_XML_FORMAT,
   (case when C2.CU_HEAD_OFFICE=1 then '' else C2.CU_HEAD_OFFICE_CODE end) as HEAD_OFFICE_CODE,
   (case when C2.CU_HEAD_OFFICE=0 and isnull(C2.CU_HEAD_OFFICE_CODE,'')<>'' then (select H.CUNAME from SL_ACCOUNTS H where H.CUCODE = C2.CU_HEAD_OFFICE_CODE) else '' end) as HEAD_OFFICE_NAME,
   (case when C2.CU_HEAD_OFFICE = 1 then 1 when isnull(C2.CU_HEAD_OFFICE_CODE,'')<>'' then 2 else 0 end) as CU_HEAD_OFFICE, -- (0=standard, 1=head office, 2=sub office)
   C2.CU_IBAN_NO,
   C2.CU_INV_EMAIL_MESSAGE,
   C2.CU_INV_EMAIL_SUBJECT,
   C2.CU_INV_XML_FORMAT,
   C2.CU_OUR_ACCOUNT_CODE,
   C2.CU_STOCK_ALLOCATION_PRIORITY,
   C2.CU_HEAD_OFFICE_DEFDELADDR,
   C2.CU_HEAD_OFFICE_DEFINVADDR,
   convert(int,substring(C.CU_DOC_DESTINATION,1,1)) as INVOICE_DESTINATION,  -- (0=printer,2=file,3=fax,4=email,6=XML)
   convert(int,substring(C.CU_DOC_DESTINATION,3,1)) as STATEMENT_DESTINATION,-- (0=printer,2=file,3=fax,4=email,6=XML)
   convert(int,substring(C.CU_DOC_DESTINATION,4,1)) as ORDER_DESTINATION,    -- (0=printer,2=file,3=fax,4=email,6=XML)
      
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(C.CUBALANCE) end) as CUBALANCE,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(C.CUTURNOVERYTD) end) as CUTURNOVERYTD,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(C.CUTURNOVR_YTD_C) end) as CUTURNOVR_YTD_C,
   (case D.DUPLICATE when 1 then 0 else dbo.AA_VALUE_DPS_F(C.CUBALANCE_C) end) as CUBALANCE_C,
   
   (case D.DUPLICATE when 1 then '' else C.CU_USER_PUTIN end) as CU_USER_PUTIN,
   (case D.DUPLICATE when 1 then '' else C.CU_USER_EDITED end) as CU_USER_EDITED,

   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 1 ) end) as CODE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 2 ) end) as CURRENCY_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 3 ) end) as MULTI_CURRENCY_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 4 ) end) as VAT_STATUS_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 5 ) end) as COUNTRY_CODE_EDITABLE,
   (case D.DUPLICATE when 1 then 1 else dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 6 ) end) as HEAD_OFFICE_EDITABLE,
   dbo.AA_SL_CUSTOMER_EDITABLE_F( C.CUCODE, 7 ) as HAS_MULTIPLE_ADDRESSES,

   (case D.DUPLICATE when 1 then C.CU_PRIMARY else 0 end) as DUPLICATE_PRIMARY,
   (case D.DUPLICATE when 0 then C.CU_DO_NOT_USE else 0 end) as CU_EXCLUDED

from
   SL_ACCOUNTS as C
   join SL_ACCOUNTS2 as C2 on C2.CU_PRIMARY_2 = C.CU_PRIMARY
   left outer join SL_ADDRESSES as A on A.AD_CON_CODE = convert(char(10),C.CUCODE) + '1'
   cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
   left outer join SL_ANALYSIS as SALES_ANALYSIS on SALES_ANALYSIS.SACODE = C.CU_ANALYSIS
   left outer join SL_ANALYSIS as BANK_ANALYSIS on BANK_ANALYSIS.SACODE = C.CU_BANK_ANALYS
   left outer join SYS_CURRENCY on SYS_CURRENCY.CURR_CODE = C.CUCURRENCYCODE
   left outer join SYS_COUNTRY on SYS_COUNTRY.CO_CODE = C.CU_COUNTRY_CODE
   left outer join SYS_LANGUAGES L on L.LANGUAGE_CODE = C2.CU_LANG_CODE
   left outer join SYS_VATCONTROL on VAT_CODE = C.CU_TAX_CODE
   left join SYS_DOCUMENT_LAYOUTS on SDL_PRIMARY = C.CU_INV_LAYOUT_LINK
where isnull( C.CUCODE, '' ) <> ''