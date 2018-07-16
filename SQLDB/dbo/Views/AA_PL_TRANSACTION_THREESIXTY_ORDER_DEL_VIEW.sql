create view AA_PL_TRANSACTION_THREESIXTY_ORDER_DEL_VIEW
/*
** Returns order delivery line information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select DHH_ORDER_NO as ORDER_NUMBER,
   DHH_DELIVERYNOTE_NO,
   DHH_DATE_UPDATED
   from SYS_DEL_HISTORY_HEADER
   where DHH_ORIGIN like 'P%'