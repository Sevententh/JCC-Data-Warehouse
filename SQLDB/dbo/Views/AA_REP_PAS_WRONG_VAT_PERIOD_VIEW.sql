CREATE VIEW dbo.AA_REP_PAS_WRONG_VAT_PERIOD_VIEW
/*
** Written     :  26/06/2007 RV
** Last Amended:
**
** Used by     :  PAS76 - Purchase Invoices Posted to Earlier Period VAT Returns.rpt
**                PAS76 - Sales Invoices Posted to Later Period VAT Returns.rpt
*/
AS
select
 DET_VATCODE as VATCODE
,VAT_RATE as VAT_RATE_PERCENT
,case when DET_LEDGER <> 'NL' then substring(DET_ACCOUNT,1,10)
      when (DET_LEDGER = 'NL') and (substring(DET_ORIGIN,1,1) = 'S') then substring(DET_NOMINALCR,1,15)
      when (DET_LEDGER = 'NL') and (substring(DET_ORIGIN,1,1) = 'P') then substring(DET_NOMINALDR,1,15)
      when substring(DET_ORIGIN,1,1) = 'N' then case when isnull(DET_NOMINALDR,'') <> '' then DET_NOMINALDR
                                                     else isnull(DET_NOMINALCR,'') end
 end DET_ACCOUNT
,DET_HEADER_REF
,DET_DATE
,DET_DATE_PUTIN
,DET_ECVAT_TYPE
,DET_EC_T_NATURE
,DET_TYPE
,DET_ORIGIN
,DET_LEDGER
,DET_NOM_YEAR
,DET_NOM_PERIOD
,DET_NOM_PERSORT
,DET_VAT_RETURN_PRIMARY
,DET_HEADER_KEY
,DET_COUNTRY_CDE
,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then DET_NETT
                         when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -DET_NETT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'S')) then DET_NETT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'S')) then -DET_NETT
                   when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then -DET_NETT
                         when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then DET_NETT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'P')) then -DET_NETT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'P')) then DET_NETT
                         else 0
end)  DET_NETT
,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then DET_VAT
                         when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -DET_VAT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'S')) then DET_VAT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'S')) then -DET_VAT
                   when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then -DET_VAT
                         when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then DET_VAT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'P')) then -DET_VAT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'P')) then DET_VAT
                         else 0
end)  DET_VAT

,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then DET_NETT
                         when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -DET_NETT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'S')) then DET_NETT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'S')) then -DET_NETT
                         else 0
 end) OUTPUTS_EX_VAT
,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then DET_VAT
                         when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -DET_VAT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'S')) then DET_VAT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'S')) then -DET_VAT
                         else 0
 end) VAT_ON_OUTPUTS
,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then DET_NETT
                         when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -DET_NETT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'P')) then DET_NETT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'P')) then -DET_NETT
                         else 0
 end) INPUTS_EX_VAT
,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then (DET_VAT+DET_PL_ACQ_TAX)
                         when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -(DET_VAT+DET_PL_ACQ_TAX)
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'P')) then (DET_VAT+DET_PL_ACQ_TAX)
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'P')) then -(DET_VAT+DET_PL_ACQ_TAX)
                         else 0
 end) VAT_ON_INPUTS

,case TAXAUDIT_TOYEAR   when 'N' then
                        case TAXAUDIT_TOPD
                           when 1 then dateadd(day,-1,dateadd(year,1,ENDDATE_P2))
                           when 2 then dateadd(day,-1,dateadd(year,1,ENDDATE_P3))
                           when 3 then dateadd(day,-1,dateadd(year,1,ENDDATE_P4))
                           when 4 then dateadd(day,-1,dateadd(year,1,ENDDATE_P5))
                           when 5 then dateadd(day,-1,dateadd(year,1,ENDDATE_P6))
                           when 6 then dateadd(day,-1,dateadd(year,1,ENDDATE_P7))
                           when 7 then dateadd(day,-1,dateadd(year,1,ENDDATE_P8))
                           when 8 then dateadd(day,-1,dateadd(year,1,ENDDATE_P9))
                           when 9 then dateadd(day,-1,dateadd(year,1,ENDDATE_P10))
                           when 10 then dateadd(day,-1,dateadd(year,1,ENDDATE_P11))
                           when 11 then dateadd(day,-1,dateadd(year,1,ENDDATE_P12))
                           when 12 then
                                    case NO_OF_PERIODS   when 12 then dateadd(day,-1,dateadd(year,2,ENDDATE_P1))
                                                   when 13 then dateadd(day,-1,dateadd(year,1,ENDDATE_P13))
                                    end
                           when 13 then dateadd(day,-1,dateadd(year,2,ENDDATE_P1))
                        end
                  when 'C' then
                        case TAXAUDIT_TOPD
                           when 1 then dateadd(day,-1,ENDDATE_P2)
                           when 2 then dateadd(day,-1,ENDDATE_P3)
                           when 3 then dateadd(day,-1,ENDDATE_P4)
                           when 4 then dateadd(day,-1,ENDDATE_P5)
                           when 5 then dateadd(day,-1,ENDDATE_P6)
                           when 6 then dateadd(day,-1,ENDDATE_P7)
                           when 7 then dateadd(day,-1,ENDDATE_P8)
                           when 8 then dateadd(day,-1,ENDDATE_P9)
                           when 9 then dateadd(day,-1,ENDDATE_P10)
                           when 10 then dateadd(day,-1,ENDDATE_P11)
                           when 11 then dateadd(day,-1,ENDDATE_P12)
                           when 12 then
                                    case NO_OF_PERIODS   when 12 then dateadd(day,-1,dateadd(year,1,ENDDATE_P1))
                                                   when 13 then dateadd(day,-1,ENDDATE_P13)
                                    end

                           when 13 then dateadd(day,-1,dateadd(year,1,ENDDATE_P1))
                        end
                  when 'L' then
                        case TAXAUDIT_TOPD
                           when 1 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P2))
                           when 2 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P3))
                           when 3 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P4))
                           when 4 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P5))
                           when 5 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P6))
                           when 6 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P7))
                           when 7 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P8))
                           when 8 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P9))
                           when 9 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P10))
                           when 10 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P11))
                           when 11 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P12))
                           when 12 then
                                    case NO_OF_PERIODS   when 12 then dateadd(day,-1,ENDDATE_P1)
                                                   when 13 then dateadd(day,-1,dateadd(year,-1,ENDDATE_P13))
                                    end
                           when 13 then dateadd(day,-1,ENDDATE_P1)

                        end
end
as VAT_RETURN_PERIOD_END_DATE

,case TAXAUDIT_FROMYEAR when 'N' then
                        case TAXAUDIT_FROMPD
                           when 1 then dateadd(year,1,ENDDATE_P1)
                            when 2 then dateadd(year,1,ENDDATE_P2)
                            when 3 then dateadd(year,1,ENDDATE_P3)
                            when 4 then dateadd(year,1,ENDDATE_P4)
                            when 5 then dateadd(year,1,ENDDATE_P5)
                            when 6 then dateadd(year,1,ENDDATE_P6)
                            when 7 then dateadd(year,1,ENDDATE_P7)
                            when 8 then dateadd(year,1,ENDDATE_P8)
                            when 9 then dateadd(year,1,ENDDATE_P9)
                            when 10 then dateadd(year,1,ENDDATE_P10)
                            when 11 then dateadd(year,1,ENDDATE_P11)
                            when 12 then dateadd(year,1,ENDDATE_P12)
                            when 13 then dateadd(year,1,ENDDATE_P13)
                        end
                  when 'C' then
                        case TAXAUDIT_FROMPD
                           when 1 then ENDDATE_P1
                            when 2 then ENDDATE_P2
                            when 3 then ENDDATE_P3
                            when 4 then ENDDATE_P4
                            when 5 then ENDDATE_P5
                            when 6 then ENDDATE_P6
                            when 7 then ENDDATE_P7
                            when 8 then ENDDATE_P8
                            when 9 then ENDDATE_P9
                            when 10 then ENDDATE_P10
                            when 11 then ENDDATE_P11
                            when 12 then ENDDATE_P12
                            when 13 then ENDDATE_P13
                        end
                  when 'L' then
                        case TAXAUDIT_FROMPD
                           when 1 then dateadd(year,-1,ENDDATE_P1)
                            when 2 then dateadd(year,-1,ENDDATE_P2)
                            when 3 then dateadd(year,-1,ENDDATE_P3)
                            when 4 then dateadd(year,-1,ENDDATE_P4)
                            when 5 then dateadd(year,-1,ENDDATE_P5)
                            when 6 then dateadd(year,-1,ENDDATE_P6)
                            when 7 then dateadd(year,-1,ENDDATE_P7)
                            when 8 then dateadd(year,-1,ENDDATE_P8)
                            when 9 then dateadd(year,-1,ENDDATE_P9)
                            when 10 then dateadd(year,-1,ENDDATE_P10)
                            when 11 then dateadd(year,-1,ENDDATE_P11)
                            when 12 then dateadd(year,-1,ENDDATE_P12)
                            when 13 then dateadd(year,-1,ENDDATE_P13)
                        end
end
as VAT_RETURN_PERIOD_START_DATE


,DET_PRIMARY
,isnull(TAXAUDIT_REF,'') TAXAUDIT_REF
,TAXAUDIT_FROMYEAR
,TAXAUDIT_TOYEAR
,TAXAUDIT_FROMPD
,TAXAUDIT_TOPD

, LANG_REPORTS_R4.ACCOUNT_REP
, LANG_REPORTS_R4.AUDIT_NO_REP
, LANG_REPORTS_R4.DATE_TEXT_REP
, LANG_REPORTS_R4.NET_REP
, LANG_REPORTS_R4.PERIOD_REP
, LANG_REPORTS_R4.REFERENCE_REP
, LANG_REPORTS_R4.GROSS_REP
, LANG_REPORTS_R4.SALES_REP
, LANG_REPORTS_R4.SOP_ORDER_REP
, LANG_REPORTS_R4.PURCHASE_REP

, LANG_REPORTS_R5.TYPE_REP
, LANG_REPORTS_R5.TOTAL_REP
, LANG_REPORTS_R5.VALUE_REP

, LANG_REPORTS_R.LEDGER_REP
, LANG_REPORTS_R.CODETXT_REP
, LANG_REPORTS_R.NO_OF_TRANS_REP
, LANG_REPORTS_R.KEY_TXT_REP
, LANG_REPORTS_R.INVOICE_REP
, LANG_REPORTS_R.CREDIT_NOTE_REP
, LANG_REPORTS_R.NOMINAL_REP

, LANG_DEF2.POSTING_DATE
, LANG_DEF2.TRANSACTION_DATE

, LANG_MAINMENUS3.SYS_VAT_RETURN

, SYS_DATAINFO.HOME_TAXNAME
, SYS_DATAINFO.HOME_CURR_SYMBL
, SYS_DATAINFO.COMPANY_NAME
, SYS_DATAINFO.SALES_PERIOD
, SYS_DATAINFO.PURCHASE_PERIOD
, SYS_DATAINFO.NOMINAL_PERIOD

from SL_PL_NL_DETAIL
join SYS_VATCONTROL with(nolock) on DET_VATCODE  = VAT_CODE
left outer join NL_TRANSACTIONS on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))
inner join SYS_TAX_AUDIT On TAXAUDIT_PRIMARY = DET_VAT_RETURN_PRIMARY
left outer join PL_TRANSACTIONS on PT_HEADER_KEY = DET_HEADER_KEY
left outer join SL_TRANSACTIONS on ST_HEADER_KEY = DET_HEADER_KEY

join SYS_DATAINFO2 on SYS_PRIMARY_2 = 1
join SYS_DATAINFO on SYS_PRIMARY = 1
inner join LANG_REPORTS_R4 on LANG_REPORTS_R4.LANGCODE_REP4 = 'ENGLISH   '
inner join LANG_REPORTS_R5 on LANG_REPORTS_R5.LANGCODE_REP5 = LANG_REPORTS_R4.LANGCODE_REP4
inner join LANG_REPORTS_R on LANG_REPORTS_R4.LANGCODE_REP4 = LANG_REPORTS_R.LANGCODE_REP_1
inner join LANG_DEF2 on LANG_DEF2.LANGCODE_DEF2 = LANG_REPORTS_R.LANGCODE_REP_1
inner join LANG_MAINMENUS3 on LANG_MAINMENUS3.LANGCODE_MAIN3 = LANG_REPORTS_R.LANGCODE_REP_1


where (isnull(DET_VATCODE,'') != '')
  and (DET_BATCH_FLAG <> 1)
  and not(DET_GROSS = 0 and DET_CURR_GROSS = 0)
