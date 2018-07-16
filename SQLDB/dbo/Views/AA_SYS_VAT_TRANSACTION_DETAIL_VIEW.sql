create view AA_SYS_VAT_TRANSACTION_DETAIL_VIEW

/*
**
** Written     :  25/01/2006 JC
** Last Amended:  
**
*/

as 

Select  
-- List Fields
    DET_HEADER_REF                                     TRAN_HEADER_REF
,   case substring(DET_ORIGIN,1,1)
       when 'S' then
          case isnull(ST_ORDER_NUMBER,0)
          when 0 then ''
          else
             convert(nvarchar,convert(decimal(38,0),ST_ORDER_NUMBER))
          end
       when 'P' then
          case isnull(PT_ORDER_NUMBER,0)
          when 0 then ''
          else
             convert(nvarchar,convert(decimal(38,0),PT_ORDER_NUMBER))
          end
    end                                                TRAN_ORDER_NUMBER
,   isnull(DET_STOCK_CODE, '') 
    + 
    isnull(DET_PRICE_CODE, '')                         TRAN_STOCK_PRICE_CODE
,   DET_COSTHEADER                                     TRAN_PROJECT_CODE
,   DET_COSTCENTRE                                     TRAN_COSTCENTRE_CODE
,   DET_QUANTITY                                       TRAN_QUANTITY
,   DET_DESCRIPTION                                    TRAN_DETAIL
,   DET_PRIMARY                                        [PRIMARY]

-- Search Fields
,   substring(DET_ORIGIN,1,1)                          DET_ORIGIN
,   0                                                  NT_RECUR_FLAG
,   DET_RECUR_FLAG
,   DET_NOMINALCR
,   DET_NOMINALDR
,   DET_EC_T_NATURE
,   DET_ECVAT_TYPE

from SL_PL_NL_DETAIL D
   left outer join SL_TRANSACTIONS ST on D.DET_HEADER_KEY = ST.ST_HEADER_KEY and substring(D.DET_ORIGIN,1,1) = 'S'
   left outer join PL_TRANSACTIONS PT on D.DET_HEADER_KEY = PT.PT_HEADER_KEY and substring(D.DET_ORIGIN,1,1) = 'P'
where
    substring(DET_ORIGIN,1,1) in ('S', 'P') and
    DET_TYPE IN ('INV','CRN') and
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
    ) and
    DET_VAT_RETURN_PRIMARY = (select max(TAXAUDIT_PRIMARY) from SYS_TAX_AUDIT)

union

Select  
-- List Fields
    DET_HEADER_REF                                     TRAN_HEADER_REF
,   ''                                                 TRAN_ORDER_NUMBER
,   isnull(DET_STOCK_CODE, '') 
    + 
    isnull(DET_PRICE_CODE, '')                         TRAN_STOCK_PRICE_CODE
,   DET_COSTHEADER                                     TRAN_PROJECT_CODE
,   DET_COSTCENTRE                                     TRAN_COSTCENTRE_CODE
,   DET_QUANTITY                                       TRAN_QUANTITY
,   DET_DESCRIPTION                                    TRAN_DETAIL
,   DET_PRIMARY                                        [PRIMARY]

-- Search Fields
,   substring(DET_ORIGIN,1,1)                          DET_ORIGIN
,   NT_RECUR_FLAG
,   DET_RECUR_FLAG
,   DET_NOMINALCR
,   DET_NOMINALDR
,   DET_EC_T_NATURE
,   DET_ECVAT_TYPE

from SL_PL_NL_DETAIL
    inner join NL_TRANSACTIONS on NT_HEADER_KEY = DET_HEADER_KEY
where
    substring(DET_ORIGIN,1,1) = 'N' and
    DET_TYPE='VJL' and
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
    ) and
    DET_VAT_RETURN_PRIMARY = (select max(TAXAUDIT_PRIMARY) from SYS_TAX_AUDIT)
