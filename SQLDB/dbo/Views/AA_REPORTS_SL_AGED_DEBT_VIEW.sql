create view AA_REPORTS_SL_AGED_DEBT_VIEW
/*
** 
** Written:
** Last Amended: 
**
*/
as

select
      ST_PRIMARY                                       TransPrimary
   ,  case
         when ST_DATE <= Days90 then 
            dbo.AA_VALUE_DPS_F(ST_UNALLOCATED) 
            *
            case
               when ST_TRANTYPE in ('INV','ADR') then 
                  1
               else
                  -1
            end
         else
            0
      end                                                MoreThan90Days
   ,  case
         when ST_DATE >= Days60 and ST_DATE <= Days90 then 
            dbo.AA_VALUE_DPS_F(ST_UNALLOCATED) 
            *
            case
               when ST_TRANTYPE in ('INV','ADR') then 
                  1
               else
                  -1
            end
         else
            0
      end                                                Days90
   ,  case
         when ST_DATE >= Days30 and ST_DATE <= Days60 then 
            dbo.AA_VALUE_DPS_F(ST_UNALLOCATED) 
            *
            case
               when ST_TRANTYPE in ('INV','ADR') then 
                  1
               else
                  -1
            end
         else
            0
      end                                                Days60

   ,  case
         when ST_DATE >= Days30  then 
            dbo.AA_VALUE_DPS_F(ST_UNALLOCATED) 
            *
            case
               when ST_TRANTYPE in ('INV','ADR') then 
                  1
               else
                  -1
            end
         else
            0
      end                                                Days30
from
      SL_TRANSACTIONS  with(nolock)
   ,  (
         select
            dbo.AA_STRIP_TIME_FROM_DATE_F(getdate())                                                                          DayCurrentEnd
         ,  dbo.AA_STRIP_TIME_FROM_DATE_F(getdate())-30                                                                       Days30
         ,  dbo.AA_STRIP_TIME_FROM_DATE_F(getdate())-60                                                                       Days60
         ,  dbo.AA_STRIP_TIME_FROM_DATE_F(getdate())-90                                                                       Days90
      )  Dates
where
   ST_ALOC_POINTER like '0%'
and 
   ST_BATCH_FLAG=0
