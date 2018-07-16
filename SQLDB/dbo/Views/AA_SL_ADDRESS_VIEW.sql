create view AA_SL_ADDRESS_VIEW
/*
** Written     :  27/02/2004 SR
** Last Amended:  19/04/2004 SR, 18/08/2004 SR, 03/11/2004 SRB, 24/11/2004 SR, 01/12/2004 SH, 26/01/2005 SR, 21/07/2005 SH, 27/09/2005 SRB, 26/10/2005 JC, 21/11/2005
*/
as

select
   dbo.AA_SL_CUSTOMER_ADDRESS_EDITABLE_F( SL_AD_PRIMARY, 1 ) as TAX_CODE_EDITABLE,
   SL_AD_PRIMARY as [PRIMARY],
   (case D.DUPLICATE when 1 then '' else user1.USER_NAME end) as CREATEDBY,
   (case D.DUPLICATE when 1 then '' else user2.USER_NAME end) as MODIFIEDBY,
   (case D.DUPLICATE when 1 then '' else user3.USER_NAME end) as ALLOCATEDUSERNAME,
   (case D.DUPLICATE when 1 then NULL else AD_USER_ALOC end) as AD_USER_ALOC,
   AD_ACC_CODE,
   cast((case D.DUPLICATE when 1 then 0 else AD_CODE end) as int) as AD_CODE,
   (case D.DUPLICATE when 1 then '' else CUNAME end) as CUNAME,
   (case D.DUPLICATE when 1 then 0 else CU_PRIMARY end) as CU_PRIMARY,
   (case D.DUPLICATE when 1 then '' else CURR_SYMBOL end) as CURR_SYMBOL,
   (case D.DUPLICATE when 1 then '' else AD_CON_CODE end) as AD_CON_CODE,
   AD_ADDRESS,
   AD_POSTCODE,
   AD_HOME_PHONE,
   AD_EXTENSION,
   AD_PHONE,
   AD_FAX,
   AD_MOBILE,
   AD_E_MAIL,
   AD_CC_EMAIL,
   AD_COUNTRY,
   AD_CONTACT,
   AD_CONT_SALUTE,
   (case D.DUPLICATE when 1 then 0 else AD_INV_ADDRESS end) as AD_INV_ADDRESS,
   (case D.DUPLICATE when 1 then 0 else AD_DEL_ADDRESS end) as AD_DEL_ADDRESS,
   (case D.DUPLICATE when 1 then 0 else AD_STAT_ADDRESS end) as AD_STAT_ADDRESS,
   AD_PROSPECT,
   AD_ACCOUNTNAME,
   (case D.DUPLICATE when 1 then '' else AD_NOTE end) as AD_NOTE,
   AD_CON_TITLE,
   AD_CON_INITIALS,
   AD_CON_SURNAME,
   AD_CON_JOB,
   AD_CON_FNAME,
   AD_DEALERCODE,
   AD_USERTEXT1,
   AD_USERTEXT2,
   AD_USERDATE1,
   AD_USERNUM1,
   AD_USERFLAG1,
   AD_USERFLAG2,
   AD_USERFLAG3,
   AD_USERFLAG4,
   (case D.DUPLICATE when 1 then NULL else AD_EDITED_TIME end) as AD_EDITED_TIME,
   (case D.DUPLICATE when 1 then NULL else AD_RECALL_TIME end) as AD_RECALL_TIME,
   (case D.DUPLICATE when 1 then NULL else AD_USER_EDITED end) as AD_USER_EDITED,
   (case D.DUPLICATE when 1 then NULL else AD_USER_PUTIN end) as AD_USER_PUTIN,
   (case D.DUPLICATE when 1 then NULL else AD_DATE_PUTIN end) as AD_DATE_PUTIN,
   (case D.DUPLICATE when 1 then NULL else AD_DATE_EDITED end) as AD_DATE_EDITED,
   AD_USERTEXT3,
   AD_USERTEXT4,
   AD_USERTEXT5,
   AD_USERTEXT6,
   AD_USERDATE2,
   AD_USERDATE3,
   AD_USERNUM2,
   AD_USERNUM3,
   AD_USERTEXT7,
   AD_USERTEXT8,
   AD_USERTEXT9,
   AD_USERTEXT10,
   AD_ADDRESS_USER1,
   AD_ADDRESS_USER2,
   AD_ANALYSIS,
   SANAME,
   (case D.DUPLICATE when 1 then 0 else AD_LEVEL end) as AD_LEVEL,
   (case D.DUPLICATE when 1 then NULL else AD_GROUP end) as AD_GROUP,
   AD_DEL_ADDRESS_2,
   (case D.DUPLICATE when 1 then 0 else AD_DLR_NOTIFICATION end) as AD_DLR_NOTIFICATION,
   (case D.DUPLICATE when 1 then NULL else AD_DLR_NOTIFICATION_DATE end) as AD_DLR_NOTIFICATION_DATE,
   (case D.DUPLICATE when 1 then 0 else AD_CNT_NOTIFICATION end) as AD_CNT_NOTIFICATION,
   (case D.DUPLICATE when 1 then NULL else AD_CNT_NOTIFICATION_DATE end) as AD_CNT_NOTIFICATION_DATE,
   (case D.DUPLICATE when 1 then 0 else SL_AD_PRIMARY end) as SL_AD_PRIMARY,
   AD_BRANCH_ID,
   (case AD_EXPORT_CODE when 'O' then 2 when 'E' then 1 else 0 end) as AD_EXPORT_CODE,
   AD_COUNTRY_CODE,
   CO_NAME,
   AD_VAT_REG_NO,
   (case AD_EC_DELIVERY
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
      else -1 end) as AD_EC_DELIVERY,
   case when isnull(AD_EC_T_NATURE,'') = '' then -1 else convert(int, AD_EC_T_NATURE) end as AD_EC_T_NATURE,
   case when isnull(AD_EC_T_MODE,'') = '' then -1 else convert(int, AD_EC_T_MODE) end as AD_EC_T_MODE,
   (case D.DUPLICATE when 1 then 0 else AD_DO_NOT_USE end) as AD_DO_NOT_USE,
   AD_USRCHAR1,
   AD_USRCHAR2,
   AD_USRCHAR3,
   AD_USRCHAR4,
   AD_USRCHAR5,
   AD_USRCHAR6,
   AD_USRCHAR7,
   AD_USRCHAR8,
   AD_USRDATE1,
   AD_USRDATE2,
   AD_USRDATE3,
   AD_USRFLAG1,
   AD_USRFLAG2,
   AD_USRFLAG3,
   AD_USRNUM1,
   AD_USRNUM2,
   AD_USRNUM3,
   (case D.DUPLICATE when 1 then 0 else CU_MULTI_CURR end) as CU_MULTI_CURR,
   (case D.DUPLICATE when 1 then SL_AD_PRIMARY else 0 end) as DUPLICATE_PRIMARY
from
   SL_ADDRESSES
      inner join SL_ACCOUNTS on CUCODE = AD_ACC_CODE
      cross join (select 0 as DUPLICATE union select 1 as DUPLICATE) as D
      inner join SYS_CURRENCY on CUCURRENCYCODE = CURR_CODE
      left outer join SL_ADDRESSES2 on AD_PRIMARY_2 = SL_AD_PRIMARY
      left outer join SYS_USER user1 on AD_USER_PUTIN = user1.USER_ID
      left outer join SYS_USER user2 on AD_USER_EDITED = user2.USER_ID
      left outer join SYS_USER user3 on AD_USER_ALOC = user3.USER_ID
      left outer join SL_ANALYSIS on SACODE = AD_ANALYSIS
      left outer join SYS_COUNTRY on CO_CODE = AD_COUNTRY_CODE