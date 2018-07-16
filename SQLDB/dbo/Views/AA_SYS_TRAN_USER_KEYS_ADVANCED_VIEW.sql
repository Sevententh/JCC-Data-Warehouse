create view AA_SYS_TRAN_USER_KEYS_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_SYS_TRAN_USER_KEYS_LIST_S
** Written:      20/05/2004 DG
** Last Amended: 11/06/04 NC
**
*/
as

select
  DIM_PRIMARY as [PRIMARY]
, DIM_SORTORDER
, coalesce(DIM_TEXT,'') as DIM_TEXT
, coalesce(DIM_TYPE1,0) as DIM_TYPE1
, coalesce(DIM_TYPE2,0) as DIM_TYPE2
, coalesce(DIM_TYPE3,0) as DIM_TYPE3
, coalesce(DIM_SL,0) as DIM_SL
, coalesce(DIM_PL,0) as DIM_PL
, coalesce(DIM_NL,0) as DIM_NL
, coalesce(DIM_SOP,0) as DIM_SOP
, coalesce(DIM_POP,0) as DIM_POP
, DIM_DATE_PUTIN
, DIM_DATE_EDITED
, DIM_USER_PUTIN
, DIM_USER_EDITED
from SYS_DIMENSIONS