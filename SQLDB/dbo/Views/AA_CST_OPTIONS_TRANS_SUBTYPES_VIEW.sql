create view AA_CST_OPTIONS_TRANS_SUBTYPES_VIEW
/*
** Returns Costing Transaction Sub Types.
**
** Written:      16/03/2006 SH
** Last Amended: 
*/
as

select CTT_PRIMARY as [PRIMARY],
      case isnull(CTT_TYPE,'')
         when 'MSC' then 0
         when 'SAL' then 1
         when 'TIM' then 2
         else -1
      end as CTT_TYPE,
      CTT_NAME,
      CTT_DESC,
      CTT_SYSTEM,

      cast(
         case
            when CTT_SYSTEM = 1 then 1
            else
               case dbo.AA_CST_SUBTYPE_EDITABLE_F(CTT_PRIMARY, 1)
                     when 1 then 0
                     else 1
                    end
         end as bit) as USED_FLAG
   from CST_TRANSACTION_SUBTYPE