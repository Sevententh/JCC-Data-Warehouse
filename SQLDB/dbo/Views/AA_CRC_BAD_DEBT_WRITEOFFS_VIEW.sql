create view AA_CRC_BAD_DEBT_WRITEOFFS_VIEW
/*
** This View returns columns used in the Credit Control Bad Debts Written Off Report
** Written  :  26/9/07chw
** Amended  :  28/9/07chw,10/10/07chw, 16/10/07 NC, 17/10/07 NC, 6/12/07chw
*/

as

select 
  -- Search Fields - Use the Values from the Invoice Transaction
 max(InvoicePrimary)               InvoicePrimary
,max(InvoiceYear)                  InvoiceYear
,max(InvoicePeriod)                InvoicePeriod
,max(InvoiceValue)                 InvoiceValue
,max(InvoiceCurrValue)             InvoiceCurrValue
,max(InvoiceDatePosted)            InvoiceDatePosted
,max(InvoiceUserPutIn)             InvoiceUserPutIn
,max(InvoiceHeaderRef)             InvoiceHeaderRef
,max(InvoiceUserSort1)             InvoiceUserSort1
,max(InvoiceUserSort2)             InvoiceUserSort2
,max(InvoiceUserSort3)             InvoiceUserSort3

-- Search and/or Report Fields
,max(ST_COPYCUST)                   ST_COPYCUST
,max(CUNAME)                        CUNAME
,max(CUSORT)                        CUSORT
,max(ST_CURRENCYCODE)               ST_CURRENCYCODE
,max(WriteOffHeaderRef)             WriteOffHeaderRef

-- Report Fields
,max(ST_PRIMARY)                    ST_PRIMARY
,max(ST_TRANTYPE)                   ST_TRANTYPE
,max(ST_DATE)                       ST_DATE
,max(ST_DATE_PUTIN)                 ST_DATE_PUTIN
,max(ST_YEAR)                       ST_YEAR
,max(ST_PERIODNUMBER)               ST_PERIODNUMBER
,max(ST_HEADER_REF)                 ST_HEADER_REF
,max(ST_NETT)                       ST_NETT
,max(ST_VAT)                        ST_VAT
,max(ST_GROSS)                      ST_GROSS
,max(ST_CURR_VALU)                  ST_CURR_VALU
,max(DET_NETT)                      DET_NETT
,max(DET_VAT)                       DET_VAT
,max(DET_GROSS)                     DET_GROSS
,max(DET_CURR_GROSS)                DET_CURR_GROSS
,max(DET_VATCODE)                   DET_VATCODE
,max(DET_PRIMARY)                   DET_PRIMARY
,max(DET_VAT_RETURN_PRIMARY)        DET_VAT_RETURN_PRIMARY
,max(DET_CURR_CODE)                 DET_CURR_CODE
-- Transaction Dummy Sort Field
,case when max(ST_TRANTYPE)='INV'then -1 else 0 end   TranSortField --Sorting on this after BadDebtPrimary always puts the Invoice first


from SL_ALLOC_HISTORY with (nolock)
   inner join SL_TRANSACTIONS  with (nolock) ON ST_HEADER_KEY=S_AL_HEADER_KEY 
   inner join SL_ACCOUNTS      with (nolock) ON ST_COPYCUST=CUCODE
   inner join SL_PL_NL_DETAIL  with (nolock) ON ST_HEADER_KEY=DET_HEADER_KEY 
 
 inner join 
 
(select ih1.S_AL_REFERENCE       AllocReference
,it.ST_COPYCUST                  Customer
,it.ST_PRIMARY                   InvoicePrimary
,it.ST_YEAR                      InvoiceYear
,it.ST_PERIODNUMBER              InvoicePeriod
,it.ST_GROSS                     InvoiceValue
,it.ST_CURR_VALU                 InvoiceCurrValue
,it.ST_DATE                      InvoiceDatePosted
,it.ST_USER_PUTIN                InvoiceUserPutIn
,it.ST_HEADER_REF                InvoiceHeaderRef
,it.ST_USER1                     InvoiceUserSort1
,it.ST_USER2                     InvoiceUserSort2
,it.ST_USER3                     InvoiceUserSort3
,wt.ST_HEADER_REF                WriteOffHeaderRef

from SL_TRANSACTIONS it
   inner join SL_ALLOC_HISTORY ih1 with (nolock) on it.ST_HEADER_KEY=ih1.S_AL_HEADER_KEY
   inner join SL_ALLOC_HISTORY ih2 with (nolock) on it.ST_HEADER_KEY=ih2.S_AL_HEADER_KEY and ih2.S_AL_REFERENCE<>'0'
   inner join SL_ALLOC_HISTORY wh  with (nolock) on wh.S_AL_REFERENCE=ih2.S_AL_REFERENCE
   inner join SL_TRANSACTIONS wt   with (nolock) on wt.ST_HEADER_KEY=wh.S_AL_HEADER_KEY
where ih1.S_AL_REFERENCE<>'0'
   and it.ST_WRITE_OFF_STATUS in (1,3)
   and it.ST_TRANTYPE='INV'
   and wt.ST_TRANTYPE<>'INV'
   and wt.ST_WRITE_OFF_STATUS = 1
) WriteOffInvoices

on AllocReference=S_AL_REFERENCE and Customer=ST_COPYCUST 

where (ST_TRANTYPE not in ('ADR','ACR') or ST_WRITE_OFF_STATUS=1) -- exclude adjustments unless they are bad debt adjustments
 and DET_ANALYSIS<>'' and (isnull(ST_WRITE_OFF_STATUS,0)<>2)
group by DET_PRIMARY




