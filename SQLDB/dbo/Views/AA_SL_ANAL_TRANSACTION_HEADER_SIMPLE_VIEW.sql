create view AA_SL_ANAL_TRANSACTION_HEADER_SIMPLE_VIEW
/*
**
** Written     :
** Last Amended:  21/02/2005 SR, 08/03/2005 SR, 11/07/2005 SH, 23/08/2005 SH, 13/10/2005 NC, 20/09/2006 DB, 20/07/07 NC
**
*/
as

select
   cast(DET_PRIMARY as int)            as [PRIMARY]
,  DET_ANALYSIS
,  isnull(SANAME,'')                   as SANAME
,  DET_DATE
,  DET_YEAR
,  DET_PERIODNUMBR
,  DET_TYPE
,  cast(DET_BATCH_FLAG as bit)         as DET_BATCH_FLAG
,  isnull(DET_ACCOUNT,'')              as CUSTOMER
,  isnull(DET_HEADER_REF,'')           as DET_HEADER_REF
,  isnull(OD_ORDER_NUMBER,'')          as OD_ORDER_NUMBER
,  dbo.AA_VALUE_DPS_F(DET_NETT)        * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_VAT)         * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_GROSS)       * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_UNALLOCATED) * (case when DET_TYPE in ('INV','ADR','JNL') then 1 else -1 end * case when DET_ANALTYPE in ('B','D') then -1 else 1 end * (case when DET_ORIGIN='NSC' then -1 else 1 end)) as DET_UNALLOCATED
,  DET_HEADER_KEY
,  DET_PRIMARY
,  DET_DATE_PUTIN as DATE_PUTIN
,  cast
   (
      substring
      (
         DET_HEADER_KEY
      ,  2
      ,  len(DET_HEADER_KEY)-1
      )
      as int
   )                                   as HEADER_PRIMARY

,  isnull(CU_PRIMARY,0)                as CU_PRIMARY
,  isnull(SA_PRIMARY,0)                as SA_PRIMARY

,  DET_STOCK_CODE  -- required for search
,  DET_PRICE_CODE  -- required for search
,  DET_COSTHEADER  -- required for search
,  DET_COSTCENTRE  -- required for search
,  DET_DIMENSION1  -- required for search
,  DET_DIMENSION2  -- required for search
,  DET_DIMENSION3  -- required for search
,  DET_RECON_REF                       as STATEMENT_REFERENCE
   from
      SL_PL_NL_DETAIL
         inner join SL_ANALYSIS  on SACODE      =        DET_ANALYSIS
         left  join ORD_DETAIL   on OD_PRIMARY  =        DET_ORDER_LINK
         left  join SL_ACCOUNTS  on CUCODE      =        DET_ACCOUNT
                                                   and   isnull(CUCODE,'') <> ''
   where
            DET_ORIGIN  in
                        (
                           'S'
                        ,  'SO'
                        ,  'NSO'
                        ,  'NSC'
                        ,  'NKO'
                        ,  'NCI'    -- Costing Income Transaction                      (Not WIP)      - Income Analysis (SL)
                        ,  'NCU'    -- Transaction flagged as unrecoverable            (out of WIP)   - WIP Analysis    (SL)
                        ,  'NCUU'   -- Transaction un-flagged as unrecoverable         (in to WIP)    - WIP Analysis    (SL)
                        ,  'NCRW'   -- Transaction flagged as released from WIP        (out of WIP)   - WIP Analysis    (SL)
                        ,  'NCCRW'  -- Transaction flagged as correct release from WIP (in to WIP)    - WIP Analysis    (SL)
                        )
      and   isnull(DET_NOMINALCR,'')<>''  -- This prevents both sides of the double entry of the stock journals from showing up.
      and   isnull(DET_ANALYSIS,'') <>''  -- avoids profiles and Assemblies