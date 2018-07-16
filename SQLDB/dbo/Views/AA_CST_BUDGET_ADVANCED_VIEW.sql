create view AA_CST_BUDGET_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_CST_BUDGET_LIST_S
** Written:      13/01/2006 SH
** Last Amended: 08/02/2006 SH, 08/03/2006 SH
**
*/
as

select space(isnull(CPN_NODE_LEVEL,0)*3) + M.CCM_CODE + ' - ' + M.CCM_NAME as CC_CONCAT,

   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 1 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 1 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK1_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 2 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 2 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK2_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 3 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 3 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK3_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 4 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 4 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK4_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 5 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 5 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK5_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 6 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 6 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK6_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 7 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 7 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK7_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 8 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 8 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK8_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 9 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 9 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK9_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 10 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 10 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK10_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 11 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 11 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK11_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 12 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 12 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK12_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 13 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 13 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK13_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 14 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 14 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK14_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 15 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 15 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK15_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 16 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 16 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK16_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 17 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 17 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK17_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 18 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 18 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK18_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 19 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 19 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK19_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 20 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 20 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK20_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 21 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 21 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK21_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 22 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 22 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK22_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 23 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 23 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK23_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 24 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 24 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK24_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 25 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 25 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK25_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 26 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 26 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK26_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 27 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 27 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK27_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 28 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 28 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK28_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 29 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 29 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK29_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 30 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 30 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK30_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 31 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 31 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK31_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 32 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 32 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK32_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 33 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 33 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK33_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 34 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 34 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK34_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 35 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 35 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK35_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 36 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 36 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK36_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 37 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 37 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK37_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 38 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 38 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK38_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 39 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 39 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK39_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 40 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 40 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK40_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 41 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 41 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK41_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 42 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 42 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK42_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 43 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 43 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK43_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 44 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 44 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK44_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 45 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 45 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK45_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 46 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 46 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK46_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 47 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 47 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK47_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 48 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 48 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK48_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 49 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 49 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK49_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 50 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 50 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK50_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 51 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 51 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK51_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 52 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 52 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK52_VALUE,
   sum(case QV.IS_QUANTITY when 1 then
         case QD.CBD_PERIOD_OR_WEEK when 53 then
            dbo.AA_QUANTITY_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then QD.CBD_COST_QUANTITY else 0 end 
                                    else case when D.IS_DATA is null then QD.CBD_INCOME_QUANTITY else 0 end end)
            else 0
         end
         else
         case VD.CBD_PERIOD_OR_WEEK when 53 then
            dbo.AA_VALUE_DPS_F(case IC.IS_COST when 1 then case when D.IS_DATA is null then VD.CBD_COST_VALUE else 0 end 
                                    else case when D.IS_DATA is null then VD.CBD_INCOME_VALUE else 0 end end)
            else 0
         end
      end) as WEEK53_VALUE,

   CH.CH_CODE,
   M.CCM_CODE,
   cast(max(cast(isnull(CC.CC_ALLOW_QTY_BUDGETS, isnull(M.CCM_ALLOW_QTY_BUDGETS,0)) as tinyint)) as bit) as ALLOW_QTY_BUDGETS,
   cast(max(isnull(CC.CC_TYPE,isnull(M.CCM_TYPE,0))) as bit) as IS_ROLLUP,
   max(isnull(CC.CC_CATEGORY,isnull(M.CCM_CATEGORY,''))) as CC_CATEGORY,
   IC.IS_COST,
   QV.IS_QUANTITY,
   R.CB_REVISION_NUMBER,
   Y.YEAR_COSTING,
   SN.CPN_NODE_LEVEL,
   D.IS_DATA,
   SN.CPN_NODE_INDEX,

   dbo.AA_VALUE_DPS_F(
      dbo.AA_CST_BUDGET_YEAR_VALUES_F(CH.CH_PRIMARY, M.CCM_PRIMARY, Y.YEAR_COSTING, 
      R.CB_REVISION_NUMBER, QV.IS_QUANTITY, IC.IS_COST, 0)
   ) as PREVIOUS_MOVE_TOTAL,

   dbo.AA_VALUE_DPS_F(
      dbo.AA_CST_BUDGET_YEAR_VALUES_F(CH.CH_PRIMARY, M.CCM_PRIMARY, Y.YEAR_COSTING,
      R.CB_REVISION_NUMBER, QV.IS_QUANTITY, IC.IS_COST, 1)
   ) as NEXT_MOVE_TOTAL,

   -- Dummy fields required by the DX GUI
   dbo.AA_VALUE_DPS_F(0) as COSTCENTRE_YEAR_TOTAL, -- Year total
   dbo.AA_VALUE_DPS_F(0) as COSTCENTRE_PROJECT_TOTAL, -- Project total
   0 as NEXT_MOVE_COUNT,
   0 as PREVIOUS_MOVE_COUNT,
   cast(0 as bit) as ROLLUP_SUMMARY,
   cast(0 as bit) as DIRTY

   from CST_COSTHEADER CH

      inner join CST_PROJECT_STRUCTURE_NODES SN on SN.CPN_STRUCTURE_LINK = CH.CH_TEMPLATE_LINK

      inner join CST_MASTER_RECORD M on M.CCM_PRIMARY = SN.CPN_CC_MASTER_LINK

      left join CST_COSTCENTRE CC on CC_CONCAT_CODES = convert(char(10),CH.CH_CODE) + M.CCM_CODE

      left join CST_BUDGET_REVISION R on R.CB_PROJECT_LINK = CH.CH_PRIMARY

      left join SYS_YEAR Y on Y.YEAR_PRIMARY = R.CB_YEAR

      cross join( select 0 as IS_QUANTITY union select 1 ) QV -- Create rows for Value and Quantity entries

      cross join( select 0 as IS_COST union select 1 ) IC -- Create rows for Cost and Income entries

      cross join( select 0 as IS_DATA union select null ) D

      left join CST_BUDGET_VALUE_DETAIL VD on VD.CBD_REVISION_LINK = R.CB_PRIMARY and
         VD.CBD_CENTRE_LINK = CC.CC_PRIMARY and QV.IS_QUANTITY = 0

      left join CST_BUDGET_QUANTITY_DETAIL QD on QD.CBD_REVISION_LINK = R.CB_PRIMARY and
         QD.CBD_CENTRE_LINK = CC.CC_PRIMARY and QV.IS_QUANTITY = 1

   where isnull(M.CCM_DO_NOT_USE,0) = 0 and isnull(CC.CC_DO_NOT_USE,0) = 0

   group by QV.IS_QUANTITY, IC.IS_COST, CH.CH_CODE, M.CCM_CODE, M.CCM_PRIMARY, CH.CH_PRIMARY, 
      SN.CPN_NODE_LEVEL, SN.CPN_NODE_INDEX, R.CB_REVISION_NUMBER, Y.YEAR_COSTING, D.IS_DATA, M.CCM_NAME