create view DASHBOARD.AA_ARSDB_NOMINAL_TURNOVERS_BY_YEAR_PERIOD_VIEW
/*
** Written:       06/8/09 NC
** Last Amended:  24/8/09 NC
**
**
*/
as
select
    NominalCode
   ,NominalName
   ,NominalType
   ,StockControlAccount
   ,MajorHeadingNumber
   ,MajorHeadingName
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
   ,Balance
   ,d.NOMINAL_PERIOD                CurrentNominalPeriod
   ,convert(tinyint
               ,case
                  when PeriodSort>26
                  then PeriodSort-26
                  when PeriodSort>13
                  then PeriodSort-13
                  else PeriodSort
                end
           )
                                    Period
   ,case when PeriodSort > 13
         then cy.YEAR_LABEL
         else ly.YEAR_LABEL
    end                             YearLabel

   ,case PeriodSort
      when 1 then datename(yy,d2.ENDDATE_P1) - 1
      when 2 then datename(yy,d2.ENDDATE_P2) - 1
      when 3 then datename(yy,d2.ENDDATE_P3) - 1
      when 4 then datename(yy,d2.ENDDATE_P4) - 1
      when 5 then datename(yy,d2.ENDDATE_P5) - 1
      when 6 then datename(yy,d2.ENDDATE_P6) - 1
      when 7 then datename(yy,d2.ENDDATE_P7) - 1
      when 8 then datename(yy,d2.ENDDATE_P8) - 1
      when 9 then datename(yy,d2.ENDDATE_P9) - 1
      when 10 then datename(yy,d2.ENDDATE_P10) - 1
      when 11 then datename(yy,d2.ENDDATE_P11) - 1
      when 12 then datename(yy,d2.ENDDATE_P12) - 1
      when 13 then datename(yy,isnull(d2.ENDDATE_P13,ENDDATE_P12)) - 1
      when 14 then datename(yy,d2.ENDDATE_P1)
      when 15 then datename(yy,d2.ENDDATE_P2)
      when 16 then datename(yy,d2.ENDDATE_P3)
      when 17 then datename(yy,d2.ENDDATE_P4)
      when 18 then datename(yy,d2.ENDDATE_P5)
      when 19 then datename(yy,d2.ENDDATE_P6)
      when 20 then datename(yy,d2.ENDDATE_P7)
      when 21 then datename(yy,d2.ENDDATE_P8)
      when 22 then datename(yy,d2.ENDDATE_P9)
      when 23 then datename(yy,d2.ENDDATE_P10)
      when 24 then datename(yy,d2.ENDDATE_P11)
      when 25 then datename(yy,d2.ENDDATE_P12)
      when 26 then datename(yy,isnull(d2.ENDDATE_P13,ENDDATE_P12))
      when 27 then datename(yy,d2.ENDDATE_P1) + 1
      when 28 then datename(yy,d2.ENDDATE_P2) + 1
      when 29 then datename(yy,d2.ENDDATE_P3) + 1
      when 30 then datename(yy,d2.ENDDATE_P4) + 1
      when 31 then datename(yy,d2.ENDDATE_P5) + 1
      when 32 then datename(yy,d2.ENDDATE_P6) + 1
      when 33 then datename(yy,d2.ENDDATE_P7) + 1
      when 34 then datename(yy,d2.ENDDATE_P8) + 1
      when 35 then datename(yy,d2.ENDDATE_P9) + 1
      when 36 then datename(yy,d2.ENDDATE_P10) + 1
      when 37 then datename(yy,d2.ENDDATE_P11) + 1
      when 38 then datename(yy,d2.ENDDATE_P12) + 1
      when 39 then datename(yy,isnull(d2.ENDDATE_P13,ENDDATE_P12)) + 1
      else ''
    end
                                    PeriodYear
   ,case PeriodSort
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
      when 13 then case when d2.ENDDATE_P13 is NULL then '' else left(datename(mm,d2.ENDDATE_P13),3) end
      when 14 then left(datename(mm,d2.ENDDATE_P1),3)
      when 15 then left(datename(mm,d2.ENDDATE_P2),3)
      when 16 then left(datename(mm,d2.ENDDATE_P3),3)
      when 17 then left(datename(mm,d2.ENDDATE_P4),3)
      when 18 then left(datename(mm,d2.ENDDATE_P5),3)
      when 19 then left(datename(mm,d2.ENDDATE_P6),3)
      when 20 then left(datename(mm,d2.ENDDATE_P7),3)
      when 21 then left(datename(mm,d2.ENDDATE_P8),3)
      when 22 then left(datename(mm,d2.ENDDATE_P9),3)
      when 23 then left(datename(mm,d2.ENDDATE_P10),3)
      when 24 then left(datename(mm,d2.ENDDATE_P11),3)
      when 25 then left(datename(mm,d2.ENDDATE_P12),3)
      when 26 then case when d2.ENDDATE_P13 is NULL then '' else left(datename(mm,d2.ENDDATE_P13),3) end
      when 27 then left(datename(mm,d2.ENDDATE_P1),3)
      when 28 then left(datename(mm,d2.ENDDATE_P2),3)
      when 29 then left(datename(mm,d2.ENDDATE_P3),3)
      when 30 then left(datename(mm,d2.ENDDATE_P4),3)
      when 31 then left(datename(mm,d2.ENDDATE_P5),3)
      when 32 then left(datename(mm,d2.ENDDATE_P6),3)
      when 33 then left(datename(mm,d2.ENDDATE_P7),3)
      when 34 then left(datename(mm,d2.ENDDATE_P8),3)
      when 35 then left(datename(mm,d2.ENDDATE_P9),3)
      when 36 then left(datename(mm,d2.ENDDATE_P10),3)
      when 37 then left(datename(mm,d2.ENDDATE_P11),3)
      when 38 then left(datename(mm,d2.ENDDATE_P12),3)
      when 39 then case when d2.ENDDATE_P13 is NULL then '' else left(datename(mm,d2.ENDDATE_P13),3) end
      else ''
    end Month
   ,PeriodTurnover

   ,case PeriodSort
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
      when 14 then BudgetLYP1
      when 15 then BudgetLYP2
      when 16 then BudgetLYP3
      when 17 then BudgetLYP4
      when 18 then BudgetLYP5
      when 19 then BudgetLYP6
      when 20 then BudgetLYP7
      when 21 then BudgetLYP8
      when 22 then BudgetLYP9
      when 23 then BudgetLYP10
      when 24 then BudgetLYP11
      when 25 then BudgetLYP12
      when 26 then BudgetLYP13
      when 27 then BudgetNYP1
      when 28 then BudgetNYP2
      when 29 then BudgetNYP3
      when 30 then BudgetNYP4
      when 31 then BudgetNYP5
      when 32 then BudgetNYP6
      when 33 then BudgetNYP7
      when 34 then BudgetNYP8
      when 35 then BudgetNYP9
      when 36 then BudgetNYP10
      when 37 then BudgetNYP11
      when 38 then BudgetNYP12
      when 39 then BudgetNYP13
   end
    PeriodBudget


from
   (select
          n.NCODE                                           NominalCode
         ,n.NNAME                                           NominalName
         ,n.NTYPE                                           NominalType
         ,case when n.NCODE = t.CURREC_NOM_STOCK_CONTROL
            then 1 else 0
          end                                               StockControlAccount
         ,n.NMAJORHEADCODE                                  MajorHeadingNumber
         ,m.NL_MAJORNAME                                    MajorHeadingName
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
         ,dbo.AA_VALUE_DPS_F(n.NBALANCE)                    Balance
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
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L1)                [1]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L2)                [2]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L3)                [3]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L4)                [4]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L5)                [5]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L6)                [6]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L7)                [7]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L8)                [8]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L9)                [9]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L10)               [10]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L11)               [11]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L12)               [12]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_L13)               [13]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C1)                [14]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C2)                [15]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C3)                [16]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C4)                [17]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C5)                [18]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C6)                [19]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C7)                [20]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C8)                [21]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C9)                [22]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C10)               [23]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C11)               [24]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C12)               [25]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_C13)               [26]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N1)                [27]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N2)                [28]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N3)                [29]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N4)                [30]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N5)                [31]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N6)                [32]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N7)                [33]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N8)                [34]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N9)                [35]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N10)               [36]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N11)               [37]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N12)               [38]
         ,dbo.AA_VALUE_DPS_F(n.NTURNOVER_N13)               [39]
      from NL_ACCOUNTS n with (nolock)
         join NL_MAJORHEADING m with (nolock) on m.NL_MAJORCODE = n.NMAJORHEADCODE
         left join NL_CATEGORIES c1 on c1.NCAT_CODE = n.NCATEGORYCODE1 and c1.NCAT_NUMBER = 1
         left join NL_CATEGORIES c2 on c2.NCAT_CODE = n.NCATEGORYCODE2 and c2.NCAT_NUMBER = 2
         left join NL_CATEGORIES c3 on c3.NCAT_CODE = n.NCATEGORYCODE3 and c3.NCAT_NUMBER = 3
         left join NL_CATEGORIES c4 on c4.NCAT_CODE = n.NCATEGORYCODE4 and c4.NCAT_NUMBER = 4
         left join NL_CATEGORIES c5 on c5.NCAT_CODE = n.NCATEGORYCODE5 and c5.NCAT_NUMBER = 5
         left join NL_CATEGORIES c6 on c6.NCAT_CODE = n.NCATEGORYCODE6 and c6.NCAT_NUMBER = 6
         left join NL_CATEGORIES c7 on c7.NCAT_CODE = n.NCATEGORYCODE7 and c7.NCAT_NUMBER = 7
         left join NL_CATEGORIES c8 on c8.NCAT_CODE = n.NCATEGORYCODE8 and c8.NCAT_NUMBER = 8
         left join SYS_CURRENCY_REC t with (nolock) on t.CURREC_CURRENCY_TYPE = 'H'
   ) p
UNPIVOT
   (PeriodTurnover FOR PeriodSort IN
      ( [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13]
       ,[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26]
       ,[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39]
      )
   )AS unpvt
   cross join SYS_DATAINFO d with (nolock)
   cross join SYS_DATAINFO2 d2 with (nolock)
   join SYS_YEAR cy with (nolock) on cy.YEAR_NOMINAL = 0
   join SYS_YEAR ly with (nolock) on ly.YEAR_NOMINAL = -1
   where d.SYS_PRIMARY=1 and d2.SYS_PRIMARY_2=1
