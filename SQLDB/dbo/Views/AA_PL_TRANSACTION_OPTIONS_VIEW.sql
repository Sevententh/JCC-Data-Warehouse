create view AA_PL_TRANSACTION_OPTIONS_VIEW
/*
** Written     :  22/11/2004 SH
** Last Amended:
** Comments    :  Returns PL transaction options specific to a user and a transaction type
*/
as

select
   O.UT_USER_ID as [USER_ID]
,  case O.UT_TRAN_TYPE
      when 2 then 2320
      when 3 then 2330
      when 4 then 2340
      when 5 then 2350
      else
         2310
    end                                                              CALLED_FROM
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O.UT_SESSION_VALUE, O.UT_OPTION_VALUE)
      else
         null -- Option not available within specific transaction
   end                                                               MAKE_PAYMENT_NOW
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O1.UT_SESSION_VALUE, O1.UT_OPTION_VALUE)
      else
         isnull(O.UT_SESSION_VALUE, O.UT_OPTION_VALUE)
   end                                                               ALLOCATE_TRANSACTION_NOW
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O2.UT_SESSION_VALUE, O2.UT_OPTION_VALUE)
      else
         isnull(O1.UT_SESSION_VALUE, O1.UT_OPTION_VALUE)
   end                                                               ENTER_GROSS_CURRENCY_AMOUNTS
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O3.UT_SESSION_VALUE, O3.UT_OPTION_VALUE)
      else
         isnull(O2.UT_SESSION_VALUE, O2.UT_OPTION_VALUE)
   end                                                               ARCHIVE_TRANSACTION
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O4.UT_SESSION_VALUE, O4.UT_OPTION_VALUE)
      else
         isnull(O3.UT_SESSION_VALUE, O3.UT_OPTION_VALUE)
   end                                                               BATCH_TRANSACTION
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O5.UT_SESSION_VALUE, O5.UT_OPTION_VALUE)
      else
         null -- Option not available within specific transaction
   end                                                               ENTER_DUE_DATE_AND_RECEIPT_DATE
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O6.UT_SESSION_VALUE, O6.UT_OPTION_VALUE)
      else
         isnull(O4.UT_SESSION_VALUE, O4.UT_OPTION_VALUE)
   end                                                               REMEMBER_SUPPLIER_DETAILS
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O7.UT_SESSION_VALUE, O7.UT_OPTION_VALUE)
      else
         null -- Option not available within specific transaction
   end                                                               PUT_INVOICES_ON_DISPUTE
,  case O.UT_TRAN_TYPE
      when 1 then isnull(O8.UT_SESSION_VALUE, O8.UT_OPTION_VALUE)
      else
         isnull(O5.UT_SESSION_VALUE, O5.UT_OPTION_VALUE)
   end                                                               BYPASS_COSTING
   from
      SYS_USER_TRAN_OPTS O
         left join   SYS_USER_TRAN_OPTS   O1 on       O1.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O1.UT_TRAN_OPTION = 4
                                                and   O1.UT_USER_ID     = O.UT_USER_ID
                                                and   O1.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O2 on       O2.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O2.UT_TRAN_OPTION = 5
                                                and   O2.UT_USER_ID     = O.UT_USER_ID
                                                and   O2.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O3 on       O3.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O3.UT_TRAN_OPTION = 6
                                                and   O3.UT_USER_ID     = O.UT_USER_ID
                                                and   O3.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O4 on       O4.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O4.UT_TRAN_OPTION = 7
                                                and   O4.UT_USER_ID     = O.UT_USER_ID
                                                and   O4.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O5 on       O5.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O5.UT_TRAN_OPTION = 8
                                                and   O5.UT_USER_ID     = O.UT_USER_ID
                                                and   O5.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O6 on       O6.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O6.UT_TRAN_OPTION = 9
                                                and   O6.UT_USER_ID     = O.UT_USER_ID
                                                and   O6.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O7 on       O7.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O7.UT_TRAN_OPTION = 10
                                                and   O7.UT_USER_ID     = O.UT_USER_ID
                                                and   O7.UT_MODULE      = O.UT_MODULE
         left join   SYS_USER_TRAN_OPTS   O8 on       O8.UT_TRAN_TYPE   = O.UT_TRAN_TYPE
                                                and   O8.UT_TRAN_OPTION = 11
                                                and   O8.UT_USER_ID     = O.UT_USER_ID
                                                and   O8.UT_MODULE      = O.UT_MODULE
   where
            O.UT_MODULE       = 'PL'
      and   O.UT_TRAN_OPTION  = 3