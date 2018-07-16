create view AA_CST_PAYTYPE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_PAYTYPE_LIST_S
**
** Written     :  30/11/2005 SR
** Last Amended:  06/01/2006 DB
**
*/
as

select
   PAYRES_PRIMARY                as [PRIMARY]
,  isnull(PAYRES_PAYTYPE,'')     as CODE
,  PAYRES_PAYRATE                as RATE           -- Paytype rate (copy of EPT_DEF_VALUE)
,  PAYRES_PAYTYPE                                  -- Paytype code (copy of EPT_CODE)
   from
      PAY_RESOURC_LNK