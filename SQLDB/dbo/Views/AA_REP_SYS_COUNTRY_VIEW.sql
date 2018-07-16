create view AA_REP_SYS_COUNTRY_VIEW
/*
**
** Written     :  01/12/2005 RV
** Last Amended:
**
** Comments    : Returns Country records to be used with crystal reports
*/
as

select
   CO_PRIMARY           as [PRIMARY]
,  CO_CODE
,  isnull(CO_NAME,'')   as CO_NAME
,  CO_SYMBOL
,  CO_DEL_TERMS
,  CO_TRN_NATURE
,  CO_TRNSPRT_MODE
,  CO_AGENT_BRANCH
,  CO_TAX_NAME
,  CO_VAT_REG_PREFIX
,  CO_NOTES
,  CO_AGENT_VATNO
,  CO_DATE_EDITED
,  CO_DATE_PUTIN
,  CO_USER_EDITED
,  CO_USER_PUTIN
,  CO_EC_FLAG
   from
      SYS_COUNTRY