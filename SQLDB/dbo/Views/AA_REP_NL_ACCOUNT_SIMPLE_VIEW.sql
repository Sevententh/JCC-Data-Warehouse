CREATE VIEW AA_REP_NL_ACCOUNT_SIMPLE_VIEW
/*
** Written:     09/12/2005 RV
** Last Amended:  20/04/2006 SB
** Comments: returns basic account information for the account simple list crystal report
*/
as

select
-- Display Fields
   NCODE
,  NNAME
,  NMAJORHEADCODE

-- Search Fields
,  NCATEGORYCODE1
,  NCATEGORYCODE2
,  NCATEGORYCODE3
,  NCATEGORYCODE4
,  NCATEGORYCODE5
,  NCATEGORYCODE6
,  NCATEGORYCODE7
,  NCATEGORYCODE8

from  NL_ACCOUNTS

where N_EXCLUDE_RECREP <> 1
