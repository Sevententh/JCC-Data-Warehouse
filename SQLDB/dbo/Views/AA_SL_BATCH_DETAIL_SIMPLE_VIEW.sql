create view AA_SL_BATCH_DETAIL_SIMPLE_VIEW
/*
** Written:      
** Last Amended: 22/02/2005 SR, 11/07/2005 SH, 23/08/2005 SH
*/
as

select
 cast(DET_PRIMARY as int) as [PRIMARY]
,cast(ST_PRIMARY as int) as HEADER_PRIMARY
,isnull(DET_ANALYSIS,'') as DET_ANALYSIS
,isnull(sa.SANAME,'') as SANAME
,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
,isnull(CH_NAME,'') as CH_NAME
,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE 
,isnull(CC_NAME,'') as CC_NAME
,dbo.AA_VALUE_DPS_F(DET_NETT) * case when DET_TYPE in ('INV','ADR','JDR') then 1 else -1 end as DET_NETT 
,dbo.AA_VALUE_DPS_F(DET_VAT) * case when DET_TYPE in ('INV','ADR','JDR') then 1 else -1 end as DET_VAT 
,dbo.AA_VALUE_DPS_F(DET_GROSS) * case when DET_TYPE in ('INV','ADR','JDR') then 1 else -1 end as DET_GROSS 
,isnull(DET_VATCODE,'') as DET_VATCODE
,DET_DATE_PUTIN
,isnull(DET_BATCH_REF,'') as DET_BATCH_REF
,isnull(DET_DESCRIPTION,'') as DET_DESCRIPTION
,DET_DATE 
,DET_YEAR
,DET_PERIODNUMBR
,SA_PRIMARY

from SL_TRANSACTIONS
join SL_PL_NL_DETAIL with (index(DET_HEADER_KEY)) on DET_HEADER_KEY='S'+convert(varchar,convert(int,ST_PRIMARY))
left outer join CST_COSTHEADER on CH_CODE = DET_COSTHEADER
left outer join CST_COSTCENTRE on CC_CONCAT_CODES = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE 
left outer join SL_ANALYSIS sa on sa.SACODE = DET_ANALYSIS 
where ST_BATCH_FLAG = 1
and (ST_ORIGIN <> 'SO' or ST_SRV_STATUS=0)
