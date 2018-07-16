create view    STK_ADV_CUST_VIEW_LIST
as
select 
   STKC_PARENT
,  CUST_CODE
,  CUST_SORT
,  CUST_USER1
,  CUST_USER2
,  CUST_USER3
,  case substring(PRS_CUST_DEF,1,1) 
      when 'C' then  case 
                        when isnull(CUST_CODE,'') = '' then '' 
                        else
                           'C'
                     end
      when 'S' then  case 
                        when isnull(CUST_SORT,'') = '' then '' 
                        else 'S' 
                     end
      when '1' then  case 
                        when isnull(CUST_USER1,'') = '' then '' 
                        else '1' 
                     end
      when '2' then  case 
                        when isnull(CUST_USER2,'') = '' then '' 
                        else
                           '2' 
                     end
      when '3' then  case 
                        when isnull(CUST_USER3,'') = '' then '' 
                        else
                           '3' 
                     end 
   end 
   +
   case substring(PRS_CUST_DEF,2,1) 
      when 'C' then  case 
                        when isnull(CUST_CODE,'') = '' then '' 
                        else
                           'C' 
                     end
      when 'S' then  case 
                        when isnull(CUST_SORT,'') = '' then '' 
                        else
                           'S' 
                     end
      when '1' then  case 
                        when isnull(CUST_USER1,'') = '' then '' 
                        else
                           '1' 
                     end
      when '2' then  case 
                        when isnull(CUST_USER2,'') = '' then '' 
                        else
                           '2' 
                     end
      when '3' then  case 
                        when isnull(CUST_USER3,'') = '' then '' 
                        else
                           '3' 
                     end 
   end 
   +
   case substring(PRS_CUST_DEF,3,1) 
      when 'C' then  case 
                        when isnull(CUST_CODE,'') = '' then '' 
                        else
                           'C' 
                     end
      when 'S' then  case 
                        when isnull(CUST_SORT,'') = '' then '' 
                        else
                           'S' 
                     end
      when '1' then  case 
                        when isnull(CUST_USER1,'') = '' then '' 
                        else
                           '1' 
                     end
      when '2' then  case 
                        when isnull(CUST_USER2,'') = '' then '' 
                        else
                           '2' 
                     end
      when '3' then  case 
                        when isnull(CUST_USER3,'') = '' then '' 
                        else
                           '3' 
                     end 
   end 
   +
   case substring(PRS_CUST_DEF,4,1) 
      when 'C' then  case 
                        when isnull(CUST_CODE,'') = '' then '' 
                        else
                           'C' 
                     end
      when 'S' then  case 
                        when isnull(CUST_SORT,'') = '' then '' 
                        else
                           'S' 
                     end
      when '1' then  case 
                        when isnull(CUST_USER1,'') = '' then '' 
                        else
                           '1' 
                     end
      when '2' then  case 
                        when isnull(CUST_USER2,'') = '' then '' 
                        else
                           '2' 
                     end
      when '3' then  case 
                        when isnull(CUST_USER3,'') = '' then '' 
                        else
                           '3' 
                     end 
   end 
   +
   case substring(PRS_CUST_DEF,5,1) 
      when 'C' then  case 
                        when isnull(CUST_CODE,'') = '' then '' 
                        else
                           'C' 
                     end
      when 'S' then  case 
                        when isnull(CUST_SORT,'') = '' then '' 
                        else
                           'S' 
                     end
      when '1' then  case 
                        when isnull(CUST_USER1,'') = '' then '' 
                        else
                           '1' 
                     end
      when '2' then  case 
                        when isnull(CUST_USER2,'') = '' then '' 
                        else
                           '2' 
                     end
      when '3' then  case 
                        when isnull(CUST_USER3,'') = '' then '' 
                        else
                           '3' 
                     end 
   end as CUST_TYPE
   from
      (
         select
            STKC_PARENT
         ,  max(case when STKC_TYPE = 'C' then STKC_CHAR else null end) as CUST_CODE
         ,  max(case when STKC_TYPE = 'S' then STKC_CHAR else null end) as CUST_SORT
         ,  max(case when STKC_TYPE = '1' then STKC_CHAR else null end) as CUST_USER1
         ,  max(case when STKC_TYPE = '2' then STKC_CHAR else null end) as CUST_USER2
         ,  max(case when STKC_TYPE = '3' then STKC_CHAR else null end) as CUST_USER3
         ,  '' as CUST_TYPE
            from
               STK_PRICE_LIST_CUST with(nolock)
                  inner join STK_PRICE_LISTS with(nolock) on STH_PRIMARY = STKC_PARENT
            where  
                     isnull(STH_MATCH_ALL_CUST,0) = 1
               and   STH_ACTIVE = 1
               and   STKC_EXCLUDE = 0
            group by
               STKC_PARENT
      ) CUST_VIEW1
   ,  STK_PRICE_LIST_SETTINGS 

   union

   select
      STKC_PARENT
   ,  case when STKC_TYPE = 'C' then STKC_CHAR else null end as CUST_CODE
   ,  case when STKC_TYPE = 'S' then STKC_CHAR else null end as CUST_SORT
   ,  case when STKC_TYPE = '1' then STKC_CHAR else null end as CUST_USER1
   ,  case when STKC_TYPE = '2' then STKC_CHAR else null end as CUST_USER2
   ,  case when STKC_TYPE = '3' then STKC_CHAR else null end as CUST_USER3
   ,  STKC_TYPE as CUST_TYPE
      from
         STK_PRICE_LIST_CUST with(nolock)
            inner join STK_PRICE_LISTS with(nolock) on   STH_PRIMARY = STKC_PARENT
      where  
               isnull(STH_MATCH_ALL_CUST,0)  = 0
         and   STH_ACTIVE                    = 1
         and   STKC_EXCLUDE                  = 0