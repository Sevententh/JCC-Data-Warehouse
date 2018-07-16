CREATE VIEW AA_REP_SYS_VAT_RETURN_DET_VIEW
AS
/*
** Written     :  17/06/2005 DG
** Last Amended:  22/06/2005 DG, 22/06/05 NC,  23/06/05 RV, 24/06/2005 DG, 05/08/05 RV, 03/05/2006 RV
** Comments    :  Returns VAT Return data for crystal reports
**
** Used by     :  Non Cash VAT Transactions Report.rpt
*/
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
,DET_ECVAT_TYPE
,DET_EC_T_NATURE
,DET_TYPE
,DET_ORIGIN
,DET_NOM_YEAR
,DET_NOM_PERIOD
,DET_NOM_PERSORT
,DET_VAT_RETURN_PRIMARY
,DET_HEADER_KEY
,DET_TRI_RATE1
,DET_TRI_RATE2
,DET_CURR_RATE
,DET_CURR_CODE
,DET_COUNTRY_CDE
,dbo.AA_VALUE_DPS_F(case when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then DET_CURR_NETT
                         when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then -DET_CURR_NETT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'S')) then DET_CURR_NETT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'S')) then -DET_CURR_NETT
                when ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0)) then -DET_CURR_NETT
                         when ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1)) then DET_CURR_NETT
                         when ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'P')) then -DET_CURR_NETT
                         when ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'P')) then DET_CURR_NETT
                         else 0
end)  DET_CURR_NETT
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
,DET_PRIMARY
,isnull(TAXAUDIT_REF,'') TAXAUDIT_REF
,TAXAUDIT_FROMYEAR
,TAXAUDIT_TOYEAR
,TAXAUDIT_FROMPD
,TAXAUDIT_TOPD
,'ENGLISH   ' As LANGUAGE_LINK

from SL_PL_NL_DETAIL
join SYS_VATCONTROL on VAT_CODE = DET_VATCODE
left outer join NL_TRANSACTIONS on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))
left outer join SYS_TAX_AUDIT On TAXAUDIT_PRIMARY = DET_VAT_RETURN_PRIMARY
where (isnull(DET_VATCODE,'') != '')
  and (DET_BATCH_FLAG <> 1)
  and not(DET_GROSS = 0 and DET_CURR_GROSS = 0)