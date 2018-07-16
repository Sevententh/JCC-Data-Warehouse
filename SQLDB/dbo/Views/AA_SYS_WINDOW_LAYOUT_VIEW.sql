create view AA_SYS_WINDOW_LAYOUT_VIEW

/*
**
** Due to the need to show the Layouts created by a particular user or by users of a particular profile,
** a filter may need to be applied e.g. WL_ENTERED_BY = [USER_ID]
**
** Written: 6/1/06 LM
** Last Amended:
**
*/

as

select WL_PRIMARY AS [PRIMARY],
       WL_ENTERED_BY AS [ENTERED_BY],
       [USER_NAME] AS [ENTERED_BY_NAME],
       WL_LAYOUT_NAME AS [LAYOUT_NAME],
       USER_PROFILE_CODE AS [PROFILE_NAME]
from SYS_WINDOW_LAYOUTS
inner join SYS_USER
   on WL_ENTERED_BY = USER_ID