create view AA_SYS_VAT_TRANSACTION_HEADER_VIEW

/*
**
** Written     :  25/01/2006 JC
** Last Amended:  
**
*/

as 

Select  
-- List Fields
    DET_DATE                                           TRAN_DATE
,   DET_PERIODNUMBR                                    TRAN_PERIOD
,   DET_YEAR                                           TRAN_YEAR
,   DET_TYPE                                           TRAN_TYPE
,   DET_ACCOUNT                                        TRAN_ACCOUNT
,   case DET_TYPE
       when 'CRN' then 
          dbo.AA_VALUE_DPS_F(DET_NETT*-1)
       else
          dbo.AA_VALUE_DPS_F(DET_NETT) 
    end                                                TRAN_NET_VALUE
,   case when DET_ECVAT_TYPE in ('G','A','T') then
       case DET_TYPE
          when 'CRN' then 
             dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX*-1)
          else
             dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX) 
       end
    else
       case DET_TYPE
          when 'CRN' then 
             dbo.AA_VALUE_DPS_F(DET_VAT*-1)
          else
             dbo.AA_VALUE_DPS_F(DET_VAT) 
       end
    end                                                TRAN_VAT_VALUE
,   case DET_TYPE
       when 'CRN' then 
          dbo.AA_VALUE_DPS_F(DET_GROSS*-1)
       else
          dbo.AA_VALUE_DPS_F(DET_GROSS) 
    end                                                TRAN_GROSS_VALUE
,   DET_PRIMARY                                        [PRIMARY]

-- Search Fields
,   substring(DET_ORIGIN,1,1)                          DET_ORIGIN
,   0                                                  NT_RECUR_FLAG
,   DET_RECUR_FLAG
,   DET_NOMINALCR
,   DET_NOMINALDR
,   DET_EC_T_NATURE
,   DET_ECVAT_TYPE
,   DET_VAT_RETURN_PRIMARY

from SL_PL_NL_DETAIL
where
    substring(DET_ORIGIN,1,1) in ('S', 'P') and
    DET_TYPE in ('INV','CRN') and
    DET_VATCODE !='' and 
    DET_VATCODE <> '8' and
    DET_BATCH_FLAG<>1 and
    (
      (
         DET_EC_T_NATURE not like '2%' and
         DET_EC_T_NATURE not like '4%' and 
         DET_EC_T_NATURE not like '5%' and 
         DET_EC_T_NATURE not like '6%' and 
         DET_EC_T_NATURE not like '_7'
      ) or 
      DET_EC_T_NATURE is null
    ) 

union

Select  
-- List Fields
    DET_DATE                                           TRAN_DATE
,   DET_PERIODNUMBR                                    TRAN_PERIOD
,   DET_YEAR                                           TRAN_YEAR
,   DET_TYPE                                           TRAN_TYPE
,   DET_ACCOUNT                                        TRAN_ACCOUNT
,   case isnull(DET_NOMINALDR,'')
       when '' then
          dbo.AA_VALUE_DPS_F(DET_NETT*-1)
       else
         dbo.AA_VALUE_DPS_F(DET_NETT)
    end                                                TRAN_NET_VALUE
,   case when DET_ECVAT_TYPE in ('G','A','T') then
       case isnull(DET_NOMINALDR,'')
          when '' then
             dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX*-1)
          else
             dbo.AA_VALUE_DPS_F(DET_PL_ACQ_TAX) 
       end
    else
       case isnull(DET_NOMINALDR,'')
          when '' then
             dbo.AA_VALUE_DPS_F(DET_VAT*-1)
          else
            dbo.AA_VALUE_DPS_F(DET_VAT)
       end
    end                                                TRAN_VAT_VALUE
,   case isnull(DET_NOMINALDR,'')
       when '' then
          dbo.AA_VALUE_DPS_F(DET_GROSS*-1)
       else
         dbo.AA_VALUE_DPS_F(DET_GROSS)
    end                                                TRAN_GROSS_VALUE
,   DET_PRIMARY                                        [PRIMARY]

-- Search Fields
,   substring(DET_ORIGIN,1,1)                          DET_ORIGIN
,   NT_RECUR_FLAG
,   DET_RECUR_FLAG
,   DET_NOMINALCR
,   DET_NOMINALDR
,   DET_EC_T_NATURE
,   DET_ECVAT_TYPE
,   DET_VAT_RETURN_PRIMARY

from SL_PL_NL_DETAIL
    inner join NL_TRANSACTIONS on NT_HEADER_KEY = DET_HEADER_KEY
where
    substring(DET_ORIGIN,1,1) = 'N' and
    DET_TYPE = 'VJL' and
    DET_VATCODE != '' and 
    DET_VATCODE <> '8' and
    DET_VATCODE != '' and 
    DET_VATCODE <> '8' and
    DET_BATCH_FLAG <> 1 and
    (
      (
         DET_EC_T_NATURE not like '2%' and
         DET_EC_T_NATURE not like '4%' and 
         DET_EC_T_NATURE not like '5%' and 
         DET_EC_T_NATURE not like '6%' and 
         DET_EC_T_NATURE not like '_7'
      ) or 
      DET_EC_T_NATURE is null
    ) 

