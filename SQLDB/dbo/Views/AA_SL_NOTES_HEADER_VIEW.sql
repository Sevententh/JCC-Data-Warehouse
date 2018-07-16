create view AA_SL_NOTES_HEADER_VIEW
/*
** Written     :  18/06/2007 DB
** Last Amended:  05/07/2007 DB, 17/07/2007 DB, 20/08/09 NC, 21/9/2007 RL
**
** It's advisable to set ansi warnings off when using this view due to warnings about eliminating nulls with aggregate functions
** Could not be avoided without making the view substantially more complicated
*/
as

select
   SLN_DATE_PUTIN
,  SLN_USER_PUTIN
,  convert(text,SLN_NOTE)   SLN_NOTE
,  SLN_NEXT_CONTACT_DATE
,  SLN_PROMISED_PAYMENT_DATE
,  SLN_PROMISED_PAYMENT_VALUE
,  SLN_PROMISED_PAYMENT_CURRENCY
,  ST_Count.*
,  ST_TRANTYPE
,  ST_HEADER_REF
,  DS_STATUS_DESCRIPTION
   from
      SL_NOTES
         left  join  (
                        select
                           SLN_LINK_CUSTOMER
                        ,  SLN_LINK_NOTE
                        ,  count(SLN_LINK_TRANSACTION)               TranCount   -- doesn't count nulls
                        ,  case count(SLN_LINK_TRANSACTION)
                              when 1 then max(SLN_LINK_TRANSACTION)
                              else
                                 null
                           end     SLN_LINK_TRANSACTION
                        ,	case count(SLN_LINK_TRANSACTION)
                        		when 1 then max(SLN_LINK_DEBT_STATUS)
                        		else null
                        	end													DebtStatus
                        ,	case count(*)
                        		when 1 then max(SLN_LINK_CREDIT_CONTROLLER)
                        		else null
                        	end													CreditController
                           from
                              SL_NOTES_LINK
                           group by
                              SLN_LINK_CUSTOMER
                           ,  SLN_LINK_NOTE
                     ) ST_Count        on SLN_LINK_NOTE  = SLN_PRIMARY
         left  join  SL_TRANSACTIONS   on ST_PRIMARY     = SLN_LINK_TRANSACTION
         left  join  SYS_DEBT_STATUS   on DS_PRIMARY     = DebtStatus