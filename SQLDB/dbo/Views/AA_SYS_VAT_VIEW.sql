create view AA_SYS_VAT_VIEW
/*
** Returns a table of information for a tax rate record
** Written:      19/05/2004 DG
** Last Amended: 22/12/2004 SR, 09/02/2005 SR, 04/01/2007 SH, 05/03/07 NC
**
*/
as

select
 VAT_PRIMARY as [PRIMARY]
,VAT_CODE
,VAT_RATE
,coalesce(VAT_NAME,'') as VAT_NAME
,case EC_TYPE when '0' then 0
               when 'G' then 1
               when 'S' then 2
               when 'A' then 3
               when 'R' then 4
               when 'T' then 5
               when 'U' then 6
               when 'V' then 7
            else 0 end as EC_TYPE
,VAT_DATE_PUTIN
,VAT_DATE_EDITED
,VAT_USER_PUTIN
,VAT_USER_EDITED
,VAT_TYPE
,TAX_SORT_CODE
,TAX_RATE1
,TAX_RATE2
,TAX_RATE3
,TAX_RATE4
,TAX_RATE5
,TAX_RATE6

from SYS_VATCONTROL