create view AA_SL_NOTES_DETAIL_VIEW
/*
** Written     :  18/06/2007 DB
** Last Amended:  17/07/2007 DB, 21/9/2007 RL
**
*/
as

select
   SLNL.SLN_LINK_CUSTOMER
,  SLNL.SLN_LINK_NOTE
,  SLNL.SLN_LINK_TRANSACTION
,  ST_TRANTYPE
,  ST_HEADER_REF
,  DS_STATUS_DESCRIPTION
,  SLNL.SLN_LINK_CREDIT_CONTROLLER		CreditController
   from
      SL_NOTES_LINK SLNL
         left  join  (
                        select
                           SLN_LINK_CUSTOMER
                        ,  SLN_LINK_NOTE
                        ,  count(SLN_LINK_TRANSACTION)   TranCount
                           from
                              SL_NOTES_LINK
                           where
                              SLN_LINK_TRANSACTION is not null
                           group by
                              SLN_LINK_CUSTOMER
                           ,  SLN_LINK_NOTE
                     ) ST_Count        on       ST_Count.SLN_LINK_CUSTOMER = SLNL.SLN_LINK_CUSTOMER
                                          and   ST_Count.SLN_LINK_NOTE     = SLNL.SLN_LINK_NOTE
         inner join  SL_TRANSACTIONS   on       ST_Count.TranCount         > 1
                                          and   ST_PRIMARY                 = SLNL.SLN_LINK_TRANSACTION
         left  join  SYS_DEBT_STATUS   on       DS_PRIMARY                 = SLNL.SLN_LINK_DEBT_STATUS