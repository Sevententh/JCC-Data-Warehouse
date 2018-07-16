create view AA_SL_CUSTOMER_SECURITY_VIEW
/*
** Written:     03/02/2004 SRB
** Last Amended:
** Comments: Returns Security Profile settings for Customer Records
*/
As
Select
UP_CODE as PROFILECODE, UP_MODULE as PROFILEMODULE,
Cast(Substring(UP_RECORDMASK, 2, 1) As tinyint) As ALLOWEDACCESS,
(Case 
   When Substring(UP_REC_OPTIONS1, 1, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [INSERT],
(Case 
   When Substring(UP_REC_OPTIONS1, 2, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDIT,
(Case 
   When Substring(UP_REC_OPTIONS1, 3, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As [DELETE],
(Case 	When Substring(UP_REC_OPTIONS1, 4, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 4, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 4, 1) = 'V' Then Cast(2 as tinyint)
   End)
As INFO,
(Case 	When Substring(UP_REC_OPTIONS1, 5, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 5, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 5, 1) = 'V' Then Cast(2 as tinyint)
   End)
As TERMS,
(Case 	When Substring(UP_REC_OPTIONS1, 6, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 6, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 6, 1) = 'V' Then Cast(2 as tinyint)
   End)
As TAXEC,
(Case 	When Substring(UP_REC_OPTIONS1, 7, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 7, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 7, 1) = 'V' Then Cast(2 as tinyint)
   End)
As ADDRESSES,

/*
--This is now Edit Aged Debtor Transactions.  This is not part of the customer record 
-- and need to be part of the Aged Debtor List
(Case 	When Substring(UP_REC_OPTIONS1, 8, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 8, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 8, 1) = 'V' Then Cast(0 as tinyint)
   End)
As EDIT_AGEDEBTOR_TRANSACTIONS,  

--This is now Edit Sales Transactions.  This is not part of the customer record 
-- and need to be part of the Sales Transaction Enquiry List
(Case 
   When Substring(UP_REC_OPTIONS1, 9, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As PROFIT,

(Case 
   When Substring(UP_REC_OPTIONS1, 10, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As OUTSTANDINGORDERS,
(Case 	When Substring(UP_REC_OPTIONS1, 11, 1) = 'X' Then Cast(0 as tinyint)
	When Substring(UP_REC_OPTIONS1, 11, 1) = 'F' Then Cast(1 as tinyint)
	When Substring(UP_REC_OPTIONS1, 11, 1) = 'V' Then Cast(2 as tinyint)
   End)
As EDIT_SALES_TRANSACTIONS,

(Case 
   When Substring(UP_REC_OPTIONS1, 13, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As CUSTOMISE_CUSTOM_TAB,
*/
(Case 
   When Substring(UP_REC_OPTIONS1, 14, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As TURNOVERSUMMARY,
(Case 
   When Substring(UP_REC_OPTIONS1, 15, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As EDIT_ON_STOP,
(Case 
   When Substring(UP_REC_OPTIONS1, 16, 1) = 'Y' Then Cast(1 as tinyint)
   Else Cast(0 as tinyint)
   End)
As SMARTTAGSUMMARY,
UP_LEVEL_RECENTRY1 AS ENTERAMENDLEVEL,
UP_LEVEL_RECVIEW1 AS WORKWITHLEVEL,
UP_LEVEL_EXACT1 As EXACTLEVEL
From SYS_USER_PROFILE
Where UP_MODULE = 'SL'


