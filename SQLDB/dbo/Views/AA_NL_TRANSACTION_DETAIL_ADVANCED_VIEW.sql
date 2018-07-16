create view AA_NL_TRANSACTION_DETAIL_ADVANCED_VIEW
as
/* Header Primary key derived as a decimal(30,0) from concatenation as follows:- 
     Position   Description
           1    Header key ledger prefix enumerated as a number where 'S' = 1, 'P' = 2, 'N' = 3
        2-11    Header ledger primary padded with leading zeros up to 10 digits
       12-16    Transaction date as an integer (5 digits) 
          17    Nominal Year enumerated as a number where 'O' = 0, 'L' = 1, 'C' = 2, 'N' = 3
       18-19    Nominal Period padded with leading zeros up to 2 digits
       20-29    Nominal primary (up to 10 digits)

   Primary key derived as a decimal(11,0) from concatenation as follows:- 
     Position   Description
           1    NOMINAL_TYPE prefix plus 1 where 'DR' = 1, 'CR' = 2, 'VAT' = 3 
        2-11    DET_PRIMARY (up to 10 digits)

*/
select
 cast(convert(nvarchar,case when DET_NOMINALDR = nl.NCODE then 1 
                            when DET_NOMINALCR = nl.NCODE then 2 
                            when DET_NOMINALVAT = nl.NCODE then 3 end)
 + convert(nvarchar,d.DET_PRIMARY)
as decimal(11,0)) as [PRIMARY]

,cast(convert(nvarchar,case substring(d.DET_HEADER_KEY,1,1) when 'S' then 1 when 'P' then 2 when 'N' then 3 end) -- 1 digit
 + replicate('0',(10 - len(d.DET_HEADER_KEY) + 1)) + substring(d.DET_HEADER_KEY,2,len(d.DET_HEADER_KEY)-1) -- 10 digits
 + convert(nvarchar,convert(int,d.DET_DATE))    -- 5 digits
 + convert(nvarchar,500 + DET_NOM_PERSORT)      -- 3 digits
 + convert(nvarchar,nl.N_PRIMARY)               -- upto 10 digits
as decimal(30,0)) as HEADER_PRIMARY

,case
    when DET_NOMINALDR = nl.NCODE
    then
      case when DET_GROSS <> 0
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
        end
    when DET_NOMINALCR = nl.NCODE
    then
      case when DET_GROSS <> 0
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
        end
    when DET_NOMINALVAT = nl.NCODE
    then
      case when DET_VAT <> 0
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
        end
 end HOME_DEBIT

,case
    when DET_NOMINALDR = nl.NCODE
    then
      case when DET_GROSS <> 0
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
           end
    when DET_NOMINALCR = nl.NCODE
    then
      case when DET_GROSS <> 0
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
           end
    when DET_NOMINALVAT = nl.NCODE
    then
      case when DET_VAT <> 0
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
                                             else 0 end
           else 0
           end 
  end HOME_CREDIT

,case
    when DET_NOMINALDR = nl.NCODE
    then
      case when DET_CURR_NETT <> 0
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
           end
    when DET_NOMINALCR = nl.NCODE
    then
      case when DET_CURR_NETT <> 0
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
           end
    when DET_NOMINALVAT = nl.NCODE
    then
      case when DET_CURR_NETT <> 0 
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
           end
    end CURRENCY_DEBIT

,case
    when DET_NOMINALDR = nl.NCODE
    then
      case when DET_CURR_NETT <> 0
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
           end
    when DET_NOMINALCR = nl.NCODE
    then
      case when DET_CURR_NETT <> 0
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
           end
    when DET_NOMINALVAT = nl.NCODE
    then
      case when DET_CURR_NETT <> 0 
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
           end
  end CURRENCY_CREDIT

,case
    when DET_NOMINALDR = nl.NCODE
    then
     case when DET_NETT_BASE2 <> 0
          then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                        or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                 then (case when -(DET_GROSS_BASE2)>0 then -(DET_GROSS_BASE2) else 0 end) else (case when (DET_GROSS_BASE2)>0 then (DET_GROSS_BASE2) else 0 end)
                                                            end
                                              when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                        or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                 then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end) else (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
                                                            end
                                              when 'N' then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
               else 0 end
     else 0
     end
    when DET_NOMINALCR = nl.NCODE
    then
      case when DET_GROSS_BASE2 <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                                  then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end) else (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                                  then (case when -DET_GROSS_BASE2>0 then -DET_GROSS_BASE2 else 0 end) else (case when DET_GROSS_BASE2>0 then DET_GROSS_BASE2 else 0 end)
                                                             end
                                               when 'N' then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                else 0 end
           else 0
           end
    when DET_NOMINALVAT = nl.NCODE
    then
      case when DET_CURR_NETT <> 0 
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'S')))
                                                                  then (case when -DET_VAT_BASE2>0 then -DET_VAT_BASE2 else 0 end) else (case when DET_VAT_BASE2>0 then DET_VAT_BASE2 else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE = 'CRN')
                                                                     or (DET_TYPE = 'ADR' and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE = 'ACR' and (DET_ANALTYPE<>'P')))
                                                                  then (case when -DET_VAT_BASE2>0 then -DET_VAT_BASE2 else 0 end) else (case when DET_VAT_BASE2>0 then DET_VAT_BASE2 else 0 end)
                                                             end
                                               else 0
                end
           else 0
           end
  end BASE2_DEBIT

,case
    when DET_NOMINALDR = nl.NCODE
    then
      case when DET_NETT_BASE2 <> 0
             then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE = 'S'))
                                                                                           or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE <> 'S')))
                                                                    then (case when (DET_GROSS_BASE2)>0 then (DET_GROSS_BASE2) else 0 end) else (case when -(DET_GROSS_BASE2)>0 then -(DET_GROSS_BASE2) else 0 end)
                                                               end
                                                 when 'P' then case when ((DET_TYPE='CRN') or (DET_TYPE in ('ADR','JDR')and (DET_ANALTYPE = 'P'))
                                                                                           or (DET_TYPE in ('ACR','JCR')and (DET_ANALTYPE <> 'P')))
                                                                    then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end) else (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                                                               end
                                                 when 'N' then (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                  else 0 end
        else 0
        end
    when DET_NOMINALCR = nl.NCODE
    then
      case when DET_GROSS_BASE2 <> 0
           then case substring(DET_ORIGIN,1,1) when 'S' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE='S'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE<>'S')))
                                                                  then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end) else (case when -DET_NETT_BASE2>0 then -DET_NETT_BASE2 else 0 end)
                                                             end
                                               when 'P' then case when ((DET_TYPE in ('INV','PAY'))
                                                                     or (DET_TYPE in ('ACR','JCR') and (DET_ANALTYPE='P'))
                                                                     or (DET_TYPE in ('ADR','JDR') and (DET_ANALTYPE<>'P')))
                                                                  then (case when DET_GROSS_BASE2>0 then DET_GROSS_BASE2 else 0 end) else (case when -DET_GROSS_BASE2>0 then -DET_GROSS_BASE2 else 0 end)
                                                             end
                                               when 'N' then (case when DET_NETT_BASE2>0 then DET_NETT_BASE2 else 0 end)
                else 0 end
           else 0
           end
    when DET_NOMINALVAT = nl.NCODE
    then
      case when DET_CURR_NETT <> 0 
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
           end
    end BASE2_CREDIT

,cast(d.DET_PRIMARY as int) as DET_PRIMARY
,d.DET_ORIGIN
--Analysis
,coalesce(d.DET_ANALYSIS,'') as DET_ANALYSIS
,coalesce(case when d.DET_ORIGIN in ('S','SO') then sa.SA_PRIMARY
               when d.DET_ORIGIN in ('P','PO') then pa.PA_PRIMARY
               when d.DET_ORIGIN in ('NSO','NSC') then ksa.SA_PRIMARY
               when d.DET_ORIGIN in ('NPO','NPC') then kpa.PA_PRIMARY
               else '' end,'') as ANALYSIS_PRIMARY
,coalesce(case when d.DET_ORIGIN in ('S','SO') then sa.SANAME
               when d.DET_ORIGIN in ('P','PO') then pa.PANAME
               when d.DET_ORIGIN in ('NSO','NSC') then ksa.SANAME
               when d.DET_ORIGIN in ('NPO','NPC') then kpa.PANAME
               else '' end,'') as ANALYSIS_NAME
,coalesce(d.DET_ANALTYPE,'') as DET_ANALTYPE
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then oh.OH_ACCOUNT_ORDER
               when d.DET_ORIGIN in ('PO','NPO','NPC') then poh.POH_ACCOUNT
               else '' end,'') as ORDER_ACCOUNT
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then oa.CUNAME
               when d.DET_ORIGIN in ('PO','NPO','NPC') then poa.SUNAME
               else '' end,'') as ORDER_ACCOUNT_NAME
,coalesce(oh.OH_ACCOUNT_DELIVERY,'') as DELIVERY_ACCOUNT
,coalesce(da.CUNAME,'') as DELIVERY_ACCOUNT_NAME
,coalesce(d.DET_ACCOUNT,'') as INVOICE_ACCOUNT
,coalesce(case when d.DET_ORIGIN in ('S','SO','NSO','NSC') then sl.CUNAME
               when d.DET_ORIGIN in ('P','PO','NPO','NPC') then pl.SUNAME
               else '' end,'') as INVOICE_ACCOUNT_NAME
,coalesce(d.DET_NOMINALDR,'') as NOMINALDR
,coalesce(ndr.NNAME,'') as NOMINALDR_NAME
,coalesce(d.DET_NOMINALCR,'') as NOMINALCR
,coalesce(ncr.NNAME,'') as NOMINALCR_NAME
,coalesce(d.DET_NOMINALVAT,'') as NOMINALVAT
,coalesce(nvt.NNAME,'') as NOMINALVAT_NAME
,d.DET_VATCODE
,coalesce(d.DET_COSTHEADER,'') as DET_COSTHEADER
,coalesce(ch.CH_NAME,'') as PROJECT_NAME
,coalesce(d.DET_COSTCENTRE,'') as DET_COSTCENTRE
,coalesce(cc.CC_NAME,'') as COSTCENTRE_NAME
,coalesce(d.DET_CHEQUE_PAYEE,'') as DET_CHEQUE_PAYEE
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then od.OD_STOCK_ANALYSIS
               when d.DET_ORIGIN in ('PO','NPO','NPC') then pod.POD_STOCK_ANALYSIS
               else '' end,'') as STOCK_ANALYSIS
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then ksa.SANAME
               when d.DET_ORIGIN in ('PO','NPO','NPC') then kpa.PANAME
               else '' end,'') as STOCK_ANALYSIS_NAME
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then kdr.NCODE
               when d.DET_ORIGIN in ('PO','NPO','NPC') then kdr1.NCODE
               else '' end,'') as STOCK_NOMINALDR
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then kdr.NNAME
               when d.DET_ORIGIN in ('PO','NPO','NPC') then kdr1.NNAME
               else '' end,'') as STOCK_NOMINALDR_NAME
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then kcr.NCODE
               when d.DET_ORIGIN in ('PO','NPO','NPC') then kcr1.NCODE
               else '' end,'') as STOCK_NOMINALCR
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then kcr.NNAME
               when d.DET_ORIGIN in ('PO','NPO','NPC') then kcr1.NNAME
               else '' end,'') as STOCK_NOMINALCR_NAME
--Product
,coalesce(d.DET_STOCK_CODE,'') + coalesce(d.DET_PRICE_CODE,'') as DET_STOCK_PRICE_CODE
,coalesce(stk.STKNAME,'') + coalesce(prc.PRNAME,'') as STOCK_PRICE_DESCRIPTION
,dbo.AA_PRICE_DPS_F(d.DET_COSTPRICE) as DET_COSTPRICE
,dbo.AA_QUANTITY_DPS_F(d.DET_QUANTITY) as DET_QUANTITY
--General
,coalesce(d.DET_JNL_LINEREF,'') as DET_JNL_LINEREF
,coalesce(d.DET_DESCRIPTION,'') as DET_DESCRIPTION
,d.DET_DATE as DET_DATE
,d.DET_HEADER_KEY as DET_HEADER_KEY -- needed for indexing
,d.DET_NOM_PERSORT as DET_NOM_PERSORT -- needed for indexing
,nl.NCODE as NCODE -- needed for indexing

,coalesce(d.DET_STKSORTKEY,'') as DET_STKSORTKEY
,coalesce(d.DET_STKSORTKEY1,'') as DET_STKSORTKEY1
,coalesce(d.DET_STKSORTKEY2,'') as DET_STKSORTKEY2
,coalesce(d.DET_STKSORTKEY3,'') as DET_STKSORTKEY3
,coalesce(case when d.DET_ORIGIN in ('SO','NSO','NSC') then OD_LOCATN
               when d.DET_ORIGIN in ('PO','NPO','NPC') then pod.POD_LOCATN
               else '' end,'') as SUB_ANALYSIS
,coalesce(d.DET_SERIALNO,'') as DET_SERIALNO
,coalesce(d.DET_DIMENSION1,'') as DET_DIMENSION1
,coalesce(d.DET_DIMENSION2,'') as DET_DIMENSION2
,coalesce(d.DET_DIMENSION3,'') as DET_DIMENSION3
,dbo.AA_VALUE_DPS_F(case when d.DET_ORIGIN = 'SO' then od.OD_LINEDISC
                         when d.DET_ORIGIN = 'PO' then pod.POD_LINEDISC
                         else '' end) as LINE_DISCOUNT
,dbo.AA_VALUE_DPS_F(case when d.DET_ORIGIN = 'SO' then oh.OH_DISC_TOTAL_P
                         when d.DET_ORIGIN = 'PO' then poh.POH_DISC_TOT_P
                         else '' end) as TOTAL_DISCOUNT
,case when d.DET_SUB_AUDIT_NO is null then '' 
      else convert(nvarchar,d.DET_SUB_AUDIT_NO) end as DET_SUB_AUDIT_NO
,coalesce(d.DET_RECON_REF,'') as DET_RECON_REF
--Currency
,d.DET_CURR_CODE
,dbo.AA_VALUE_DPS_F(d.DET_CURR_NETT) + dbo.AA_VALUE_DPS_F(d.DET_CURR_TAX) as CURR_GROSS
,dbo.AA_VALUE_DPS_F(d.DET_GROSS_BASE2) as DET_GROSS_BASE2
,dbo.AA_VALUE_DPS_F(d.DET_CURR_UNALOC) as DET_CURR_UNALOC
,d.DET_CURR_RATE
,d.DET_BASE2_RATE
,dbo.AA_VALUE_DPS_F(DET_L_DISCOUNT) as DET_L_DISCOUNT
,dbo.AA_VALUE_DPS_F(DET_CURR_L_DISC) as DET_CURR_L_DISC
--VAT
,dbo.AA_VALUE_DPS_F(d.DET_VAT) as DET_VAT
,dbo.AA_VALUE_DPS_F(d.DET_CURR_TAX) as DET_CURR_TAX
,dbo.AA_VALUE_DPS_F(d.DET_VAT_BASE2) as DET_VAT_BASE2
,dbo.AA_VALUE_DPS_F(vt.VAT_RATE) as VAT_RATE
,coalesce(d.DET_IMPEXP_CODE,'') as DET_IMPEXP_CODE
,coalesce(stk.STK_EC_COM_CODE,'') as EC_COM_CODE
,coalesce(case when d.DET_ORIGIN in ('S','SO') then st.ST_EC_DEL_TERMS
               when d.DET_ORIGIN in ('P','PO') then pt.PT_EC_DEL_TERMS
               else '' end,'') as EC_DELIVERY
,coalesce(case when d.DET_ORIGIN in ('S','SO') then st.ST_EC_T_MODE
               when d.DET_ORIGIN in ('P','PO') then pt.PT_EC_T_MODE
               else '' end,'') as EC_T_MODE
,coalesce(d.DET_EC_T_NATURE,'') as EC_T_NATURE
,coalesce(stk.STK_EC_ORIGIN,'') as STK_EC_ORIGIN
,coalesce(d.DET_ECVAT_TYPE,'') as DET_ECVAT_TYPE
,dbo.AA_VALUE_DPS_F(d.DET_PL_ACQ_TAX) as DET_PL_ACQ_TAX
,isnull(nt.NT_VAT_CONTRA,'') as NT_VAT_CONTRA
,isnull(nnl.NNAME,'') as VAT_CONTROLNAME
,coalesce(det2.DET_USRCHAR1,'') as DET_USRCHAR1
,coalesce(det2.DET_USRCHAR2,'') as DET_USRCHAR2
,coalesce(det2.DET_USRCHAR3,'') as DET_USRCHAR3
,coalesce(det2.DET_USRCHAR4,'') as DET_USRCHAR4
,convert(bit,det2.DET_USRFLAG1) as DET_USRFLAG1
,convert(bit,det2.DET_USRFLAG2) as DET_USRFLAG2
,det2.DET_USRDATE1 as DET_USRDATE1
,det2.DET_USRDATE2 as DET_USRDATE2
,dbo.AA_VALUE_DPS_F(det2.DET_USRNUM1) as DET_USRNUM1
,dbo.AA_VALUE_DPS_F(det2.DET_USRNUM2) as DET_USRNUM2

from SL_PL_NL_DETAIL d with (index(DET_HEADER_KEY))
    inner join NL_ACCOUNTS nl on (d.DET_NOMINALDR = nl.NCODE or d.DET_NOMINALCR = nl.NCODE or d.DET_NOMINALVAT = nl.NCODE)

-- joins to get Order details 
left outer join (ORD_DETAIL od join ORD_HEADER oh on oh.OH_ORDER_NUMBER = od.OD_ORDER_NUMBER
   join SL_ACCOUNTS oa on oa.CUCODE = oh.OH_ACCOUNT_ORDER
   join SL_ACCOUNTS da on da.CUCODE = oh.OH_ACCOUNT_DELIVERY
   )
   on od.OD_PRIMARY = d.DET_ORDER_LINK and d.DET_ORIGIN in ('SO','NSO','NSC') 

left outer join (SL_ANALYSIS ksa
       join NL_ACCOUNTS kdr on kdr.NCODE = ksa.SANOMINALDR
       join NL_ACCOUNTS kcr on kcr.NCODE = ksa.SANOMINALCR)
       on ksa.SACODE = od.OD_STOCK_ANALYSIS and d.DET_ORIGIN in ('SO','NSO','NSC')

left outer join (POP_DETAIL pod join POP_HEADER poh on poh.POH_ORDER_NUMBR = pod.POD_ORDER_NO
   join PL_ACCOUNTS poa on poa.SUCODE = poh.POH_ACCOUNT)
   on pod.POD_PRIMARY = d.DET_ORDER_LINK and d.DET_ORIGIN in ('PO','NPO','NPC') 

left outer join (PL_ANALYSIS kpa   
 join NL_ACCOUNTS kdr1 on kdr1.NCODE = kpa.PANOMINALDR
 join NL_ACCOUNTS kcr1 on kcr1.NCODE = kpa.PANOMINALCR)
on kpa.PACODE = pod.POD_STOCK_ANALYSIS and d.DET_ORIGIN in ('PO','NPO','NPC')  

left outer join SL_ANALYSIS sa
   on sa.SACODE = DET_ANALYSIS and d.DET_ORIGIN in ('S','SO','NSO','NSC','NKO')
left outer join PL_ANALYSIS pa
   on pa.PACODE = DET_ANALYSIS and d.DET_ORIGIN in ('P','PO','NPO','NPC','NKI')

left outer join NL_ACCOUNTS ndr on ndr.NCODE = d.DET_NOMINALDR
left outer join NL_ACCOUNTS ncr on ncr.NCODE = d.DET_NOMINALCR
left outer join NL_ACCOUNTS nvt on nvt.NCODE = d.DET_NOMINALVAT

left outer join SL_ACCOUNTS sl on sl.CUCODE = d.DET_ACCOUNT and d.DET_ORIGIN in ('S','SO','NSO','NSC')
left outer join PL_ACCOUNTS pl on pl.SUCODE = d.DET_ACCOUNT and d.DET_ORIGIN in ('P','PO','NPO','NPC')

-- joins to get Costing details 
left outer join (CST_COSTCENTRE cc join CST_COSTHEADER ch on ch.CH_CODE = cc.CC_COPYHEADER)
   on cc.CC_CONCAT_CODES = substring(d.DET_COSTHEADER + replicate(' ',10),1,10) + d.DET_COSTCENTRE
-- joins to get Product details
left outer join STK_STOCK stk on stk.STKCODE = d.DET_STOCK_CODE 
left outer join PRC_PRICE_RECS prc on prc.PRCODE = d.DET_PRICE_CODE 

left outer join SL_PL_NL_DETAIL2 det2 on det2.DET_PRIMARY_2 = d.DET_PRIMARY
left outer join SYS_VATCONTROL vt on vt.VAT_CODE = d.DET_VATCODE
left outer join SL_TRANSACTIONS st on st.ST_PRIMARY = convert(int,substring(d.DET_HEADER_KEY,2,99)) and substring(d.DET_HEADER_KEY,1,1) = 'S'
left outer join PL_TRANSACTIONS pt on pt.PT_PRIMARY = convert(int,substring(d.DET_HEADER_KEY,2,99)) and substring(d.DET_HEADER_KEY,1,1) = 'P'
left outer join NL_TRANSACTIONS nt on nt.NT_PRIMARY = convert(int,substring(d.DET_HEADER_KEY,2,99)) and substring(d.DET_HEADER_KEY,1,1) = 'N'
left outer join NL_ACCOUNTS nnl on nnl.NCODE = nt.NT_VAT_CONTRA

where
not (d.DET_BATCH_FLAG = 1 and d.DET_RECUR_FLAG = 1)  -- exclude master copies of recurring journals
and not((d.DET_GROSS=0) and (d.DET_GROSS_BASE2=0) and (d.DET_CURR_NETT + d.DET_CURR_TAX = 0) and ((d.DET_QUANTITY = 0) or (d.DET_NOMINALVAT<>''))) -- exclude zero value transactions unless they are SOP or POP debits or credits with a non-zero quantity
and DET_TYPE not in('MIN','MCR')

