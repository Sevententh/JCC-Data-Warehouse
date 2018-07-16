create view AA_SYS_SAVED_SEARCH_CRITERIA_LIST_VIEW
/*
** Merges both the saved searches and the default searches.  Due to the need to show
** the defuault search for a single user. A filter needs to be applied e.g. DEFAULT_SEARCH_USER_ID = [USER_ID]
**
** Written:      11/03/04 SRB
** Last Amended: 05/08/05 MC
**
*/
as

select 

 lu.[USER_ID] as LOGON_USER_ID
,s.LIST_ID
,s.SEARCH_CRITERIA_ID 
,s.SEARCH_CRITERIA_ID as [PRIMARY]
,s.ENTERED_BY
,su.[USER_NAME] as ENTERED_BY_NAME
,s.SEARCH_NAME
,su.USER_PROFILE_CODE as PROFILE_NAME
, cast((case when d.USER_ID is null then 0 else 1 end) As bit) as DEFAULT_SEARCH
,s.DATE_EDITED as DATE_EDITED

from SYS_USER as lu cross join
   SYS_LIST_SEARCH_CRITERIA s left outer join 
   SYS_DEFAULT_SEARCH_CRITERIA d
      on d.LIST_ID = s.LIST_ID
      and d.DEFAULT_SEARCH=s.SEARCH_CRITERIA_ID
      and d.[USER_ID] = lu.[USER_ID] inner join  
   SYS_USER as su
      on su.[USER_ID] = s.ENTERED_BY
