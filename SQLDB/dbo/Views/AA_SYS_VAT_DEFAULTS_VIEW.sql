create view AA_SYS_VAT_DEFAULTS_VIEW

/*
** Written     :  25/06/2010 DB
** Last Amended:
** Comments    :  Pivots the VAT defaults table for validation of business rules
**
*/
as
select
   'HOME'      SVD_REGION
,  SVD_TYPE    SVD_TYPE
,  SVD_HOME    SVD_CODE
   from
      SYS_VAT_DEFAULTS with(nolock)
union all
select
   'EU'
,  SVD_TYPE
,  SVD_EU
   from
      SYS_VAT_DEFAULTS with(nolock)
union all
select
   'NON-EU'
,  SVD_TYPE
,  SVD_NON_EU
   from
      SYS_VAT_DEFAULTS with(nolock)