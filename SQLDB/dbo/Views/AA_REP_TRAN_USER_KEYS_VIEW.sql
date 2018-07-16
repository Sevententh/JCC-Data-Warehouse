create view AA_REP_TRAN_USER_KEYS_VIEW
/*
** Returns transaction user keys for crystal reports
** Written:      10/11/2005 RV
** Last Amended:
**
*/
as

select
  DIM_PRIMARY as [PRIMARY]
, coalesce(DIM_TEXT,'') as DIM_TEXT
, cast( coalesce(DIM_TYPE1,0) as bit) as DIM_TYPE1
, cast( coalesce(DIM_TYPE2,0) as bit) as DIM_TYPE2
, cast( coalesce(DIM_TYPE3,0) as bit) as DIM_TYPE3
, cast( coalesce(DIM_SL,0) as bit) as DIM_SL
, cast( coalesce(DIM_PL,0) as bit) as DIM_PL
, cast( coalesce(DIM_NL,0) as bit) as DIM_NL
, cast( coalesce(DIM_SOP,0) as bit) as DIM_SOP
, cast( coalesce(DIM_POP,0) as bit) as DIM_POP
-- Search Fields
, DIM_TEXT  as [TEXT]
, DIM_TYPE1 as TYPE1
, DIM_TYPE2 as TYPE2
, DIM_TYPE3 as TYPE3
, DIM_SL    as SL
, DIM_PL    as PL
, DIM_NL    as NL
, DIM_SOP   as SOP
, DIM_POP   as POP

from SYS_DIMENSIONS
