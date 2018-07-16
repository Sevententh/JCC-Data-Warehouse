create view DASHBOARD.AA_ARSDB_AGED_CREDITORS_VIEW
/*
** Written:       04/08/09 NC
** Last Amended:
**
**
*/
as

select
    s.SUCODE                                           SupplierCode
   ,s.SUNAME                                           SupplierName
   ,s.SUSORT                                           SortKey
   ,s.SUUSER1                                          UserSort1
   ,s.SUUSER2                                          UserSort2
   ,s.SUUSER3                                          UserSort3
   ,dbo.AA_VALUE_DPS_F(s.SUBALANCE)                    Balance
   ,case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)       Outstanding
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          >= sy.Today - 30
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       OutstandingUpto30byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          between (sy.Today - 60) and (sy.Today - 31)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding31to60byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          between (sy.Today - 90) and (sy.Today - 61)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding61to90byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          between (sy.Today - 120) and (sy.Today - 91)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding91to120byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          between (sy.Today - 180) and (sy.Today - 121)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding121to180byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          < (sy.Today - 180)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       OutstandingOver180byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          >= sy.Today - 30
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       OutstandingUpto30byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.PT_DUEDATE,t.PT_DATE))
          between (sy.Today - 60) and (sy.Today - 31)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding31to60byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.PT_DUEDATE,t.PT_DATE))
          between (sy.Today - 90) and (sy.Today - 61)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding61to90byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.PT_DUEDATE,t.PT_DATE))
          between (sy.Today - 120) and (sy.Today - 91)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding91to120byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.PT_DUEDATE,t.PT_DATE))
          between (sy.Today - 180) and (sy.Today - 121)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       Outstanding121to180byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.PT_DUEDATE,t.PT_DATE))
          < (sy.Today - 180)
       then case
               when t.PT_TRANTYPE in ('INV','ACR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.PT_UNALLOCATED)
       else 0
    end
                                                       OutstandingOver180byTransactionDueDate

   ,t.PT_TRANTYPE                                      TransactionType
   ,t.PT_HEADER_REF                                    TransactionRef
   ,t.PT_DESCRIPTION                                   TransactionDescription
   ,dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)           TransactionDate
   ,dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DUEDATE)        TransactionDueDate
   ,t.PT_PRIMARY                                       TransactionAuditNo
   ,t.PT_TRANTYPE + ' ' + t.PT_HEADER_REF
     + ' (' + convert(varchar,t.PT_PRIMARY) + ')'      TransactionInfo
   , convert(varchar
          , dbo.AA_STRIP_TIME_FROM_DATE_F(t.PT_DATE)
          ,3 )
     + ' ' + t.PT_TRANTYPE + ' ' + t.PT_HEADER_REF
     + ' (' + convert(varchar,t.PT_PRIMARY) + ')'      TransactionDateAndInfo

   from PL_ACCOUNTS s with (nolock)
      join PL_TRANSACTIONS t on t.PT_COPYSUPP = s.SUCODE
     cross join
         (select dbo.AA_STRIP_TIME_FROM_DATE_F(getdate()) Today ) sy
   where s.SUCODE <> ''
      and t.PT_ALOC_POINTER like '0%' and t.PT_BATCH_FLAG=0
