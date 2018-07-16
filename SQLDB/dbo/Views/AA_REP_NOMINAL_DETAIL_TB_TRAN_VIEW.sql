CREATE view AA_REP_NOMINAL_DETAIL_TB_TRAN_VIEW
/*
** Written     :  17/05/2005 SB
** Last Amended:  25/10/2010 CC, 1/2/2012 RL
** Comments    :  view to create list of detail lines for use in crystal detailed TB report
**
** Used by     :  Trial Balance as at.rpt
*/
(
   DET_PRIMARY
  ,DET_SUB_LEDGER
  ,DET_DATE
  ,DET_NOM_PERSORT
  ,DET_HEADER_REF
  ,DET_HEADER_KEY
  ,DET_RECUR_FLAG
  ,DET_JNL_LINEREF
  ,DET_ORIGIN
  ,DET_TYPE
  ,DET_NOM_PERIOD
  ,DET_NOM_YEAR
  ,DET_VAT_RULES
  ,DET_ACCOUNT
  ,DET_ANALYSIS
  ,DET_COSTCENTRE
  ,DET_COSTHEADER
  ,DET_CHEQUE_PAYEE
  ,DET_DESCRIPTION
  ,HOME_DEBIT
  ,HOME_CREDIT
  ,NOMINAL_TYPE         --0 Debit, 1 Credit, 2 VAT
  ,NT_REVERSE_FLAG
  ,ACCOUNT_NAME
  ,CH_NAME
  ,CC_NAME
  ,ANALYSIS_NAME
  ,DET_NOMINAL
)
as 
select

  DET_PRIMARY
  ,DET_SUB_LEDGER
  ,DET_DATE
  ,DET_NOM_PERSORT
  ,DET_HEADER_REF
  ,DET_HEADER_KEY
  ,Cast(DET_RECUR_FLAG as bit) as DET_RECUR_FLAG
  ,DET_JNL_LINEREF
  ,DET_ORIGIN
  ,DET_TYPE
  ,DET_NOM_PERIOD
  ,DET_NOM_YEAR
  ,DET_VAT_RULES
  ,Isnull(DET_ACCOUNT,'') as DET_ACCOUNT
  ,Isnull(DET_ANALYSIS,'') as DET_ANALYSIS
  ,Isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE
  ,Isnull(DET_COSTHEADER,'') as DET_COSTHEADER
  ,DET_CHEQUE_PAYEE
  ,DET_DESCRIPTION
  ,case substring(DET_HEADER_KEY, 1, 1)
      when 'S' then
         case
            when DET_TYPE in ('CRN','MCR','VCR') then
               case when DET_GROSS < 0 then -DET_GROSS else 0 end
            else
               case
                  when DET_ANALTYPE = 'S' then
                     case
                        when DET_TYPE in ('JCR','ACR') then
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        else
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ADR','JDR') then
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        else
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                     end
               end
         end
      when 'P' then
         case
            when DET_TYPE in ('CRN','MCR','VCR') then
               case when DET_NETT < 0 then -DET_NETT else 0 end
            else
               case
                  when DET_ANALTYPE = 'P' then
                     case
                        when DET_TYPE in ('JDR','ADR') then
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                        else
                           case when DET_NETT > 0 then DET_NETT else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ACR','JCR') then
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                        else
                           case when DET_NETT > 0 then DET_NETT else 0 end
                     end
               end
         end
      else
         case
            when DET_NOMINALVAT = '' then
               case when DET_NETT > 0 then DET_NETT else 0 end
            when DET_NOMINALVAT is null then
               case when DET_NETT > 0 then DET_NETT else 0 end
            else 0
         end
   end HOME_DEBIT_VALUE
  ,case substring(DET_HEADER_KEY, 1, 1)
      when 'S' then
         case
            when DET_TYPE in ('CRN','MCR','VCR') then
               case when DET_GROSS > 0 then DET_GROSS else 0 end
            else
               case
                  when DET_ANALTYPE = 'S' then
                     case
                        when DET_TYPE in ('JCR','ACR') then
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                        else
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ADR','JDR') then
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                        else
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                     end
               end
         end
      when 'P' then
         case
            when DET_TYPE in ('CRN','MCR','VCR') then
               case when DET_NETT > 0 then DET_NETT else 0 end
            else
               case
                  when DET_ANALTYPE = 'P' then
                     case
                        when DET_TYPE in ('JDR','ADR') then
                           case when DET_NETT > 0 then DET_NETT else 0 end
                        else
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ACR','JCR') then
                           case when DET_NETT > 0 then DET_NETT else 0 end
                        else
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                     end
               end
         end
      else
 
         case
            when DET_NOMINALVAT = '' then
               case when DET_NETT < 0 then -DET_NETT else 0 end
            when DET_NOMINALVAT is null then
               case when DET_NETT < 0 then -DET_NETT else 0 end
            else 0
         end
   end HOME_CREDIT_VALUE
  ,0 NOMINAL_TYPE
  ,NT_REVERSE_FLAG

  ,(case when DET_ORIGIN = 'S'
            Then
               Cast(CUNAME as varchar(40))
         when DET_ORIGIN = 'P'
            Then
               Cast(SUNAME as varchar(40))

            end)
      ACCOUNT_NAME
  ,CH_NAME
  ,CC_NAME
  ,(case when DET_ORIGIN = 'S'
            then
               Cast(SANAME as varchar(40))
         when DET_ORIGIN = 'P'
            then
               Cast(PANAME as varchar(40))

            end)
      ANALYSIS_NAME
  ,DET_NOMINALDR as DET_NOMINAL
/*  ,DET_BATCH_FLAG
  ,DET_VAT
  ,DET_ANALTYPE*/
   from SL_PL_NL_DETAIL

      left outer join NL_TRANSACTIONS
      on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))

      left outer join SL_ACCOUNTS
      on CU_ACC_CODE = DET_ACCOUNT and substring(DET_HEADER_KEY, 1, 1) = 'S'

      left outer join PL_ACCOUNTS
      on SUCODE = DET_ACCOUNT and substring(DET_HEADER_KEY, 1, 1) = 'P'

      left outer join SL_ANALYSIS
      on SL_PL_NL_DETAIL.DET_ANALYSIS = SL_ANALYSIS.SACODE and substring(DET_HEADER_KEY, 1, 1) = 'S'

      left outer join PL_ANALYSIS
      on SL_PL_NL_DETAIL.DET_ANALYSIS = PL_ANALYSIS.PACODE and substring(DET_HEADER_KEY, 1, 1) = 'P'

      left outer join CST_COSTCENTRE
      on CC_CONCAT_CODES = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE

      left outer join CST_COSTHEADER
      on SL_PL_NL_DETAIL.DET_COSTHEADER = CST_COSTHEADER.CH_CODE

      where DET_BATCH_FLAG <> 1
      and DET_NOM_PERSORT > 0
      and DET_TYPE not in('MIN','MCR', 'MAC', 'MPA', 'MAD')

   --Nominal Credit
   union all
   select
    DET_PRIMARY
   ,DET_SUB_LEDGER
   ,DET_DATE
   ,DET_NOM_PERSORT
   ,DET_HEADER_REF
   ,DET_HEADER_KEY
   ,cast(DET_RECUR_FLAG as bit) as DET_RECUR_FLAG
   ,DET_JNL_LINEREF
   ,DET_ORIGIN
   ,DET_TYPE
   ,DET_NOM_PERIOD
   ,DET_NOM_YEAR
   ,DET_VAT_RULES
   ,isnull(DET_ACCOUNT,'') as DET_ACCOUNT
   ,isnull(DET_ANALYSIS,'') as DET_ANALYSIS
   ,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE
   ,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
   ,DET_CHEQUE_PAYEE
   ,DET_DESCRIPTION
   ,case substring(DET_HEADER_KEY,1,1)
      when 'S' then
         case
            when DET_TYPE in ('INV','MIN','VIN','PAY') then
               case when DET_NETT < 0 then -DET_NETT else 0 end
            else
               case
                  when DET_ANALTYPE = 'S' then
                     case
                        when DET_TYPE in ('ADR','JDR') then
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                        else
                           case when DET_NETT > 0 then DET_NETT else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ACR','JCR') then
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                        else
                           case when DET_NETT > 0 then DET_NETT else 0 end
                     end
               end
         end
      when 'P' then
         case
            when DET_TYPE in ('INV','MIN','VIN','PAY') then
               case when DET_GROSS < 0 then -DET_GROSS else 0 end
            else
               case
                  when DET_ANALTYPE = 'P' then
                     case
                        when DET_TYPE in ('ACR','JCR') then
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        else
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ADR','JDR') then
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        else
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                     end
               end
         end
      else
         case
            when DET_NOMINALVAT = '' then
               case when DET_NETT < 0 then -DET_NETT else 0 end
            when DET_NOMINALVAT is null then
               case when DET_NETT < 0 then -DET_NETT else 0 end
            else 0
         end
   end      HOME_DEBIT_VALUE

  ,case substring(DET_HEADER_KEY,1,1)
      when 'S' then
         case
            when DET_TYPE in ('INV','MIN','VIN','PAY') then
               case when DET_NETT > 0 then DET_NETT else 0 end
            else
               case
                  when DET_ANALTYPE = 'S' then
                     case
                        when DET_TYPE in ('ADR','JDR') then
                           case when DET_NETT > 0 then DET_NETT else 0 end
                        else
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ACR','JCR') then
                           case when DET_NETT > 0 then DET_NETT else 0 end
                        else
                           case when DET_NETT < 0 then -DET_NETT else 0 end
                     end
               end
         end
      when 'P' then
         case
            when DET_TYPE in ('INV','MIN','VIN','PAY') then
               case when DET_GROSS > 0 then DET_GROSS else 0 end
            else
               case
                  when DET_ANALTYPE = 'P' then
                     case
                        when DET_TYPE in ('ACR','JCR') then
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                        else
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                     end
                  else
                     case
                        when DET_TYPE in ('ADR','JDR') then
                           case when DET_GROSS > 0 then DET_GROSS else 0 end
                        else
                           case when DET_GROSS < 0 then -DET_GROSS else 0 end
                     end
               end
         end
      else
         case
            when DET_NOMINALVAT = '' then
               case when DET_NETT > 0 then DET_NETT else 0 end
            when DET_NOMINALVAT is null then
               case when DET_NETT > 0 then DET_NETT else 0 end
            else  0
         end
   end HOME_CREDIT_VALUE

  ,1 NOMINAL_TYPE
  ,NT_REVERSE_FLAG

  ,(case when DET_ORIGIN = 'S'
            then
               cast(CUNAME as varchar(40))
         when DET_ORIGIN = 'P'
            then
               cast(SUNAME as varchar(40))

            end)
      ACCOUNT_NAME
  ,CH_NAME
  ,CC_NAME
  ,(case when DET_ORIGIN = 'S'
            then
               cast(SANAME as varchar(40))
         when DET_ORIGIN = 'P'
            then
               cast(PANAME as varchar(40))

            end)
      ANALYSIS_NAME
  ,DET_NOMINALCR as DET_NOMINAL
/*  ,DET_BATCH_FLAG
  ,DET_VAT
  ,DET_ANALTYPE*/

   from SL_PL_NL_DETAIL

      left outer join NL_TRANSACTIONS
      on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))

      left outer join SL_ACCOUNTS
      on CU_ACC_CODE = DET_ACCOUNT and substring(DET_HEADER_KEY, 1, 1) = 'S'

      left outer join PL_ACCOUNTS
      on SUCODE = DET_ACCOUNT and substring(DET_HEADER_KEY, 1, 1) = 'P'

      left outer join SL_ANALYSIS
      on SL_PL_NL_DETAIL.DET_ANALYSIS = SL_ANALYSIS.SACODE and substring(DET_HEADER_KEY, 1, 1) = 'S'

      left outer join PL_ANALYSIS
      on SL_PL_NL_DETAIL.DET_ANALYSIS = PL_ANALYSIS.PACODE and substring(DET_HEADER_KEY, 1, 1) = 'P'

      left outer join CST_COSTCENTRE
      on CC_CONCAT_CODES = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE

      left outer join CST_COSTHEADER
      on SL_PL_NL_DETAIL.DET_COSTHEADER = CST_COSTHEADER.CH_CODE

      where DET_BATCH_FLAG <> 1
      and DET_NOM_PERSORT > 0
      and DET_TYPE not in('MIN','MCR', 'MAC', 'MPA', 'MAD')

--    Nominal Vat
   union all
   select
   DET_PRIMARY
  ,DET_SUB_LEDGER
  ,DET_DATE
  ,DET_NOM_PERSORT
  ,DET_HEADER_REF
  ,DET_HEADER_KEY
  ,cast(DET_RECUR_FLAG as bit) as DET_RECUR_FLAG
  ,DET_JNL_LINEREF
  ,DET_ORIGIN
  ,DET_TYPE
  ,DET_NOM_PERIOD
  ,DET_NOM_YEAR
  ,DET_VAT_RULES
  ,isnull(DET_ACCOUNT,'') as DET_ACCOUNT
  ,isnull(DET_ANALYSIS,'') as DET_ANALYSIS
  ,isnull(DET_COSTCENTRE,'') as DET_COSTCENTRE
  ,isnull(DET_COSTHEADER,'') as DET_COSTHEADER
  ,DET_CHEQUE_PAYEE
  ,DET_DESCRIPTION

  ,case substring(DET_HEADER_KEY,1,1)
      when 'S' then
         case
            when DET_VAT_RULES = 1 then 0
            else
               case
                  when DET_TYPE in ('INV','MIN','VIN','PAY') then
                     case when DET_VAT < 0 then -DET_VAT else 0 end
                  else
                     case
                        when DET_ANALTYPE = 'S' then
                           case
                              when DET_TYPE in ('ADR','JDR') then
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                              else
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                           end
                        else
                           case
                              when DET_TYPE in ('ACR','JCR') then
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                              else
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                           end
                     end
               end
         end
      when 'P' then
         case
            when DET_VAT_RULES = 1 then 0
            else
               case
                  when DET_TYPE in ('CRN','MCR','VCR') then
                     case when DET_VAT < 0 then -DET_VAT else 0 end
                  else
                     case
                        when DET_ANALTYPE = 'P' then
                           case
                              when DET_TYPE in ('JDR','ADR') then
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                              else
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                           end
                        else
                           case
                              when DET_TYPE in ('ACR','JCR') then
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                              else
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                           end
                     end
               end
         end
      else
         case
            when DET_NOMINALDR = '' then
               case when DET_VAT < 0 then -DET_VAT else 0 end
            when DET_NOMINALDR is null then
               case when DET_VAT < 0 then -DET_VAT else 0 end
            else
               case when DET_VAT > 0 then DET_VAT else 0 end
         end
   end      HOME_DEBIT_VALUE

  ,case substring(DET_HEADER_KEY,1,1)
      when 'S' then
         case
            when DET_VAT_RULES = 1 then 0
            else
               case
                  when DET_TYPE in ('INV','MIN','VIN','PAY') then
                     case when DET_VAT > 0 then DET_VAT else 0 end
                  else
                     case
                        when DET_ANALTYPE = 'S' then
                           case
                              when DET_TYPE in ('ADR','JDR') then
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                              else
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                           end
                        else
                           case
                              when DET_TYPE in ('ACR','JCR') then
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                              else
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                           end
                     end
               end
         end
      when 'P' then
         case
            when DET_VAT_RULES = 1 then 0
            else
               case
                  when DET_TYPE in ('CRN','MCR','VCR') then
                     case when DET_VAT > 0 then DET_VAT else 0 end
                  else
                     case
                        when DET_ANALTYPE = 'P' then
                           case
                              when DET_TYPE in ('JDR','ADR') then
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                              else
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                           end
                        else
                           case
                              when DET_TYPE in ('ACR','JCR') then
                                 case when DET_VAT > 0 then DET_VAT else 0 end
                              else
                                 case when DET_VAT < 0 then -DET_VAT else 0 end
                           end
                     end
               end
         end
      else
         case
            when DET_NOMINALDR = '' then
               case when DET_VAT > 0 then DET_VAT else 0 end
            when DET_NOMINALDR is null then
               case when DET_VAT > 0 then DET_VAT else 0 end
            else
               case when DET_VAT < 0 then -DET_VAT else 0 end
         end
   end      HOME_CREDIT_VALUE

   ,2 NOMINAL_TYPE
   ,NT_REVERSE_FLAG

   ,(case when DET_ORIGIN = 'S'
            Then
               cast(CUNAME as varchar(40))
         when DET_ORIGIN = 'P'
            then
               cast(SUNAME as varchar(40))

            end)
      ACCOUNT_NAME
   ,CH_NAME
   ,CC_NAME
   ,(case when DET_ORIGIN = 'S'
            then
               cast(SANAME as varchar(40))
         when DET_ORIGIN = 'P'
            then
               cast(PANAME as varchar(40))

            end)
      ANALYSIS_NAME
   ,DET_NOMINALVAT as DET_NOMINAL
/*   ,DET_BATCH_FLAG
   ,DET_VAT
   ,DET_ANALTYPE*/

   from SL_PL_NL_DETAIL

      left outer join NL_TRANSACTIONS
      on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))

      left outer join SL_ACCOUNTS
      on CU_ACC_CODE = DET_ACCOUNT and substring(DET_HEADER_KEY, 1, 1) = 'S'

      left outer join PL_ACCOUNTS
      on SUCODE = DET_ACCOUNT and substring(DET_HEADER_KEY, 1, 1) = 'P'

      left outer join SL_ANALYSIS
      on SL_PL_NL_DETAIL.DET_ANALYSIS = SL_ANALYSIS.SACODE and substring(DET_HEADER_KEY, 1, 1) = 'S'

      left outer join PL_ANALYSIS
      on SL_PL_NL_DETAIL.DET_ANALYSIS = PL_ANALYSIS.PACODE and substring(DET_HEADER_KEY, 1, 1) = 'P'

      left outer join CST_COSTCENTRE
      on CC_CONCAT_CODES = DET_COSTHEADER + space(10 - len(DET_COSTHEADER)) + DET_COSTCENTRE

      left outer join CST_COSTHEADER
      on SL_PL_NL_DETAIL.DET_COSTHEADER = CST_COSTHEADER.CH_CODE

      where DET_BATCH_FLAG <> 1
      and DET_NOM_PERSORT > 0
      and DET_TYPE not in('MIN','MCR', 'MAC', 'MPA', 'MAD')
