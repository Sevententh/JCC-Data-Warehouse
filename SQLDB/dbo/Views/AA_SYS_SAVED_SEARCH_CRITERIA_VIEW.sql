create view AA_SYS_SAVED_SEARCH_CRITERIA_VIEW
/*
** Merges both the saved searches and the default searches.  Due to the need to show
** the defuault search for a single user. A filter needs to be applied e.g. DEFAULT_SEARCH_USER_ID = [USER_ID]
**
** Written:      21/02/03 SRB
** Last Amended: 26/02/03 SRB; 11/03/03 ROBB; 11/03/03 SRB; 17/03/03 SRB; 25/03/03; 25/09/03 ROBB, 28/09/04 NC
**
*/
as

select 

 searchCriteria.SEARCH_CRITERIA_ID 
,searchCriteria.SEARCH_CRITERIA
,searchCriteria.SEARCH_NAME
,searchCriteria.ENTERED_BY
,searchCriteria.LIST_ID
,searchCriteria.ORDERBYASCENDING
,searchCriteria.ORDER_BY_FIELD_NAME
,searchCriteria.DATE_EDITED
,(case when defaultsearch.[USER_ID] is null then 0 else 1 end) as DEFAULT_SEARCH
,LogonUser.[USER_ID] as LOGON_USER_ID

from
SYS_USER LogonUser
cross join SYS_LIST_SEARCH_CRITERIA searchCriteria
left outer join SYS_DEFAULT_SEARCH_CRITERIA defaultsearch on defaultsearch.list_id = searchCriteria.list_id
   and defaultsearch.DEFAULT_SEARCH = searchCriteria.SEARCH_CRITERIA_ID
   and defaultsearch.[USER_ID] = LogonUser.[USER_ID] 



