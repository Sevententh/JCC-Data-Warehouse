create view AA_NL_RECJNL_BATCH_DETAIL_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_NL_JNL_BATCH_ENQUIRY_S
** Written:      
** Last Amended: 06/07/05 SRB, 01/09/05 NC
**
*/
as


select
 DET_PRIMARY as [PRIMARY]
,NT_PRIMARY as HEADER_PRIMARY
,case when isnull(DET_NOMINALDR,'') <> '' then DET_NOMINALDR
      when isnull(DET_NOMINALCR,'') <> '' then DET_NOMINALCR
      when isnull(DET_NOMINALVAT,'') <> '' then DET_NOMINALVAT end as NOMINAL_ACCOUNT
,case when isnull(DET_NOMINALDR,'') <> '' then nl1.N_PRIMARY
      when isnull(DET_NOMINALCR,'') <> '' then nl2.N_PRIMARY
      end as NOMINAL_PRIMARY
,case when isnull(DET_NOMINALDR,'') <> '' then dbo.AA_VALUE_DPS_F(DET_NETT) else 0 end as DEBIT_VALUE
,case when isnull(DET_NOMINALCR,'') <> '' then dbo.AA_VALUE_DPS_F(DET_NETT) else 0 end as CREDIT_VALUE
,DET_DATE 
,isnull(DET_JNL_LINEREF,'') as DET_JNL_LINEREF
,isnull(DET_DESCRIPTION,'') as DET_DESCRIPTION
,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE 
,isnull(DET_DIMENSION1,'') as DET_DIMENSION1
,isnull(DET_DIMENSION2,'') as DET_DIMENSION2
,isnull(DET_DIMENSION3,'') as DET_DIMENSION3

from NL_TRANSACTIONS
join SL_PL_NL_DETAIL with (index(DET_HEADER_KEY)) on DET_HEADER_KEY='N'+convert(varchar,convert(int,NT_PRIMARY))
left join NL_ACCOUNTS nl1 on nl1.NCODE = DET_NOMINALDR
left join NL_ACCOUNTS nl2 on nl2.NCODE = DET_NOMINALCR
where NT_RECUR_FLAG = 1 
and DET_BATCH_FLAG = 1
and (NT_POSTINGS_CNT + 1) < (NT_MAX_POSTINGS + 1) 



