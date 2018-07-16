create view  AA_CB_RECONCILE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CB_RECONCILE_LIST_S
** Written:       13/01/2005 SH
** Last Amended:  13/06/2005 SH, 16/06/2005 NC, 22/06/2005 NC, 10/11/2006 SH
**
*/
as

select
   D.DET_PRIMARY                                         as [PRIMARY]
,  D.DET_HEADER_KEY
,  D.DET_NOMINALDR                                       as NCODE
,  D.DET_DATE
,  D.DET_HEADER_REF
,  case substring(D.DET_ORIGIN, 1, 1)
      when 'S' then
         isnull(C.CUCODE, '')
      when 'P' then
         isnull(S.SUCODE, '')
      else
         ''
   end                                                   as ACCOUNT_CODE
,  case substring(D.DET_ORIGIN, 1, 1)
      when 'S' then
         isnull( C.CUNAME, '' )
      when 'P' then
         isnull( S.SUNAME, '' )
      else
         ''
   end                                                   as ACCOUNT_NAME
,  substring(D.DET_ORIGIN, 1, 1)                         as LEDGER
,  isnull(D.DET_RECON_REF, '')                           as DET_RECON_REF
,  D.DET_NOM_YEAR
,  D.DET_NOM_PERIOD
,  D.DET_CURR_CODE
,  case D.DET_RECONCILED
      when 1 then
         1
      else
         0
   end                                                   as RECONCILED
,  D.DET_RECONCILED
,  case when DET_GROSS <> 0
          then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when -DET_GROSS>0 then -DET_GROSS else 0 end) else (case when DET_GROSS>0 then DET_GROSS else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when -DET_NETT>0 then -DET_NETT else 0 end) else (case when DET_NETT>0 then DET_NETT else 0 end)
                                                            end
                                              when 'N' then (case when DET_NETT>0 then DET_NETT else 0 end)
               else 0 end
     else 0
     end                                                 as PAID_IN
,  case when DET_GROSS <> 0
          then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when DET_GROSS>0 then DET_GROSS else 0 end) else (case when -DET_GROSS>0 then -DET_GROSS else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when DET_NETT>0 then DET_NETT else 0 end) else (case when -DET_NETT>0 then -DET_NETT else 0 end)
                                                            end
                                              when 'N' then (case when -DET_NETT>0 then -DET_NETT else 0 end)
               else 0 end
     else 0
     end                                                 as PAID_OUT
,  case when DET_CURR_NETT <> 0
          then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end) else (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
                                                            end
                                              when 'N' then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
               else 0 end
     else 0
     end                                                 as PAID_IN_C
,  case when DET_CURR_NETT <> 0
          then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end) else (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
                                                            end
                                              when 'N' then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
               else 0 end
     else 0
   end                                                   as PAID_OUT_C
,  case
      when substring(D.DET_ORIGIN, 1, 1) = 'S' then
         ST.ST_DESCRIPTION
      when substring(D.DET_ORIGIN, 1, 1) = 'P' then
         PT.PT_DESCRIPTION
      when substring(D.DET_ORIGIN, 1, 1) = 'N' then
         NT.NT_DESCRIPTION
      else
         ''
   end                                                   as HEADER_DESCRIPTION
,  case
      when substring(D.DET_ORIGIN, 1, 1) = 'S' then
         ST.ST_BATCH_REF
      when substring(D.DET_ORIGIN, 1, 1) = 'P' then
         PT.PT_BATCH_REF
      when substring(D.DET_ORIGIN, 1, 1) = 'N' then
         NT.NT_BATCH_REF
      else
         ''
   end                                                   as BATCH_REFERENCE
,  D.DET_YEAR + case
                  when D.DET_PERIODNUMBR < 10 then
                     '0'
                  else
                     ''
                end
                +
                convert(varchar, D.DET_PERIODNUMBR)      as YEAR_PERIOD
,  substring(D.DET_ORIGIN, 1, 1)                         as ORIGIN
   from
      SL_PL_NL_DETAIL           D  with(index(DET_NOMINALDR))
      left join SL_ACCOUNTS     C  on           C.CUCODE                      = D.DET_ACCOUNT
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'S'
      left join PL_ACCOUNTS     S  on           S.SUCODE                      = D.DET_ACCOUNT
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'P'
      left join SL_TRANSACTIONS ST on           ST.ST_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'S'
      left join PL_TRANSACTIONS PT on           PT.PT_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'P'
      left join NL_TRANSACTIONS NT on           NT.NT_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'N'
where
         D.DET_BATCH_FLAG                 <> 1
   and   isnull(D.DET_NETT,      0) + 
         isnull(D.DET_CURR_NETT, 0) +
         isnull(D.DET_VAT,       0) +
         isnull(D.DET_CURR_TAX,  0)       <> 0
      
union all

select
   D.DET_PRIMARY                                         as [PRIMARY]
,  D.DET_HEADER_KEY
,  D.DET_NOMINALCR                                       as NCODE
,  D.DET_DATE
,  D.DET_HEADER_REF
,  case substring(D.DET_ORIGIN, 1, 1)
      when 'S' then
         isnull(C.CUCODE, '')
      when 'P' then
         isnull(S.SUCODE, '')
      else
         ''
   end                                                   as ACCOUNT_CODE
,  case substring(D.DET_ORIGIN, 1, 1)
      when 'S' then 
         isnull(C.CUNAME, '')
      when 'P' then
         isnull(S.SUNAME, '')
      else
         ''
   end                                                   as ACCOUNT_NAME
,  substring(D.DET_ORIGIN,1,1)                           as LEDGER
,  isnull(D.DET_RECON_REF, '')                           as DET_RECON_REF
,  D.DET_NOM_YEAR
,  D.DET_NOM_PERIOD
,  D.DET_CURR_CODE
,  case D.DET_RECONCILED
      when 1 then
         1
      else
         0
   end                                                   as RECONCILED
,  D.DET_RECONCILED
,  case when DET_GROSS <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_NETT>0 then -DET_NETT else 0 end) else (case when DET_NETT>0 then DET_NETT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                               then (case when -DET_GROSS>0 then -DET_GROSS else 0 end) else (case when DET_GROSS>0 then DET_GROSS else 0 end)
                                                          end
                                            when 'N' then (case when -DET_NETT>0 then -DET_NETT else 0 end)
             else 0 end
        else 0
        end                                              as PAID_IN
,  case when DET_GROSS <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                               then (case when DET_NETT>0 then DET_NETT else 0 end) else (case when -DET_NETT>0 then -DET_NETT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                               then (case when DET_GROSS>0 then DET_GROSS else 0 end) else (case when -DET_GROSS>0 then -DET_GROSS else 0 end)
                                                          end
                                            when 'N' then (case when DET_NETT>0 then DET_NETT else 0 end)
             else 0 end
        else 0
        end                                              as PAID_OUT
,  case when DET_CURR_NETT <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end) else (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                               then (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                          end
                                            when 'N' then (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
             else 0 end
        else 0
        end                                              as PAID_IN_C
,  case when DET_CURR_NETT <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                               then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end) else (case when -DET_CURR_NETT>0 then -DET_CURR_NETT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                               then (case when (DET_CURR_NETT + DET_CURR_TAX)>0 then (DET_CURR_NETT + DET_CURR_TAX) else 0 end) else (case when -(DET_CURR_NETT + DET_CURR_TAX)>0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end)
                                                          end
                                            when 'N' then (case when DET_CURR_NETT>0 then DET_CURR_NETT else 0 end)
             else 0 end
        else 0
        end                                              as PAID_OUT_C
,  case
      when substring(D.DET_ORIGIN, 1, 1) = 'S' then
         ST.ST_DESCRIPTION
      when substring(D.DET_ORIGIN, 1, 1) = 'P' then
         PT.PT_DESCRIPTION
      when substring(D.DET_ORIGIN, 1, 1) = 'N' then
         NT.NT_DESCRIPTION
      else
         ''
   end                                                   as HEADER_DESCRIPTION
,  case
      when substring(D.DET_ORIGIN, 1, 1) = 'S' then
         ST.ST_BATCH_REF
      when substring(D.DET_ORIGIN, 1, 1) = 'P' then
         PT.PT_BATCH_REF
      when substring(D.DET_ORIGIN, 1, 1) = 'N' then
         NT.NT_BATCH_REF
      else
         ''
   end                                                   as BATCH_REFERENCE
,  D.DET_YEAR + case
                  when D.DET_PERIODNUMBR < 10 then
                     '0'
                  else
                     ''
                end
                +
                convert(varchar, D.DET_PERIODNUMBR)      as YEAR_PERIOD
,  substring(D.DET_ORIGIN, 1, 1)                         as ORIGIN
   from
      SL_PL_NL_DETAIL           D  with(index(DET_NOMINALCR))
      left join SL_ACCOUNTS     C  on           C.CUCODE                      = D.DET_ACCOUNT
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'S'
      left join PL_ACCOUNTS     S  on           S.SUCODE                      = D.DET_ACCOUNT
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'P'
      left join SL_TRANSACTIONS ST on           ST.ST_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'S'
      left join PL_TRANSACTIONS PT on           PT.PT_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'P'
      left join NL_TRANSACTIONS NT on           NT.NT_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'N'
   where
            D.DET_BATCH_FLAG                 <> 1
      and   isnull(D.DET_NETT,      0) + 
            isnull(D.DET_CURR_NETT, 0) + 
            isnull(D.DET_VAT,       0) + 
            isnull(D.DET_CURR_TAX,  0)       <> 0

union all

select
   D.DET_PRIMARY                                         as [PRIMARY]
,  D.DET_HEADER_KEY
,  D.DET_NOMINALVAT                                      as NCODE
,  D.DET_DATE
,  D.DET_HEADER_REF
,  case substring(D.DET_ORIGIN, 1, 1)
      when 'S' then
         isnull(C.CUCODE, '')
      when 'P' then
         isnull(S.SUCODE, '')
      else
         ''
   end                                                   as ACCOUNT_CODE
,  case substring(D.DET_ORIGIN, 1, 1)
      when 'S' then
         isnull(C.CUNAME, '')
      when 'P' then 
         isnull(S.SUNAME, '')
      else
         ''
   end                                                   as ACCOUNT_NAME
,  substring(D.DET_ORIGIN, 1, 1)                         as LEDGER
,  isnull(D.DET_RECON_REF, '')                           as DET_RECON_REF
,  D.DET_NOM_YEAR
,  D.DET_NOM_PERIOD
,  D.DET_CURR_CODE
,  case D.DET_RECONCILED
      when 1 then
         1
      else
         0
   end                                                   as RECONCILED
,  D.DET_RECONCILED
,  case when DET_VAT <> 0 
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_VAT>0 then -DET_VAT else 0 end) else (case when DET_VAT>0 then DET_VAT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE = 'CRN')
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                               then (case when -DET_VAT>0 then -DET_VAT else 0 end) else (case when DET_VAT>0 then DET_VAT else 0 end)
                                                          end
                                            else 0
             end
        else 0
        end                                              as PAID_IN
,  case when DET_VAT <> 0
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                               then (case when DET_VAT>0 then DET_VAT else 0 end) else (case when -DET_VAT>0 then -DET_VAT else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE = 'CRN')
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                               then (case when DET_VAT>0 then DET_VAT else 0 end) else (case when -DET_VAT>0 then -DET_VAT else 0 end)
                                                          end
                                            else 0
             end
        else 0
        end                                              as PAID_OUT
,  case when DET_CURR_NETT <> 0 
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                               then (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end) else (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE = 'CRN')
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                               then (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end) else (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end)
                                                          end
                                            else 0
             end
        else 0
        end                                              as PAID_IN_C
,  case when DET_CURR_NETT <> 0 
        then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                               then (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end) else (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end)
                                                          end
                                            when 'P' then case when ((DET_TYPE = 'CRN')
                                                                  or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                  or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                               then (case when DET_CURR_TAX>0 then DET_CURR_TAX else 0 end) else (case when -DET_CURR_TAX>0 then -DET_CURR_TAX else 0 end)
                                                          end
                                            else 0
             end
        else 0
        end                                              as PAID_OUT_C
,  case
      when substring(D.DET_ORIGIN, 1, 1) = 'S' then
         ST.ST_DESCRIPTION
      when substring(D.DET_ORIGIN, 1, 1) = 'P' then
         PT.PT_DESCRIPTION
      when substring(D.DET_ORIGIN, 1, 1) = 'N' then
         NT.NT_DESCRIPTION
      else
         ''
   end                                                   as HEADER_DESCRIPTION
,  case
      when substring(D.DET_ORIGIN, 1, 1) = 'S' then
         ST.ST_BATCH_REF
      when substring(D.DET_ORIGIN, 1, 1) = 'P' then
         PT.PT_BATCH_REF
      when substring(D.DET_ORIGIN, 1, 1) = 'N' then
         NT.NT_BATCH_REF
      else
         ''
   end                                                   as BATCH_REFERENCE
,  D.DET_YEAR + case
                  when D.DET_PERIODNUMBR < 10 then
                     '0'
                  else
                     ''
                end
                +
                convert(varchar, D.DET_PERIODNUMBR)      as YEAR_PERIOD
,  substring(D.DET_ORIGIN, 1, 1)                         as ORIGIN
   from
      SL_PL_NL_DETAIL           D  with(index(DET_NOMINALVAT))
      left join SL_ACCOUNTS     C  on           C.CUCODE                      = D.DET_ACCOUNT
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'S'
      left join PL_ACCOUNTS     S  on           S.SUCODE                      = D.DET_ACCOUNT
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'P'
      left join SL_TRANSACTIONS ST on           ST.ST_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'S'
      left join PL_TRANSACTIONS PT on           PT.PT_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'P'
      left join NL_TRANSACTIONS NT on           NT.NT_PRIMARY                 = substring(D.DET_HEADER_KEY, 2, 10)
                                          and   substring(D.DET_ORIGIN, 1, 1) = 'N'
   where
            D.DET_BATCH_FLAG                 <> 1
      and   isnull(D.DET_NETT,      0) + 
            isnull(D.DET_CURR_NETT, 0) + 
            isnull(D.DET_VAT,       0) + 
            isnull(D.DET_CURR_TAX,  0)       <> 0