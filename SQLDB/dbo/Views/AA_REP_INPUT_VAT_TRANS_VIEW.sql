CREATE VIEW AA_REP_INPUT_VAT_TRANS_VIEW
AS
/*
** Written     :  07/10/2005 RV
** Last Amended:  10/10/2005 RV, 14/08/2009 CC
** Comments    :  Returns Input VAT transactions for crystal reports
**
** Used by     :  Input Tax by Nominal Code.rpt
**                Large Input Tax Transactions.rpt
*/
select
 DET_VATCODE as VATCODE
,VAT_RATE as VAT_RATE_PERCENT
,case
      when substring(DET_ORIGIN,1,1) = 'S' then substring(DET_NOMINALCR,1,15)
      when substring(DET_ORIGIN,1,1) = 'P' then substring(DET_NOMINALDR,1,15)
      when substring(DET_ORIGIN,1,1) = 'N' then case when isnull(DET_NOMINALDR,'') <> '' then DET_NOMINALDR
                                                     else isnull(DET_NOMINALCR,'') end
 end DET_ACCOUNT
,DET_HEADER_REF
,DET_DATE
,DET_TYPE
,DET_ORIGIN
,DET_NOM_YEAR
,DET_NOM_PERIOD
,DET_NOM_PERSORT
,DET_VAT_RETURN_PRIMARY
,DET_DESCRIPTION
,DET_HEADER_KEY
,DET_ANALYSIS
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
,'ENGLISH' As LANGUAGE_LINK
,DET_VAT_RATE as TRAN_VAT_RATE_PERCENT

from SL_PL_NL_DETAIL
join SYS_VATCONTROL on VAT_CODE = DET_VATCODE
left outer join NL_TRANSACTIONS on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))
left outer join SYS_TAX_AUDIT On TAXAUDIT_PRIMARY = DET_VAT_RETURN_PRIMARY
where (isnull(DET_VATCODE,'') != '')
  and (DET_BATCH_FLAG <> 1)
  and not(DET_GROSS = 0 and DET_CURR_GROSS = 0)
  and
   (
    ((len(DET_NOMINALDR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG = 1 or NT_RECUR_FLAG = 0))
   Or ((len(DET_NOMINALCR) <> 0) and (substring(DET_ORIGIN,1,1) = 'N') and (DET_RECUR_FLAG <> 1 and NT_RECUR_FLAG = 1))
   Or ((DET_TYPE = 'INV') and (substring(DET_ORIGIN,1,1) = 'P'))
   Or ((DET_TYPE = 'CRN') and (substring(DET_ORIGIN,1,1) = 'P'))
   )
