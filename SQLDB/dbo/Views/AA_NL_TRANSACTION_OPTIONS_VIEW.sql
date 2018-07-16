create view AA_NL_TRANSACTION_OPTIONS_VIEW
/*
** Written: 19/11/2004 SH
** Last Amended: 
** Comments: Returns NL transaction options specific to a user and a transaction type
*/
as

select O.UT_USER_ID as [USER_ID],
       case O.UT_TRAN_TYPE when 2 then 5320
                           when 3 then 5330
                           else 5310
       end as CALLED_FROM,
       case when O.UT_TRAN_TYPE = 1 then isnull( O.UT_SESSION_VALUE, O.UT_OPTION_VALUE )
            else NULL -- Option not available within specific transaction
       end as POST_BALANCE_TO_CONTRA,
       case when O.UT_TRAN_TYPE = 1 then isnull( O1.UT_SESSION_VALUE, O1.UT_OPTION_VALUE )
            else isnull( O.UT_SESSION_VALUE, O.UT_OPTION_VALUE )
       end as MULTIPLE_CONTRAS,
       case when O.UT_TRAN_TYPE = 1 then isnull( O2.UT_SESSION_VALUE, O2.UT_OPTION_VALUE )
            else isnull( O1.UT_SESSION_VALUE, O1.UT_OPTION_VALUE )
       end as ENTER_CURRENCY_AMOUNTS,
       case when O.UT_TRAN_TYPE = 1 then isnull( O3.UT_SESSION_VALUE, O3.UT_OPTION_VALUE )
            else isnull( O2.UT_SESSION_VALUE, O2.UT_OPTION_VALUE )
       end as ARCHIVE_TRANSACTION,
       case when O.UT_TRAN_TYPE = 1 then isnull( O4.UT_SESSION_VALUE, O4.UT_OPTION_VALUE )
            else isnull( O3.UT_SESSION_VALUE, O3.UT_OPTION_VALUE )
       end as BATCH_TRANSACTION,
       case when O.UT_TRAN_TYPE = 1 then isnull( O5.UT_SESSION_VALUE, O5.UT_OPTION_VALUE )
            else isnull( O4.UT_SESSION_VALUE, O4.UT_OPTION_VALUE )
       end as RECURRING_JOURNAL,
       case when O.UT_TRAN_TYPE = 1 then isnull( O6.UT_SESSION_VALUE, O6.UT_OPTION_VALUE )
            else isnull( O5.UT_SESSION_VALUE, O5.UT_OPTION_VALUE )
       end as BYPASS_COSTING

from SYS_USER_TRAN_OPTS O
   left outer join SYS_USER_TRAN_OPTS O1 on O1.UT_TRAN_TYPE = O.UT_TRAN_TYPE and O1.UT_TRAN_OPTION = 4
                                            and O1.UT_USER_ID = O.UT_USER_ID and O1.UT_MODULE = O.UT_MODULE
   left outer join SYS_USER_TRAN_OPTS O2 on O2.UT_TRAN_TYPE = O.UT_TRAN_TYPE and O2.UT_TRAN_OPTION = 5
                                            and O2.UT_USER_ID = O.UT_USER_ID and O2.UT_MODULE = O.UT_MODULE
   left outer join SYS_USER_TRAN_OPTS O3 on O3.UT_TRAN_TYPE = O.UT_TRAN_TYPE and O3.UT_TRAN_OPTION = 6
                                            and O3.UT_USER_ID = O.UT_USER_ID and O3.UT_MODULE = O.UT_MODULE
   left outer join SYS_USER_TRAN_OPTS O4 on O4.UT_TRAN_TYPE = O.UT_TRAN_TYPE and O4.UT_TRAN_OPTION = 7
                                            and O4.UT_USER_ID = O.UT_USER_ID and O4.UT_MODULE = O.UT_MODULE
   left outer join SYS_USER_TRAN_OPTS O5 on O5.UT_TRAN_TYPE = O.UT_TRAN_TYPE and O5.UT_TRAN_OPTION = 8
                                            and O5.UT_USER_ID = O.UT_USER_ID and O5.UT_MODULE = O.UT_MODULE
   left outer join SYS_USER_TRAN_OPTS O6 on O6.UT_TRAN_TYPE = O.UT_TRAN_TYPE and O6.UT_TRAN_OPTION = 9
                                            and O6.UT_USER_ID = O.UT_USER_ID and O6.UT_MODULE = O.UT_MODULE

where O.UT_MODULE = 'NL' and O.UT_TRAN_OPTION = 3