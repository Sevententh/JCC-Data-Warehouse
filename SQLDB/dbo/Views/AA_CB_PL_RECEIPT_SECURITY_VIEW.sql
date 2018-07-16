create view AA_CB_PL_RECEIPT_SECURITY_VIEW
/*
** Written:			6/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Cashbook Purchase Receipts
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 8, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS8, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as GO_TO_BATCH,
(case 
   when substring(UP_TRAN_OPTIONS8, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as OPTIONS,
cast (substring(UP_TRAN_OPTIONS8, 3, 1) as tinyint) as ALLOCATE_TRANSACTION_NOW,
cast (substring(UP_TRAN_OPTIONS8, 4, 1) as tinyint) as ENTER_GROSS_CURRENCY_AMOUNTS,
cast (substring(UP_TRAN_OPTIONS8, 5, 1) as tinyint) as ARCHIVE_TRANSACTION,
cast (substring(UP_TRAN_OPTIONS8, 6, 1) as tinyint) as BATCH_TRANSACTION,
cast (substring(UP_TRAN_OPTIONS8, 7, 1) as tinyint) as REMEMBER_SUPPLIER_DETAILS,
cast (substring(UP_TRAN_OPTIONS8, 8, 1) as tinyint) as BYPASS_COSTING,
(case 
   when substring(UP_TRAN_OPTIONS8, 9, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as SUB_LEDGER,
(case 
   when substring(UP_TRAN_OPTIONS8, 10, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as CHANGE_CURRENCY_RATE,
(case 
   when substring(UP_TRAN_OPTIONS8, 11, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as ACCOUNT_NOTES,
(case 
   when substring(UP_TRAN_OPTIONS8, 12, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as AGED_CREDITOR
from SYS_USER_PROFILE
where UP_MODULE = 'CB'
