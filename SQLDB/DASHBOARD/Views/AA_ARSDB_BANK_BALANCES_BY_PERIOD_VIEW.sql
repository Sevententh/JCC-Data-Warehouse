create view DASHBOARD.AA_ARSDB_BANK_BALANCES_BY_PERIOD_VIEW
/*
** Written:       5/8/09 NC
** Last Amended:  6/8/09 NC. 24/08/09 NC
**
**
*/
as
select
    NominalCode
   ,NominalName
--   ,BankName
--   ,BankAccountName
--   ,BankAccountSortCode
--   ,BankAccountnumber
   ,Category1Code
   ,Category2Code
   ,Category3Code
   ,Category4Code
   ,Category5Code
   ,Category6Code
   ,Category7Code
   ,Category8Code
   ,Category1Name
   ,Category2Name
   ,Category3Name
   ,Category4Name
   ,Category5Name
   ,Category6Name
   ,Category7Name
   ,Category8Name
   ,d.NOMINAL_PERIOD                CurrentNominalPeriod
   ,convert(tinyint,Period)         Period
   ,case Period
      when 1 then left(datename(mm,d2.ENDDATE_P1),3)
      when 2 then left(datename(mm,d2.ENDDATE_P2),3)
      when 3 then left(datename(mm,d2.ENDDATE_P3),3)
      when 4 then left(datename(mm,d2.ENDDATE_P4),3)
      when 5 then left(datename(mm,d2.ENDDATE_P5),3)
      when 6 then left(datename(mm,d2.ENDDATE_P6),3)
      when 7 then left(datename(mm,d2.ENDDATE_P7),3)
      when 8 then left(datename(mm,d2.ENDDATE_P8),3)
      when 9 then left(datename(mm,d2.ENDDATE_P9),3)
      when 10 then left(datename(mm,d2.ENDDATE_P10),3)
      when 11 then left(datename(mm,d2.ENDDATE_P11),3)
      when 12 then left(datename(mm,d2.ENDDATE_P12),3)
      when 13 then left(datename(mm,isnull(d2.ENDDATE_P13,'')),3)
      else ''
    end Month
   ,CurrentYearPeriodTurnover
   ,case Period
      when 1 then TurnoverLYP1
      when 2 then TurnoverLYP2
      when 3 then TurnoverLYP3
      when 4 then TurnoverLYP4
      when 5 then TurnoverLYP5
      when 6 then TurnoverLYP6
      when 7 then TurnoverLYP7
      when 8 then TurnoverLYP8
      when 9 then TurnoverLYP9
      when 10 then TurnoverLYP10
      when 11 then TurnoverLYP11
      when 12 then TurnoverLYP12
      when 13 then TurnoverLYP13
   end
    LastYearPeriodTurnover
   ,case Period
      when 1  then TurnoverNYP1
      when 2  then TurnoverNYP2
      when 3  then TurnoverNYP3
      when 4  then TurnoverNYP4
      when 5  then TurnoverNYP5
      when 6  then TurnoverNYP6
      when 7  then TurnoverNYP7
      when 8  then TurnoverNYP8
      when 9  then TurnoverNYP9
      when 10 then TurnoverNYP10
      when 11 then TurnoverNYP11
      when 12 then TurnoverNYP12
      when 13 then TurnoverNYP13
   end
    NextYearPeriodTurnover

   ,case Period
      when 1 then BudgetCYP1
      when 2 then BudgetCYP2
      when 3 then BudgetCYP3
      when 4 then BudgetCYP4
      when 5 then BudgetCYP5
      when 6 then BudgetCYP6
      when 7 then BudgetCYP7
      when 8 then BudgetCYP8
      when 9 then BudgetCYP9
      when 10 then BudgetCYP10
      when 11 then BudgetCYP11
      when 12 then BudgetCYP12
      when 13 then BudgetCYP13
   end
    CurrentYearPeriodBudget

   ,case Period
      when 1 then BudgetLYP1
      when 2 then BudgetLYP2
      when 3 then BudgetLYP3
      when 4 then BudgetLYP4
      when 5 then BudgetLYP5
      when 6 then BudgetLYP6
      when 7 then BudgetLYP7
      when 8 then BudgetLYP8
      when 9 then BudgetLYP9
      when 10 then BudgetLYP10
      when 11 then BudgetLYP11
      when 12 then BudgetLYP12
      when 13 then BudgetLYP13
   end
    LastYearPeriodBudget

   ,case Period
      when 1  then BudgetNYP1
      when 2  then BudgetNYP2
      when 3  then BudgetNYP3
      when 4  then BudgetNYP4
      when 5  then BudgetNYP5
      when 6  then BudgetNYP6
      when 7  then BudgetNYP7
      when 8  then BudgetNYP8
      when 9  then BudgetNYP9
      when 10 then BudgetNYP10
      when 11 then BudgetNYP11
      when 12 then BudgetNYP12
      when 13 then BudgetNYP13
   end
    NextYearPeriodBudget

  , CurrentYearOpeningBalance + TurnoverCYP1
    + case when Period >=2  then TurnoverCYP2  else 0 end
    + case when Period >=3  then TurnoverCYP3  else 0 end
    + case when Period >=4  then TurnoverCYP4  else 0 end
    + case when Period >=5  then TurnoverCYP5  else 0 end
    + case when Period >=6  then TurnoverCYP6  else 0 end
    + case when Period >=7  then TurnoverCYP7  else 0 end
    + case when Period >=8  then TurnoverCYP8  else 0 end
    + case when Period >=9  then TurnoverCYP9  else 0 end
    + case when Period >=10 then TurnoverCYP10 else 0 end
    + case when Period >=11 then TurnoverCYP11 else 0 end
    + case when Period >=12 then TurnoverCYP12 else 0 end
    + case when Period >=13 then TurnoverCYP13 else 0 end
     CurrentYearPeriodBalance
   , LastYearOpeningBalance + TurnoverLYP1
    + case when Period >=2  then TurnoverLYP2  else 0 end
    + case when Period >=3  then TurnoverLYP3  else 0 end
    + case when Period >=4  then TurnoverLYP4  else 0 end
    + case when Period >=5  then TurnoverLYP5  else 0 end
    + case when Period >=6  then TurnoverLYP6  else 0 end
    + case when Period >=7  then TurnoverLYP7  else 0 end
    + case when Period >=8  then TurnoverLYP8  else 0 end
    + case when Period >=9  then TurnoverLYP9  else 0 end
    + case when Period >=10 then TurnoverLYP10 else 0 end
    + case when Period >=11 then TurnoverLYP11 else 0 end
    + case when Period >=12 then TurnoverLYP12 else 0 end
    + case when Period >=13 then TurnoverLYP13 else 0 end
     LastYearPeriodBalance
   , CurrentYearOpeningBalance
    + TurnoverCYP1
    + TurnoverCYP2
    + TurnoverCYP3
    + TurnoverCYP4
    + TurnoverCYP5
    + TurnoverCYP6
    + TurnoverCYP7
    + TurnoverCYP8
    + TurnoverCYP9
    + TurnoverCYP10
    + TurnoverCYP11
    + TurnoverCYP12
    + TurnoverCYP13
    + TurnoverNYP1
    + case when Period >=2  then TurnoverNYP2  else 0 end
    + case when Period >=3  then TurnoverNYP3  else 0 end
    + case when Period >=4  then TurnoverNYP4  else 0 end
    + case when Period >=5  then TurnoverNYP5  else 0 end
    + case when Period >=6  then TurnoverNYP6  else 0 end
    + case when Period >=7  then TurnoverNYP7  else 0 end
    + case when Period >=8  then TurnoverNYP8  else 0 end
    + case when Period >=9  then TurnoverNYP9  else 0 end
    + case when Period >=10 then TurnoverNYP10 else 0 end
    + case when Period >=11 then TurnoverNYP11 else 0 end
    + case when Period >=12 then TurnoverNYP12 else 0 end
    + case when Period >=13 then TurnoverNYP13 else 0 end
     NextYearPeriodBalance

   , TurnoverCYP1
    + case when Period >=2  then TurnoverCYP2  else 0 end
    + case when Period >=3  then TurnoverCYP3  else 0 end
    + case when Period >=4  then TurnoverCYP4  else 0 end
    + case when Period >=5  then TurnoverCYP5  else 0 end
    + case when Period >=6  then TurnoverCYP6  else 0 end
    + case when Period >=7  then TurnoverCYP7  else 0 end
    + case when Period >=8  then TurnoverCYP8  else 0 end
    + case when Period >=9  then TurnoverCYP9  else 0 end
    + case when Period >=10 then TurnoverCYP10 else 0 end
    + case when Period >=11 then TurnoverCYP11 else 0 end
    + case when Period >=12 then TurnoverCYP12 else 0 end
    + case when Period >=13 then TurnoverCYP13 else 0 end
     PeriodCurrentYearToDate
   , TurnoverLYP1
    + case when Period >=2  then TurnoverLYP2  else 0 end
    + case when Period >=3  then TurnoverLYP3  else 0 end
    + case when Period >=4  then TurnoverLYP4  else 0 end
    + case when Period >=5  then TurnoverLYP5  else 0 end
    + case when Period >=6  then TurnoverLYP6  else 0 end
    + case when Period >=7  then TurnoverLYP7  else 0 end
    + case when Period >=8  then TurnoverLYP8  else 0 end
    + case when Period >=9  then TurnoverLYP9  else 0 end
    + case when Period >=10 then TurnoverLYP10 else 0 end
    + case when Period >=11 then TurnoverLYP11 else 0 end
    + case when Period >=12 then TurnoverLYP12 else 0 end
    + case when Period >=13 then TurnoverLYP13 else 0 end
     PeriodLastYearToDate
   , TurnoverNYP1
    + case when Period >=2  then TurnoverNYP2  else 0 end
    + case when Period >=3  then TurnoverNYP3  else 0 end
    + case when Period >=4  then TurnoverNYP4  else 0 end
    + case when Period >=5  then TurnoverNYP5  else 0 end
    + case when Period >=6  then TurnoverNYP6  else 0 end
    + case when Period >=7  then TurnoverNYP7  else 0 end
    + case when Period >=8  then TurnoverNYP8  else 0 end
    + case when Period >=9  then TurnoverNYP9  else 0 end
    + case when Period >=10 then TurnoverNYP10 else 0 end
    + case when Period >=11 then TurnoverNYP11 else 0 end
    + case when Period >=12 then TurnoverNYP12 else 0 end
    + case when Period >=13 then TurnoverNYP13 else 0 end
     PeriodNextYearToDate
 , CurrentToDateReceipts
 , CurrentToDatePayments
from
   (select
          n.NCODE                                           NominalCode
         ,n.NNAME                                           NominalName
--         ,isnull(b.N_BD_NAME,'')                            BankName
--         ,isnull(b.N_BD_AC_NAME,'')                         BankAccountName
--         ,isnull(b.N_BD_SORT,'')                            BankAccountSortCode
--         ,isnull(b.N_BD_AC_NO,'')                           BankAccountnumber
         ,n.NCATEGORYCODE1                                  Category1Code
         ,n.NCATEGORYCODE2                                  Category2Code
         ,n.NCATEGORYCODE3                                  Category3Code
         ,n.NCATEGORYCODE4                                  Category4Code
         ,n.NCATEGORYCODE5                                  Category5Code
         ,n.NCATEGORYCODE6                                  Category6Code
         ,n.NCATEGORYCODE7                                  Category7Code
         ,n.NCATEGORYCODE8                                  Category8Code
         ,isnull(c1.NCAT_NAME,'')                           Category1Name
         ,isnull(c2.NCAT_NAME,'')                           Category2Name
         ,isnull(c3.NCAT_NAME,'')                           Category3Name
         ,isnull(c4.NCAT_NAME,'')                           Category4Name
         ,isnull(c5.NCAT_NAME,'')                           Category5Name
         ,isnull(c6.NCAT_NAME,'')                           Category6Name
         ,isnull(c7.NCAT_NAME,'')                           Category7Name
         ,isnull(c8.NCAT_NAME,'')                           Category8Name
         ,dbo.AA_VALUE_DPS_F(n.NOPENBALYEAR)                CurrentYearOpeningBalance
         ,dbo.AA_VALUE_DPS_F(n.NOPENBALANCELY)              LastYearOpeningBalance
         ,dbo.AA_VALUE_DPS_F(n.N_INCOME)                    CurrentToDateReceipts
         ,dbo.AA_VALUE_DPS_F(n.N_EXPENSES)                  CurrentToDatePayments

         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C1)                  BudgetCYP1
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C2)                  BudgetCYP2
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C3)                  BudgetCYP3
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C4)                  BudgetCYP4
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C5)                  BudgetCYP5
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C6)                  BudgetCYP6
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C7)                  BudgetCYP7
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C8)                  BudgetCYP8
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C9)                  BudgetCYP9
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C10)                 BudgetCYP10
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C11)                 BudgetCYP11
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C12)                 BudgetCYP12
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_C13)                 BudgetCYP13
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L1)                  BudgetLYP1
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L2)                  BudgetLYP2
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L3)                  BudgetLYP3
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L4)                  BudgetLYP4
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L5)                  BudgetLYP5
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L6)                  BudgetLYP6
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L7)                  BudgetLYP7
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L8)                  BudgetLYP8
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L9)                  BudgetLYP9
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L10)                 BudgetLYP10
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L11)                 BudgetLYP11
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L12)                 BudgetLYP12
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_L13)                 BudgetLYP13
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N1)                  BudgetNYP1
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N2)                  BudgetNYP2
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N3)                  BudgetNYP3
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N4)                  BudgetNYP4
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N5)                  BudgetNYP5
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N6)                  BudgetNYP6
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N7)                  BudgetNYP7
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N8)                  BudgetNYP8
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N9)                  BudgetNYP9
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N10)                 BudgetNYP10
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N11)                 BudgetNYP11
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N12)                 BudgetNYP12
         ,dbo.AA_VALUE_DPS_F(n.NBUDGET_N13)                 BudgetNYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1)                TurnoverCYP1
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2)                TurnoverCYP2
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3)                TurnoverCYP3
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4)                TurnoverCYP4
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5)                TurnoverCYP5
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6)                TurnoverCYP6
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7)                TurnoverCYP7
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8)                TurnoverCYP8
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9)                TurnoverCYP9
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10)               TurnoverCYP10
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11)               TurnoverCYP11
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12)               TurnoverCYP12
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13)               TurnoverCYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L1)                TurnoverLYP1
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L2)                TurnoverLYP2
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L3)                TurnoverLYP3
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L4)                TurnoverLYP4
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L5)                TurnoverLYP5
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L6)                TurnoverLYP6
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L7)                TurnoverLYP7
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L8)                TurnoverLYP8
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L9)                TurnoverLYP9
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L10)               TurnoverLYP10
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L11)               TurnoverLYP11
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L12)               TurnoverLYP12
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L13)               TurnoverLYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N1)                TurnoverNYP1
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N2)                TurnoverNYP2
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N3)                TurnoverNYP3
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N4)                TurnoverNYP4
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N5)                TurnoverNYP5
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N6)                TurnoverNYP6
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N7)                TurnoverNYP7
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N8)                TurnoverNYP8
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N9)                TurnoverNYP9
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N10)               TurnoverNYP10
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N11)               TurnoverNYP11
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N12)               TurnoverNYP12
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N13)               TurnoverNYP13
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1)                [1]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2)                [2]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3)                [3]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4)                [4]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5)                [5]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6)                [6]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7)                [7]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8)                [8]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9)                [9]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10)               [10]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11)               [11]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12)               [12]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13)               [13]
      from NL_ACCOUNTS n with (nolock)
--         left join NL_BANK_DETAILS b on b.N_BD_NL_ACCOUNT_LINK = n.N_PRIMARY
         left join NL_CATEGORIES c1 on c1.NCAT_CODE = n.NCATEGORYCODE1 and c1.NCAT_NUMBER = 1
         left join NL_CATEGORIES c2 on c2.NCAT_CODE = n.NCATEGORYCODE2 and c2.NCAT_NUMBER = 2
         left join NL_CATEGORIES c3 on c3.NCAT_CODE = n.NCATEGORYCODE3 and c3.NCAT_NUMBER = 3
         left join NL_CATEGORIES c4 on c4.NCAT_CODE = n.NCATEGORYCODE4 and c4.NCAT_NUMBER = 4
         left join NL_CATEGORIES c5 on c5.NCAT_CODE = n.NCATEGORYCODE5 and c5.NCAT_NUMBER = 5
         left join NL_CATEGORIES c6 on c6.NCAT_CODE = n.NCATEGORYCODE6 and c6.NCAT_NUMBER = 6
         left join NL_CATEGORIES c7 on c7.NCAT_CODE = n.NCATEGORYCODE7 and c7.NCAT_NUMBER = 7
         left join NL_CATEGORIES c8 on c8.NCAT_CODE = n.NCATEGORYCODE8 and c8.NCAT_NUMBER = 8
      where n.NTYPE = 'B'
   ) p
UNPIVOT
   (CurrentYearPeriodTurnover FOR Period IN
      ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13])
   )AS unpvt
   cross join SYS_DATAINFO d with (nolock)
   cross join SYS_DATAINFO2 d2 with (nolock)
   where d.SYS_PRIMARY=1 and d2.SYS_PRIMARY_2=1
