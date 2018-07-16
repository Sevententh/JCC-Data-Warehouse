create view AA_SYS_VAT_RETURN_VIEW
/*
** Returns a table of information for a vat return record
** Written:      25/05/2005 SR
** Last Amended: 16/09/2005 SH, 27/01/2006 JC, 10/03/2006 JC, 7/11/07 NC
**
*/
as

select 
    VAT_OUTPUT                                        VAT_BOX_1
,   VAT_EC_VATACQS                                    VAT_BOX_2
,   (VAT_OUTPUT + VAT_EC_VATACQS)                     VAT_BOX_3
,   VAT_INPUT                                         VAT_BOX_4
,   abs((VAT_OUTPUT + VAT_EC_VATACQS) - VAT_INPUT)    VAT_BOX_5
,   VAT_NET_OUTPUT                                    VAT_BOX_6
,   VAT_NET_INPUT                                     VAT_BOX_7
,   VAT_EC_SUPPLIES                                   VAT_BOX_8
,   VAT_EC_ACQUISIT                                   VAT_BOX_9
,   TAXAUDIT_PRIMARY                                  AUDIT_PRIMARY
,   TAXAUDIT_FROMYEAR + 
    convert(varchar(2),TAXAUDIT_FROMPD)               AUDIT_FROM
,   TAXAUDIT_TOYEAR + 
    convert(varchar(2),TAXAUDIT_TOPD)                 AUDIT_TO
,   TAXAUDIT_REF                                      AUDIT_REF

from SYS_VATCONTROL with (nolock)
   left join SYS_TAX_AUDIT on TAXAUDIT_PRIMARY = (select max(TAXAUDIT_PRIMARY) from SYS_TAX_AUDIT with (nolock))
where VAT_CODE='0'