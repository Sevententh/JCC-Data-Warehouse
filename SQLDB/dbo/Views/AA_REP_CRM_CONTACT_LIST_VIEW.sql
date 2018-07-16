create view AA_REP_CRM_CONTACT_LIST_VIEW
/*
** Written     :  23/03/2006 RV
** Last Amended:
**
** Used by     :  My Contacts Report.rpt
**                Customer Contact List.rpt
*/
as

select
   SL_ACCOUNTS.CU_ACC_CODE                      as CustomerorProspect
,  SL_ACCOUNTS.CUNAME
,  isnull(SL_ACCOUNTS.CU_DEALERCODE,'')         as CU_DEALERCODE
,  isnull(DEALER.CUNAME,'')                     as DEALER_NAME
,  SL_ADDRESSES.AD_USER_ALOC
,  'ENGLISH   '                                 as LANGUAGE_LINK
,  case SL_ADDRESSES.AD_PROSPECT
      when 'P' then 1
      else
         0
   end                                          as PROSPECTS_ONLY
,  case SL_ADDRESSES.AD_PROSPECT
      when 'C' then 1
      else
         0
   end                                          as CUSTOMERS_ONLY
,  SL_ADDRESSES.AD_ADDRESS
,  SL_ADDRESSES.AD_ADDRESS_USER1
,  SL_ADDRESSES.AD_ADDRESS_USER2
,  SL_ADDRESSES.AD_POSTCODE
,  SL_ADDRESSES.AD_HOME_PHONE
,  SL_ADDRESSES.AD_EXTENSION
,  SL_ADDRESSES.AD_PHONE
,  SL_ADDRESSES.AD_FAX
,  SL_ADDRESSES.AD_MOBILE
,  SL_ADDRESSES.AD_E_MAIL
,  SL_ADDRESSES.AD_EXPORT_CODE
,  SL_ADDRESSES.AD_CONTACT
,  SL_ADDRESSES.AD_CONT_SALUTE
,  SL_ADDRESSES.AD_CON_TITLE
,  SL_ADDRESSES.AD_CON_INITIALS
,  SL_ADDRESSES.AD_CON_SURNAME
,  SL_ADDRESSES.AD_CON_JOB
,  SL_ADDRESSES.AD_CON_FNAME
,  SL_ADDRESSES.AD_ACCOUNTNAME
,  SL_ADDRESSES.AD_NOTE
,  SL_ADDRESSES.AD_USERTEXT1                                      -- Next Action
,  SL_ADDRESSES.AD_USERTEXT2                                      -- Status
,  SL_ADDRESSES.AD_USERTEXT3                                      -- Salesman
,  SL_ADDRESSES.AD_USERTEXT4                                      -- Source
,  SL_ADDRESSES.AD_USERTEXT7                                      -- Oportunity
,  SL_ADDRESSES.AD_USERTEXT8                                      -- Sales Process
,  SL_ADDRESSES.AD_USERTEXT9                                      -- Sales Stage
,  SL_ADDRESSES.AD_USERTEXT10                                     -- Contact Char 8
,  SL_ADDRESSES.AD_USERDATE1
,  SL_ADDRESSES.AD_USERDATE2
,  SL_ADDRESSES.AD_USERDATE3
,  SL_ADDRESSES.AD_USERNUM1
,  SL_ADDRESSES.AD_USERNUM2
,  SL_ADDRESSES.AD_USERNUM3
,  cast (SL_ADDRESSES.AD_USERFLAG1 as bit)      as AD_USERFLAG1
,  cast (SL_ADDRESSES.AD_USERFLAG2 as bit)      as AD_USERFLAG2
,  cast (SL_ADDRESSES.AD_USERFLAG3 as bit)      as AD_USERFLAG3
,  cast (SL_ADDRESSES.AD_USERFLAG4 as bit)      as AD_USERFLAG4
,  SL_ADDRESSES.AD_EDITED_TIME
,  isnull(SL_ADDRESSES.AD_RECALL_TIME,'')       as AD_RECALL_TIME
,  isnull(SL_ADDRESSES.AD_USER_EDITED,'')       as AD_USER_EDITED
,  SL_ADDRESSES.AD_USER_PUTIN
,  SL_ADDRESSES.AD_DATE_PUTIN
,  SL_ADDRESSES.AD_DATE_EDITED
,  SL_ADDRESSES.AD_DLR_NOTIFICATION
,  SL_ADDRESSES.AD_DLR_NOTIFICATION_DATE
,  SL_ADDRESSES.AD_CNT_NOTIFICATION
,  SL_ADDRESSES.AD_CNT_NOTIFICATION_DATE
,  isnull(SL_ADDRESSES.AD_CC_EMAIL,'')          as AD_CC_EMAIL
,  SL_ADDRESSES.AD_COUNTRY
,  SL_ADDRESSES.AD_COUNTRY_CODE
,  SL_ADDRESSES.AD_DO_NOT_EMAIL
,  SL_ADDRESSES.AD_DATE_ALLOCATED
,  isnull(SL_ADDRESSES3.AD3_USRCHAR1,'')        as AD3_USRCHAR1
,  isnull(SL_ADDRESSES3.AD3_USRCHAR2,'')        as AD3_USRCHAR2
,  isnull(SL_ADDRESSES3.AD3_USRCHAR3,'')        as AD3_USRCHAR3
,  isnull(SL_ADDRESSES3.AD3_USRCHAR4,'')        as AD3_USRCHAR4
,  isnull(SL_ADDRESSES3.AD3_USRCHAR5,'')        as AD3_USRCHAR5   -- 100 char field
,  isnull(SL_ADDRESSES3.AD3_USRCHAR6,'')        as AD3_USRCHAR6   -- 100 char field
,  isnull(SL_ADDRESSES3.AD3_USRCHAR7,'')        as AD3_USRCHAR7   -- 100 char field
,  isnull(SL_ADDRESSES3.AD3_USRCHAR8,'')        as AD3_USRCHAR8   -- 100 char field
,  isnull(SL_ADDRESSES3.AD3_USRCHAR9,'')        as AD3_USRCHAR9   -- Contact Char 9
,  isnull(SL_ADDRESSES3.AD3_USRCHAR10,'')       as AD3_USRCHAR10
,  isnull(SL_ADDRESSES3.AD3_USRCHAR11,'')       as AD3_USRCHAR11
,  isnull(SL_ADDRESSES3.AD3_USRCHAR12,'')       as AD3_USRCHAR12
,  SL_ADDRESSES3.AD3_USRDATE1                                     -- Next Action Date
,  SL_ADDRESSES3.AD3_USRDATE2                                     -- Contact Date 2
,  SL_ADDRESSES3.AD3_USRDATE3                                     -- Contact Date 3
,  SL_ADDRESSES3.AD3_USRDATE4
,  SL_ADDRESSES3.AD3_USRDATE5
,  SL_ADDRESSES3.AD3_USRDATE6
,  SL_ADDRESSES3.AD3_USRDATE7
,  SL_ADDRESSES3.AD3_USRDATE8
,  SL_ADDRESSES3.AD3_USRDATE9
,  isnull(SL_ADDRESSES3.AD3_USRNUM1,0)          as AD3_USRNUM1
,  isnull(SL_ADDRESSES3.AD3_USRNUM2,0)          as AD3_USRNUM2
,  isnull(SL_ADDRESSES3.AD3_USRNUM3,0)          as AD3_USRNUM3
,  isnull(SL_ADDRESSES3.AD3_USRNUM4,0)          as AD3_USRNUM4
,  isnull(SL_ADDRESSES3.AD3_USRNUM5,0)          as AD3_USRNUM5
,  cast(SL_ADDRESSES3.AD3_USRFLAG1 as bit)      as AD3_USRFLAG1
,  cast(SL_ADDRESSES3.AD3_USRFLAG2 as bit)      as AD3_USRFLAG2
,  cast(SL_ADDRESSES3.AD3_USRFLAG3 as bit)      as AD3_USRFLAG3
,  cast(SL_ADDRESSES3.AD3_USRFLAG4 as bit)      as AD3_USRFLAG4
,  cast(SL_ADDRESSES3.AD3_USRFLAG5 as bit)      as AD3_USRFLAG5
,  isnull(SL_ADDRESSES3.AD3_USRTIME1,'')        as AD3_USRTIME1
   from
      SL_ACCOUNTS with(nolock)
         inner join SL_ADDRESSES          with(nolock)   on       SL_ADDRESSES.AD_ACC_CODE   = SL_ACCOUNTS.CU_ACC_CODE
         left  join SL_ACCOUNTS  DEALER   with(nolock)   on       DEALER.CUCODE              = SL_ACCOUNTS.CU_DEALERCODE
                                                            and   DEALER.CUCODE              is not null
                                                            and   DEALER.CUCODE <> ''
         left  join SL_ADDRESSES3         with(nolock)   on       SL_ADDRESSES3.AD_PRIMARY_3 = SL_ADDRESSES.SL_AD_PRIMARY