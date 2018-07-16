create view AA_SYS_COUNTRY_VIEW
/*
** Returns values for a country record
** Written: 29/09/04 SR
** Last Amended: 03/11/04 SH; 24/03/05 SRB, 13/12/05 NC
*/
as

select
   CO_PRIMARY as [PRIMARY],
   CO_CODE,
   CO_NUMBER,
   CO_NAME,
   CO_SYMBOL,
   CURREC_DESCRIPTION,
   CO_EC_FLAG,
   CO_VAT_REG_PREFIX,
   CO_EMU_MEMBER_DATE,  
   (case CO_DEL_TERMS
      when 'EXW' then 1
      when 'FOB' then 2
      when 'CIF' then 3
      when 'CFR' then 4
      when 'CIP' then 5
      when 'CPT' then 6
      when 'DDU' then 7
      when 'DAF' then 8
      when 'DDP' then 9
      when 'DEQ' then 10
      when 'DES' then 11
      when 'FAS' then 12
      when 'FCA' then 13
      when 'XXX' then 14 
      else -1 end) as CO_DEL_TERMS, 
   case when isnull(CO_TRN_NATURE,'') = '' then -1 else convert(int, CO_TRN_NATURE) end as CO_TRN_NATURE, -- 10=Change of Ownership, 20=Returned/Replacement, 30=Free of Charge, 40=Processing/Repair, 50=Returned after Processing/Repair, 60=Temporary Usage, 70=Joint Projects, 80=Construction/Engineering, 90=Other
   case when isnull(CO_TRNSPRT_MODE,'') = '' then -1 else convert(int, CO_TRNSPRT_MODE) end as CO_TRNSPRT_MODE,     -- 1=Sea, 2=Rail, 3=Road, 4=Air, 5=Post, 6=Not Allocated, 7=Fixed Installations, 8=Inland Waterway, 9=Own Propulsion
   CO_TAX_NAME,
   CO_AGENT_VATNO,
   CO_AGENT_BRANCH,
   CO_NOTES,
   CO_DATE_PUTIN,
   CO_USER_PUTIN,
   CO_DATE_EDITED,
   CO_USER_EDITED,
   dbo.AA_SYS_COUNTRY_EDITABLE_F( CO_CODE, CO_EC_FLAG, 1 ) as CODE_EDITABLE,
   dbo.AA_SYS_COUNTRY_EDITABLE_F( CO_CODE, CO_EC_FLAG, 2 ) as CURRENCY_SYMBOL_EDITABLE,
   dbo.AA_SYS_COUNTRY_EDITABLE_F( CO_CODE, CO_EC_FLAG, 3 ) as COUNTRY_STATE_EDITABLE,
   CO_DO_NOT_USE as CO_EXCLUDED
from 
   SYS_COUNTRY
   left join SYS_CURRENCY_REC on CO_SYMBOL = SYS_CURRENCY_REC.CURREC_SYMBOL