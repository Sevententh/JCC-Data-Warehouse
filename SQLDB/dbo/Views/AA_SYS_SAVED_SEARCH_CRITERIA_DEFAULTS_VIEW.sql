create view AA_SYS_SAVED_SEARCH_CRITERIA_DEFAULTS_VIEW
/*
Used to retrieve all list defaults for a user 
Createed 30/03/04
*/

as

select 

 defaultsearch.USER_ID
,SEARCH_CRITERIA_ID
,SEARCH_CRITERIA
,SEARCH_NAME
,ENTERED_BY
,searchCriteria.LIST_ID
,ORDERBYASCENDING
,ORDER_BY_FIELD_NAME
,DATE_EDITED
,1 as DEFAULT_SEARCH

from

SYS_DEFAULT_SEARCH_CRITERIA defaultsearch 
inner join SYS_LIST_SEARCH_CRITERIA searchCriteria on searchCriteria.SEARCH_CRITERIA_ID = defaultsearch.DEFAULT_SEARCH 

