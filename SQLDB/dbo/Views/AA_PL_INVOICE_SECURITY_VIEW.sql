create view AA_PL_INVOICE_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Purchase Invoices
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 1, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS1, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as GO_TO_BATCH,
(case 
   when substring(UP_TRAN_OPTIONS1, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as OPTIONS,
cast (substring(UP_TRAN_OPTIONS1, 3, 1) as tinyint) as MAKE_PAYMENT_NOW,
cast (substring(UP_TRAN_OPTIONS1, 4, 1) as tinyint) as ALLOCATE_TRANSACTION_NOW,
cast (substring(UP_TRAN_OPTIONS1, 5, 1) as tinyint) as ENTER_GROSS_CURRENCY_AMOUNTS,
cast (substring(UP_TRAN_OPTIONS1, 6, 1) as tinyint) as ARCHIVE_TRANSACTION,
cast (substring(UP_TRAN_OPTIONS1, 7, 1) as tinyint) as BATCH_TRANSACTION,
cast (substring(UP_TRAN_OPTIONS1, 8, 1) as tinyint) as ENTER_DUE_DATE_AND_RECEIPT_DATE,
cast (substring(UP_TRAN_OPTIONS1, 9, 1) as tinyint) as REMEMBER_SUPPLIER_DETAILS,
cast (substring(UP_TRAN_OPTIONS1, 10, 1) as tinyint) as PUT_INVOICES_ON_DISPUTE,
cast (substring(UP_TRAN_OPTIONS1, 11, 1) as tinyint) as BYPASS_COSTING,
(case 
   when substring(UP_TRAN_OPTIONS1, 12, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as TERMS,
(case 
   when substring(UP_TRAN_OPTIONS1, 13, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as SUB_LEDGER,
(case 
   when substring(UP_TRAN_OPTIONS1, 14, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as CHANGE_CURRENCY_RATE,
(case 
   when substring(UP_TRAN_OPTIONS1, 15, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as ACCOUNT_NOTES,
(case 
   when substring(UP_TRAN_OPTIONS1, 16, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as AGED_CREDITOR
from SYS_USER_PROFILE
where UP_MODULE = 'PL'
