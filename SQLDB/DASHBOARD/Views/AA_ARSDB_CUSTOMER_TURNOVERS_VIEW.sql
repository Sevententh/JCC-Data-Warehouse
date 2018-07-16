create view DASHBOARD.AA_ARSDB_CUSTOMER_TURNOVERS_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as

select
       Customers.CustomerCode
      ,Customers.CustomerName
      ,Customers.SortKey
      ,Customers.UserSort1
      ,Customers.UserSort2
      ,Customers.UserSort3
      ,Customers.Balance
      ,Customers.TurnoverCYP1
      ,Customers.TurnoverCYP2
      ,Customers.TurnoverCYP3
      ,Customers.TurnoverCYP4
      ,Customers.TurnoverCYP5
      ,Customers.TurnoverCYP6
      ,Customers.TurnoverCYP7
      ,Customers.TurnoverCYP8
      ,Customers.TurnoverCYP9
      ,Customers.TurnoverCYP10
      ,Customers.TurnoverCYP11
      ,Customers.TurnoverCYP12
      ,Customers.TurnoverCYP13
      ,Customers.TurnoverLYP1
      ,Customers.TurnoverLYP2
      ,Customers.TurnoverLYP3
      ,Customers.TurnoverLYP4
      ,Customers.TurnoverLYP5
      ,Customers.TurnoverLYP6
      ,Customers.TurnoverLYP7
      ,Customers.TurnoverLYP8
      ,Customers.TurnoverLYP9
      ,Customers.TurnoverLYP10
      ,Customers.TurnoverLYP11
      ,Customers.TurnoverLYP12
      ,Customers.TurnoverLYP13
      ,d.SALES_PERIOD                        CurrentSalesPeriod
      ,Customers.TurnoverCYTD
      , Customers.TurnoverLYP1
         + case when d.SALES_PERIOD >= 2 then Customers.TurnoverLYP2 else 0 end
         + case when d.SALES_PERIOD >= 3 then Customers.TurnoverLYP3 else 0 end
         + case when d.SALES_PERIOD >= 4 then Customers.TurnoverLYP4 else 0 end
         + case when d.SALES_PERIOD >= 5 then Customers.TurnoverLYP5 else 0 end
         + case when d.SALES_PERIOD >= 6 then Customers.TurnoverLYP6 else 0 end
         + case when d.SALES_PERIOD >= 7 then Customers.TurnoverLYP7 else 0 end
         + case when d.SALES_PERIOD >= 8 then Customers.TurnoverLYP8 else 0 end
         + case when d.SALES_PERIOD >= 9 then Customers.TurnoverLYP9 else 0 end
         + case when d.SALES_PERIOD >= 10 then Customers.TurnoverLYP10 else 0 end
         + case when d.SALES_PERIOD >= 11 then Customers.TurnoverLYP11 else 0 end
         + case when d.SALES_PERIOD >= 12 then Customers.TurnoverLYP12 else 0 end
         + case when d.SALES_PERIOD >= 13then Customers.TurnoverLYP13 else 0 end
                                             TurnoverLYTD

      ,  Customers.TurnoverCYP1              TurnoverCYCP1
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2              TurnoverCYCP2
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3              TurnoverCYCP3
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4              TurnoverCYCP4
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5              TurnoverCYCP5
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6              TurnoverCYCP6
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7              TurnoverCYCP7
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7
       + Customers.TurnoverCYP8              TurnoverCYCP8
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7
       + Customers.TurnoverCYP8
       + Customers.TurnoverCYP9              TurnoverCYCP9
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7
       + Customers.TurnoverCYP8
       + Customers.TurnoverCYP9
       + Customers.TurnoverCYP10             TurnoverCYCP10
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7
       + Customers.TurnoverCYP8
       + Customers.TurnoverCYP9
       + Customers.TurnoverCYP10
       + Customers.TurnoverCYP11             TurnoverCYCP11
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7
       + Customers.TurnoverCYP8
       + Customers.TurnoverCYP9
       + Customers.TurnoverCYP10
       + Customers.TurnoverCYP11
       + Customers.TurnoverCYP12             TurnoverCYCP12
      ,  Customers.TurnoverCYP1
       + Customers.TurnoverCYP2
       + Customers.TurnoverCYP3
       + Customers.TurnoverCYP4
       + Customers.TurnoverCYP5
       + Customers.TurnoverCYP6
       + Customers.TurnoverCYP7
       + Customers.TurnoverCYP8
       + Customers.TurnoverCYP9
       + Customers.TurnoverCYP10
       + Customers.TurnoverCYP11
       + Customers.TurnoverCYP12
       + Customers.TurnoverCYP13             TurnoverCYCP13

      ,  Customers.TurnoverLYP1              TurnoverLYCP1
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2              TurnoverLYCP2
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3              TurnoverLYCP3
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4              TurnoverLYCP4
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5              TurnoverLYCP5
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6              TurnoverLYCP6
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7              TurnoverLYCP7
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7
       + Customers.TurnoverLYP8              TurnoverLYCP8
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7
       + Customers.TurnoverLYP8
       + Customers.TurnoverLYP9              TurnoverLYCP9
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7
       + Customers.TurnoverLYP8
       + Customers.TurnoverLYP9
       + Customers.TurnoverLYP10             TurnoverLYCP10
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7
       + Customers.TurnoverLYP8
       + Customers.TurnoverLYP9
       + Customers.TurnoverLYP10
       + Customers.TurnoverLYP11             TurnoverLYCP11
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7
       + Customers.TurnoverLYP8
       + Customers.TurnoverLYP9
       + Customers.TurnoverLYP10
       + Customers.TurnoverLYP11
       + Customers.TurnoverLYP12             TurnoverLYCP12
      ,  Customers.TurnoverLYP1
       + Customers.TurnoverLYP2
       + Customers.TurnoverLYP3
       + Customers.TurnoverLYP4
       + Customers.TurnoverLYP5
       + Customers.TurnoverLYP6
       + Customers.TurnoverLYP7
       + Customers.TurnoverLYP8
       + Customers.TurnoverLYP9
       + Customers.TurnoverLYP10
       + Customers.TurnoverLYP11
       + Customers.TurnoverLYP12
       + Customers.TurnoverLYP13             TurnoverLYCP13
   from
      (select
          c.CUCODE                                          CustomerCode
         ,c.CUNAME                                          CustomerName
         ,c.CUSORT                                          SortKey
         ,c.CUUSER1                                         UserSort1
         ,c.CUUSER2                                         UserSort2
         ,c.CUUSER3                                         UserSort3
         ,dbo.AA_VALUE_DPS_F(c.CUBALANCE)                   Balance
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVERYTD)               TurnoverCYTD
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C1)                TurnoverCYP1
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C2)                TurnoverCYP2
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C3)                TurnoverCYP3
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C4)                TurnoverCYP4
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C5)                TurnoverCYP5
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C6)                TurnoverCYP6
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C7)                TurnoverCYP7
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C8)                TurnoverCYP8
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C9)                TurnoverCYP9
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C10)               TurnoverCYP10
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C11)               TurnoverCYP11
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C12)               TurnoverCYP12
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_C13)               TurnoverCYP13
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L1)                TurnoverLYP1
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L2)                TurnoverLYP2
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L3)                TurnoverLYP3
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L4)                TurnoverLYP4
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L5)                TurnoverLYP5
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L6)                TurnoverLYP6
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L7)                TurnoverLYP7
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L8)                TurnoverLYP8
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L9)                TurnoverLYP9
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L10)               TurnoverLYP10
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L11)               TurnoverLYP11
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L12)               TurnoverLYP12
         ,dbo.AA_VALUE_DPS_F(c.CUTURNOVR_L13)               TurnoverLYP13
         from SL_ACCOUNTS c with (nolock)
         where c.CUCODE <> ''
      ) Customers
   cross join SYS_DATAINFO d with (nolock)
   where SYS_PRIMARY=1