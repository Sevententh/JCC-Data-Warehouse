create view AA_SYS_VAT_RETURN_LIST_VIEW
/*
** Returns a table of information for creating a list of previous vat returns
** Written:      30/09/2005 SR
** Last Amended: 08/11/2005 JC
**
*/
as

select 
  TAXAUDIT_PRIMARY,
  TAXAUDIT_REF,
  TAXAUDIT_FROMYEAR + 
  case len(TAXAUDIT_FROMPD) 
     when 1 then '0' else '' 
  end + 
  cast(TAXAUDIT_FROMPD as varchar(2)) as TAXAUDIT_FROM,

  TAXAUDIT_TOYEAR + 
  case len(TAXAUDIT_TOPD) 
     when 1 then '0' else '' end + 
  cast(TAXAUDIT_TOPD as varchar(2)) as TAXAUDIT_TO

from SYS_TAX_AUDIT