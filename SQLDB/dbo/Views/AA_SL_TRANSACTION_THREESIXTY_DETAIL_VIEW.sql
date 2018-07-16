create view AA_SL_TRANSACTION_THREESIXTY_DETAIL_VIEW
/*
** Returns transaction detail information to be used by the Three Sixty enquiry.
**
** Written     :  22/09/2005 SH
** Last Amended:  26/09/2006 DB
*/
as

select
   D.DET_PRIMARY                 as [PRIMARY]
,  D.DET_TYPE
,  isnull(D.DET_ANALYSIS,'')     as DET_ANALYSIS
,  isnull(S.SANAME,'')           as SANAME
,  isnull(D.DET_NOMINALDR,'')    as DET_NOMINALDR
,  isnull(N.NNAME,'')            as NOMINALDR_NAME
,  isnull(D.DET_NOMINALCR,'')    as DET_NOMINALCR
,  isnull(N1.NNAME,'')           as NOMINALCR_NAME
,  isnull(D.DET_NOMINALVAT,'')   as DET_NOMINALVAT
,  isnull(N2.NNAME,'')           as NOMINALVAT_NAME
,  isnull(D.DET_VATCODE,'')      as DET_VATCODE
,  isnull(D.DET_COSTHEADER,'')   as DET_COSTHEADER
,  isnull(P.CH_NAME,'')          as CH_NAME
,  isnull(D.DET_COSTCENTRE,'')   as DET_COSTCENTRE
,  isnull(C.CC_NAME,'')          as CC_NAME
,  isnull(D1.DET_ANALYSIS,'')    as STOCK_ANALYSIS
,  isnull(S1.SANAME,'')          as STOCK_ANALYSIS_NAME
,  isnull(D1.DET_NOMINALDR,'')   as STOCK_NOMINALDR
,  isnull(N3.NNAME,'')           as STOCK_NOMINALDR_NAME
,  isnull(D2.DET_NOMINALCR,'')   as STOCK_NOMINALCR
,  isnull(N4.NNAME,'')           as STOCK_NOMINALCR_NAME
   from
      SL_PL_NL_DETAIL D
         left join SL_ANALYSIS      S  on       S.SACODE          = D.DET_ANALYSIS
         left join NL_ACCOUNTS      N  on       N.NCODE           = D.DET_NOMINALDR
         left join NL_ACCOUNTS      N1 on       N1.NCODE          = D.DET_NOMINALCR
         left join NL_ACCOUNTS      N2 on       N2.NCODE          = D.DET_NOMINALVAT
         left join CST_COSTHEADER   P  on       P.CH_CODE         = D.DET_COSTHEADER
         left join CST_COSTCENTRE   C  on       C.CC_CODE         = D.DET_COSTCENTRE
                                          and   C.CC_COPYHEADER   = P.CH_CODE
         left join SL_PL_NL_DETAIL  D1 on       D1.DET_ORDER_LINK = D.DET_ORDER_LINK
                                          and   D1.DET_TYPE       = 'JNL'
                                          and   D1.DET_ORIGIN     in
                                                                  (
                                                                     'S'
                                                                  ,  'SO'
                                                                  ,  'NSO'
                                                                  ,  'NSC'
                                                                  ,  'NKO'
                                                                  ,  'NCI'    -- Costing Income                                  (Not WIP)      - Income Analysis          (SL)
                                                                  ,  'NCUU'   -- Transaction un-flagged as unrecoverable         (in to WIP)    - Transfer of WIP Analysis (SL) inverted
                                                                  ,  'NCCRW'  -- Transaction flagged as correct release from WIP (in to WIP)    - Transfer of WIP Analysis (SL) inverted
                                                                  ,  'NCU'    -- Transaction flagged as unrecoverable            (out of WIP)   - Transfer of WIP Analysis (SL)
                                                                  ,  'NCRW'   -- Transaction flagged as released from WIP        (out of WIP)   - Transfer of WIP Analysis (SL)
                                                                  )
                                          and   isnull(D1.DET_NOMINALDR,'') <> ''
                                          and   isnull(D.DET_ORDER_LINK,0) > 0
         left join SL_ANALYSIS      S1 on       S1.SACODE         = D1.DET_ANALYSIS
         left join NL_ACCOUNTS      N3 on       N3.NCODE          = D1.DET_NOMINALDR
         left join SL_PL_NL_DETAIL  D2 on       D2.DET_ORDER_LINK = D.DET_ORDER_LINK
                                          and   D2.DET_TYPE       = 'JNL'
                                          and   D2.DET_ORIGIN     in
                                                                  (
                                                                     'S'
                                                                  ,  'SO'
                                                                  ,  'NSO'
                                                                  ,  'NSC'
                                                                  ,  'NKO'
                                                                  ,  'NCI'    -- Costing Income                                  (Not WIP)      - Income Analysis          (SL)
                                                                  ,  'NCUU'   -- Transaction un-flagged as unrecoverable         (in to WIP)    - Transfer of WIP Analysis (SL) inverted
                                                                  ,  'NCCRW'  -- Transaction flagged as correct release from WIP (in to WIP)    - Transfer of WIP Analysis (SL) inverted
                                                                  ,  'NCU'    -- Transaction flagged as unrecoverable            (out of WIP)   - Transfer of WIP Analysis (SL)
                                                                  ,  'NCRW'   -- Transaction flagged as released from WIP        (out of WIP)   - Transfer of WIP Analysis (SL)
                                                                  )
                                          and   isnull(D2.DET_NOMINALCR,'') <> ''
                                          and   isnull(D.DET_ORDER_LINK,0) > 0
         left join NL_ACCOUNTS      N4 on       N4.NCODE          = D2.DET_NOMINALCR