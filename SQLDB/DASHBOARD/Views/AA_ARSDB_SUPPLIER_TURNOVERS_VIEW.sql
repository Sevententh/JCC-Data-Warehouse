create view DASHBOARD.AA_ARSDB_SUPPLIER_TURNOVERS_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as

select
       Suppliers.SupplierCode
      ,Suppliers.SupplierName
      ,Suppliers.SortKey
      ,Suppliers.UserSort1
      ,Suppliers.UserSort2
      ,Suppliers.UserSort3
      ,Suppliers.Balance
      ,Suppliers.TurnoverCYP1
      ,Suppliers.TurnoverCYP2
      ,Suppliers.TurnoverCYP3
      ,Suppliers.TurnoverCYP4
      ,Suppliers.TurnoverCYP5
      ,Suppliers.TurnoverCYP6
      ,Suppliers.TurnoverCYP7
      ,Suppliers.TurnoverCYP8
      ,Suppliers.TurnoverCYP9
      ,Suppliers.TurnoverCYP10
      ,Suppliers.TurnoverCYP11
      ,Suppliers.TurnoverCYP12
      ,Suppliers.TurnoverCYP13
      ,Suppliers.TurnoverLYP1
      ,Suppliers.TurnoverLYP2
      ,Suppliers.TurnoverLYP3
      ,Suppliers.TurnoverLYP4
      ,Suppliers.TurnoverLYP5
      ,Suppliers.TurnoverLYP6
      ,Suppliers.TurnoverLYP7
      ,Suppliers.TurnoverLYP8
      ,Suppliers.TurnoverLYP9
      ,Suppliers.TurnoverLYP10
      ,Suppliers.TurnoverLYP11
      ,Suppliers.TurnoverLYP12
      ,Suppliers.TurnoverLYP13
      ,d.PURCHASE_PERIOD                        CurrentPurchasePeriod
      ,Suppliers.TurnoverCYTD
      , Suppliers.TurnoverLYP1
         + case when d.PURCHASE_PERIOD >= 2 then Suppliers.TurnoverLYP2 else 0 end
         + case when d.PURCHASE_PERIOD >= 3 then Suppliers.TurnoverLYP3 else 0 end
         + case when d.PURCHASE_PERIOD >= 4 then Suppliers.TurnoverLYP4 else 0 end
         + case when d.PURCHASE_PERIOD >= 5 then Suppliers.TurnoverLYP5 else 0 end
         + case when d.PURCHASE_PERIOD >= 6 then Suppliers.TurnoverLYP6 else 0 end
         + case when d.PURCHASE_PERIOD >= 7 then Suppliers.TurnoverLYP7 else 0 end
         + case when d.PURCHASE_PERIOD >= 8 then Suppliers.TurnoverLYP8 else 0 end
         + case when d.PURCHASE_PERIOD >= 9 then Suppliers.TurnoverLYP9 else 0 end
         + case when d.PURCHASE_PERIOD >= 10 then Suppliers.TurnoverLYP10 else 0 end
         + case when d.PURCHASE_PERIOD >= 11 then Suppliers.TurnoverLYP11 else 0 end
         + case when d.PURCHASE_PERIOD >= 12 then Suppliers.TurnoverLYP12 else 0 end
         + case when d.PURCHASE_PERIOD >= 13then Suppliers.TurnoverLYP13 else 0 end
                                             TurnoverLYTD

      ,  Suppliers.TurnoverCYP1              TurnoverCYCP1
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2              TurnoverCYCP2
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3              TurnoverCYCP3
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4              TurnoverCYCP4
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5              TurnoverCYCP5
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6              TurnoverCYCP6
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7              TurnoverCYCP7
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7
       + Suppliers.TurnoverCYP8              TurnoverCYCP8
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7
       + Suppliers.TurnoverCYP8
       + Suppliers.TurnoverCYP9              TurnoverCYCP9
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7
       + Suppliers.TurnoverCYP8
       + Suppliers.TurnoverCYP9
       + Suppliers.TurnoverCYP10             TurnoverCYCP10
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7
       + Suppliers.TurnoverCYP8
       + Suppliers.TurnoverCYP9
       + Suppliers.TurnoverCYP10
       + Suppliers.TurnoverCYP11             TurnoverCYCP11
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7
       + Suppliers.TurnoverCYP8
       + Suppliers.TurnoverCYP9
       + Suppliers.TurnoverCYP10
       + Suppliers.TurnoverCYP11
       + Suppliers.TurnoverCYP12             TurnoverCYCP12
      ,  Suppliers.TurnoverCYP1
       + Suppliers.TurnoverCYP2
       + Suppliers.TurnoverCYP3
       + Suppliers.TurnoverCYP4
       + Suppliers.TurnoverCYP5
       + Suppliers.TurnoverCYP6
       + Suppliers.TurnoverCYP7
       + Suppliers.TurnoverCYP8
       + Suppliers.TurnoverCYP9
       + Suppliers.TurnoverCYP10
       + Suppliers.TurnoverCYP11
       + Suppliers.TurnoverCYP12
       + Suppliers.TurnoverCYP13             TurnoverCYCP13

      ,  Suppliers.TurnoverLYP1              TurnoverLYCP1
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2              TurnoverLYCP2
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3              TurnoverLYCP3
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4              TurnoverLYCP4
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5              TurnoverLYCP5
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6              TurnoverLYCP6
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7              TurnoverLYCP7
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7
       + Suppliers.TurnoverLYP8              TurnoverLYCP8
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7
       + Suppliers.TurnoverLYP8
       + Suppliers.TurnoverLYP9              TurnoverLYCP9
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7
       + Suppliers.TurnoverLYP8
       + Suppliers.TurnoverLYP9
       + Suppliers.TurnoverLYP10             TurnoverLYCP10
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7
       + Suppliers.TurnoverLYP8
       + Suppliers.TurnoverLYP9
       + Suppliers.TurnoverLYP10
       + Suppliers.TurnoverLYP11             TurnoverLYCP11
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7
       + Suppliers.TurnoverLYP8
       + Suppliers.TurnoverLYP9
       + Suppliers.TurnoverLYP10
       + Suppliers.TurnoverLYP11
       + Suppliers.TurnoverLYP12             TurnoverLYCP12
      ,  Suppliers.TurnoverLYP1
       + Suppliers.TurnoverLYP2
       + Suppliers.TurnoverLYP3
       + Suppliers.TurnoverLYP4
       + Suppliers.TurnoverLYP5
       + Suppliers.TurnoverLYP6
       + Suppliers.TurnoverLYP7
       + Suppliers.TurnoverLYP8
       + Suppliers.TurnoverLYP9
       + Suppliers.TurnoverLYP10
       + Suppliers.TurnoverLYP11
       + Suppliers.TurnoverLYP12
       + Suppliers.TurnoverLYP13             TurnoverLYCP13
   from
      (select
          s.SUCODE                                          SupplierCode
         ,s.SUNAME                                          SupplierName
         ,s.SUSORT                                          SortKey
         ,s.SUUSER1                                         UserSort1
         ,s.SUUSER2                                         UserSort2
         ,s.SUUSER3                                         UserSort3
         ,dbo.AA_VALUE_DPS_F(s.SUBALANCE)                   Balance
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVERYTD)               TurnoverCYTD
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C1)                TurnoverCYP1
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C2)                TurnoverCYP2
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C3)                TurnoverCYP3
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C4)                TurnoverCYP4
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C5)                TurnoverCYP5
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C6)                TurnoverCYP6
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C7)                TurnoverCYP7
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C8)                TurnoverCYP8
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C9)                TurnoverCYP9
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C10)               TurnoverCYP10
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C11)               TurnoverCYP11
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C12)               TurnoverCYP12
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_C13)               TurnoverCYP13
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L1)                TurnoverLYP1
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L2)                TurnoverLYP2
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L3)                TurnoverLYP3
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L4)                TurnoverLYP4
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L5)                TurnoverLYP5
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L6)                TurnoverLYP6
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L7)                TurnoverLYP7
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L8)                TurnoverLYP8
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L9)                TurnoverLYP9
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L10)               TurnoverLYP10
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L11)               TurnoverLYP11
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L12)               TurnoverLYP12
         ,dbo.AA_VALUE_DPS_F(s.SUTURNOVR_L13)               TurnoverLYP13
         from PL_ACCOUNTS s with (nolock)
      ) Suppliers
   cross join SYS_DATAINFO d with (nolock)
   where SYS_PRIMARY=1