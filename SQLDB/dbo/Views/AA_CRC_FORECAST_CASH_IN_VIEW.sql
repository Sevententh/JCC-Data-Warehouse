create view AA_CRC_FORECAST_CASH_IN_VIEW
/*
** This View returns columns used in the Forecast Cash In Spec
** Written  :  12/09/2007 JS
** Amended  :  09/10/2007 JS, 25/10/2007 CHW, 01/11/2007 CHW, 19/11/2007 RV, 17/03/2009 DB, 28/03/13 NC
*/
as
select
   NL_BankBalance - SL_UnallocatedTransSum                                             as 'OpeningBalance'
,  DerivedTable.*
   from
      (
         select
            ST_PRIMARY                                                                 as 'PrimaryKey'
         ,  ST_COPYCUST                                                                as 'CustomerCode'
         ,  CUNAME                                                                     as 'CustomerName'
         ,  CUSORT                                                                     as 'SortKey'
         ,  ST_USER1                                                                   as 'USERSORT1'
         ,  ST_USER2                                                                   as 'USERSORT2'
         ,  ST_USER3                                                                   as 'USERSORT3'
         ,  ST_TRANTYPE                                                                as 'Type'
         ,  ST_HEADER_REF                                                              as 'Reference'
         ,  case ST_BATCH_FLAG
               when 1 then 'B'
               else
                  ''
            end                                                                        as 'BatchFlag'
         ,  case when ST_GROSS = 0 then 0 else ST_NETT*ST_UNALLOCATED/ST_GROSS end     as 'Net'
         ,  ST_UNALLOCATED                                                             as 'Gross'
         ,  ST_CREDIT_CONTROLLER                                                       as 'CreditController'
         ,  isnull(ST_DUEDATE,ST_DATE)                                                 as 'DueDate'
         ,  isnull(ST_ANTICPAYDATE,ST_DATE)                                            as 'ANTICPAYDATE'
            from
               SL_TRANSACTIONS
                  inner join SL_ACCOUNTS  with(nolock)   on CUCODE = ST_COPYCUST
            where
                     ST_TRANTYPE          in('INV','CRN','ADR','ACR')
               and   ST_ALOC_POINTER      like '0%'
               and   ST_WRITE_OFF_STATUS  = 0
         union all
         select
            OH_PRIMARY                                                                 as 'PrimaryKey'
         ,  OH_ACCOUNT_ORDER                                                           as 'CustomerCode'
         ,  CUNAME                                                                     as 'CustomerName'
         ,  CUSORT                                                                     as 'SortKey'
         ,  OH_USER1                                                                   as 'USERSORT1'
         ,  OH_USER2                                                                   as 'USERSORT2'
         ,  OH_USER3                                                                   as 'USERSORT3'
         ,  case OH_PRIORITY
               when 0 then case OH_TYPE
                              when 'C' then 'CRO'
                              else
                                 'ORD'
                           end
               when 3 then 'PRO'
               when 4 then 'EST'
               when 5 then 'CLA'
            end                                                                        as 'Type'
         ,  cast(cast(OH_ORDER_NUMBER as bigint) as varchar)                           as 'Reference'
         ,  case OH_BATCH_FLAG
               when 1 then 'B'
               else
                  ''
            end                                                                        as 'BatchFlag'
         ,  case
               when        OH_PRIORITY = 4
                     and   isnull(OH_PROBABILITY, 0) <> 0 then Nett * OH_PROBABILITY
               else
                  Nett
            end
         ,  case
               when        OH_PRIORITY = 4
                     and   isnull(OH_PROBABILITY, 0) <> 0 then Gross * OH_PROBABILITY
               else
                  Gross
            end
         ,  OH_CREDIT_CONTROLLER                                                       as 'CreditController'
         ,  dbo.AA_CALC_DUE_DATE_F
            (
               SLT_DUEDATE_TYPE
            ,  OH_DATE
            ,  case
                  when isnull(OH_DUE_DAYS, 0)   <> 0 then OH_DUE_DAYS
                  when isnull(SLT_DUE_DAYS, 0)  <> 0 then SLT_DUE_DAYS
                  else
                     0
               end
            )                                                                          as 'DueDate'
         ,  dbo.AA_CALC_ANT_DATE_F
            (
               CU_ANT_DAYS_FROM_DATES_OPT
            ,  case
                  when isnull(OH_A_P_DAYS, 0)   <> 0 then OH_A_P_DAYS
                  when isnull(CU_A_P_DAYS, 0)   <> 0 then CU_A_P_DAYS
                  else
                     0
               end
            ,  OH_DATE
            ,  dbo.AA_CALC_DUE_DATE_F
               (
                  SLT_DUEDATE_TYPE
               ,  OH_DATE
               ,  (
                     case
                        when isnull(OH_DUE_DAYS, 0)   <> 0 then OH_DUE_DAYS
                        when isnull(SLT_DUE_DAYS, 0)  <> 0 then SLT_DUE_DAYS
                        else
                           0
                     end
                  )
               )
            )                                                                          as 'ANTICPAYDATE'
            from
               ORD_HEADER
                  inner join  SL_ACCOUNTS on CUCODE      = OH_ACCOUNT_ORDER
                  inner join  SL_TERMS    on SLT_PRIMARY = CU_TERMS_LINK
                  inner join  (
                                 select
                                    OD_ORDER_NUMBER
                                 ,  sum
                                    (
                                       case OD_QTYINVD
                                          when 0 then OD_NETT - OD_T_DISCVAL
                                          else
                                             (OD_NETT - OD_T_DISCVAL)
                                             *
                                             (
                                                1
                                                -
                                                (
                                                   OD_QTYINVD
                                                   /
                                                   case OD_QTYORD
                                                      when 0 then 1
                                                      else
                                                         OD_QTYORD
                                                   end
                                                )
                                             )
                                       end
                                    )                                               as 'Nett'
                                 ,  sum
                                    (
                                       case OD_QTYINVD
                                          when 0 then OD_GROSS - OD_T_DISCVAL
                                          else
                                             (OD_GROSS - OD_T_DISCVAL)
                                             *
                                             (
                                                1
                                                -
                                                (
                                                   OD_QTYINVD
                                                   /
                                                   case OD_QTYORD
                                                      when 0 then 1
                                                      else
                                                         OD_QTYORD
                                                   end
                                                )
                                             )
                                       end
                                    )                                               as 'Gross'
                                    from
                                       ORD_DETAIL
                                    where
                                       OD_STATUS < 2
                                    group by
                                       OD_ORDER_NUMBER
                              ) DOrD on DOrD.OD_ORDER_NUMBER = OH_ORDER_NUMBER
      ) DerivedTable
   ,  (
         select
            sum(NOPENBALMONTH + N_INCOME - N_EXPENSES)   NL_BankBalance
            from
               NL_ACCOUNTS
            where
               NTYPE in ('B','P')
      )  NL_BankBalanceTable
   ,  (
         select
            sum(ST_UNALLOCATED)  SL_UnallocatedTransSum
            from
               SL_TRANSACTIONS
            where
                     ST_BATCH_FLAG    = 0
               and   ST_TRANTYPE      = 'PAY'
               and   ST_ALOC_POINTER  like '0%'
      )  SL_UnallocatedTransTable