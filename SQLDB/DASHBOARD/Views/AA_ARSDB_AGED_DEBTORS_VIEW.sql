create view DASHBOARD.AA_ARSDB_AGED_DEBTORS_VIEW
/*
** Written:       04/08/09 NC
** Last Amended:
**
**
*/
as

select
    c.CUCODE                                           CustomerCode
   ,c.CUNAME                                           CustomerName
   ,c.CUSORT                                           SortKey
   ,c.CUUSER1                                          UserSort1
   ,c.CUUSER2                                          UserSort2
   ,c.CUUSER3                                          UserSort3
   ,dbo.AA_VALUE_DPS_F(c.CUBALANCE)                    Balance
   ,case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)       Outstanding
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          >= s.Today - 30
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       OutstandingUpto30byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          between (s.Today - 60) and (s.Today - 31)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding31to60byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          between (s.Today - 90) and (s.Today - 61)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding61to90byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          between (s.Today - 120) and (s.Today - 91)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding91to120byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          between (s.Today - 180) and (s.Today - 121)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding121to180byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          < (s.Today - 180)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       OutstandingOver180byTransactionDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          >= s.Today - 30
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       OutstandingUpto30byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.ST_DUEDATE,t.ST_DATE))
          between (s.Today - 60) and (s.Today - 31)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding31to60byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.ST_DUEDATE,t.ST_DATE))
          between (s.Today - 90) and (s.Today - 61)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding61to90byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.ST_DUEDATE,t.ST_DATE))
          between (s.Today - 120) and (s.Today - 91)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding91to120byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.ST_DUEDATE,t.ST_DATE))
          between (s.Today - 180) and (s.Today - 121)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       Outstanding121to180byTransactionDueDate
   ,case
       when  dbo.AA_STRIP_TIME_FROM_DATE_F
         (isnull(t.ST_DUEDATE,t.ST_DATE))
          < (s.Today - 180)
       then case
               when t.ST_TRANTYPE in ('INV','ADR')
               then 1 else -1
            end
          * dbo.AA_VALUE_DPS_F(t.ST_UNALLOCATED)
       else 0
    end
                                                       OutstandingOver180byTransactionDueDate

   ,t.ST_TRANTYPE                                      TransactionType
   ,t.ST_HEADER_REF                                    TransactionRef
   ,t.ST_DESCRIPTION                                   TransactionDescription
   ,dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)           TransactionDate
   ,dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DUEDATE)        TransactionDueDate
   ,t.ST_PRIMARY                                       TransactionAuditNo
   ,t.ST_TRANTYPE + ' ' + t.ST_HEADER_REF
     + ' (' + convert(varchar,t.ST_PRIMARY) + ')'      TransactionInfo
   , convert(varchar
          , dbo.AA_STRIP_TIME_FROM_DATE_F(t.ST_DATE)
          ,3 )
     + ' ' + t.ST_TRANTYPE + ' ' + t.ST_HEADER_REF
     + ' (' + convert(varchar,t.ST_PRIMARY) + ')'      TransactionDateAndInfo

   from SL_ACCOUNTS c with (nolock)
      join SL_TRANSACTIONS t on t.ST_COPYCUST = c.CUCODE
     cross join
         (select dbo.AA_STRIP_TIME_FROM_DATE_F(getdate()) Today ) s
   where c.CUCODE <> ''
      and t.ST_ALOC_POINTER like '0%' and t.ST_BATCH_FLAG=0
