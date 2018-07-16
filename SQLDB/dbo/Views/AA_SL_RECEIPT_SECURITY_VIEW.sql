create view AA_SL_RECEIPT_SECURITY_VIEW
/*
** Written:			5/4/2004 RL
** Last Amended: 
** Comments: 		Returns Security Profile settings for Sales Receipts
*/
as
select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
cast(substring(UP_TRANSMASK, 2, 1) as tinyint) as ALLOWEDACCESS,
(case 
   when substring(UP_TRAN_OPTIONS2, 1, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as GO_TO_BATCH,
(case 
   when substring(UP_TRAN_OPTIONS2, 2, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as OPTIONS,
cast (substring(UP_TRAN_OPTIONS2, 3, 1) as tinyint) as ALLOCATE_TRANSACTION_NOW,
cast (substring(UP_TRAN_OPTIONS2, 4, 1) as tinyint) as ENTER_GROSS_CURRENCY_AMOUNTS,
cast (substring(UP_TRAN_OPTIONS2, 5, 1) as tinyint) as ARCHIVE_TRANSACTION,
cast (substring(UP_TRAN_OPTIONS2, 6, 1) as tinyint) as BATCH_TRANSACTION,
cast (substring(UP_TRAN_OPTIONS2, 7, 1) as tinyint) as BYPASS_COSTING,
(case 
   when substring(UP_TRAN_OPTIONS2, 8, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as SUB_LEDGER,
(case 
   when substring(UP_TRAN_OPTIONS2, 9, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as CHANGE_CURRENCY_RATE,
(case 
   when substring(UP_TRAN_OPTIONS2, 10, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as ACCOUNT_NOTES,
(case 
   when substring(UP_TRAN_OPTIONS2, 11, 1) = 'Y' then cast(1 as tinyint)
   else cast(0 as tinyint)
   end)
as AGED_DEBTOR
from SYS_USER_PROFILE
where UP_MODULE = 'SL'
