create view AA_ACD_REMITTANCES_VIEW
as
select
   DLH_PRIMARY
,  DLH_DOC_TYPE
,  DLH_DOC_DATE
,  DLH_TEXT
,  DLH_CHEQUE_VALUE
,  DLH_CHEQUE_WORD1
,  DLH_CHEQUE_WORD2
,  DLH_CHEQUE_WORD3
,  DLH_CHEQUE_WORD4
,  DLH_CHEQUE_WORD5
,  DLH_CHEQUE_WORD6
,  DLH_CHEQUE_WORD7
,  DLH_CURRSYMBOL
,  DLH_FAX_HEADER
,  DLH_FAX_FOOTER
,  DLH_COMP_ADDRESS
,  DLH_CHEQUE_NO
,  DLH_USER_ID
,  DLH_CIS_MONTH_ENDING
,  DLH_CIS_GROSS_PAID
,  DLH_CIS_CITB_LEVY
,  DLH_CIS_MATERIALS
,  DLH_CIS_TAX_WITHHELD
,  DLH_CIS_TAX_PERCENT
,  case isnumeric(DLH_AGED_TITLE1)
      when 1 then cast(DLH_AGED_TITLE1 as float)
      else
         0
   end                                                   as DLH_CIS_DEDUCTIONS
,  case isnumeric(DLH_AGED_TITLE2)
      when 1 then cast(DLH_AGED_TITLE2 as integer)
      else
         0
   end                                                   as DLH_CIS_TAX_STATUS
,  isnull(DOC_LEDGER_HEADER.DLH_AGED_TITLE3,'')          as DLH_CIS_VERIFICATION_NUMBER
,  DLH_REMITVAL_DOC
,  DLH_SETDISC_DOC

,  DLD.DLD_PRIMARY
,  DLD.DLD_HEADER_LINK
,  DLD.DLD_DRVAL_DOC
,  DLD.DLD_CRVAL_DOC
,  DLD.DLD_REMITVAL_DOC
,  DLD.DLD_OSVAL_DOC
,  DLD.DLD_SETDISC_DOC

,  PT_TRANTYPE
,  PT_HEADER_REF
,  PT_DESCRIPTION
,  PT_DATE
,  PT_QUERY_FLAG

,  SUCODE
,  SUNAME
,  isnull(SU_CIS, 0)                                     as SU_CIS
,  isnull
   (
      SU_CIS300_NAME
   ,  isnull(SU_CIS_TITLE+' ', '')
   +  isnull(substring(SU_CIS_FORENAME1,1,1)+' ','')
   +  isnull(substring(SU_CIS_FORENAME2,1,1)+' ','')
   +  isnull(SU_CIS_SURNAME,'')
   )                                                     as SU_CIS300_NAME
,  isnull(SU_CIS_UTR, '')                                as SU_CIS_UTR
,  isnull(SU_VERIFICATION_NUMBER, '')                    as SU_VERIFICATION_NUMBER
,  isnull(SU_CIS_TAX_STATUS, 0)                          as SU_CIS_TAX_STATUS

,  PL_AD_ADDRESS
,  PL_AD_POSTCODE
,  PL_AD_ADDRESS_USER1
,  PL_AD_ADDRESS_USER2
,  PL_AD_COUNTRY

,  SYS_DATAINFO2.LINES_PER_PAGE
,  SYS_DATAINFO2.CIS_EMPLOYER_REF
,  SYS_DATAINFO2.CIS_USE_NEW_CITB_LEVY_CALCS
   from
      DOC_LEDGER_HEADER with(nolock)
         inner join   SYS_DATAINFO              with(nolock)  on SYS_PRIMARY       = 1
         inner join   SYS_DATAINFO2             with(nolock)  on SYS_PRIMARY_2     = SYS_PRIMARY
         inner join   DOC_LEDGER_DETAIL   DLD   with(nolock)  on DLD_HEADER_LINK   = DLH_PRIMARY
         inner join   (
                        select
                           sum(DLD_REMITVAL_DOC)   DLH_REMITVAL_DOC
                        ,  sum(DLD_SETDISC_DOC)    DLH_SETDISC_DOC
                        ,  DLD_HEADER_LINK
                           from
                              DOC_LEDGER_DETAIL with(nolock)
                           group by
                              DLD_HEADER_LINK
                      )   DLT                                  on DLT.DLD_HEADER_LINK   = DLH_PRIMARY
         inner join   PL_TRANSACTIONS           with(nolock)   on PT_PRIMARY            = DLD_TRAN_LINK
         inner join   PL_ACCOUNTS               with(nolock)   on SUCODE                = PT_COPYSUPP
         inner join   PL_ADDRESSES              with(nolock)   on PL_AD_CON_CODE        = cast(SUCODE as char(10))+convert(varchar,SU_REM_ADD_CDE)