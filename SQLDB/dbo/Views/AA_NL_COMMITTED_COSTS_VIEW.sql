create view AA_NL_COMMITTED_COSTS_VIEW
/*
** View to Show committed cost for Nominal budget allocation.
** There is a copy of this view which includes actual figures: AA_NL_ACTUAL_AND_COMMITTED_COSTS_VIEW
**
** Written     :  05/02/2003 NC
** Last Amended:  12/02/2003 NC, 26/09/2003 SR, 29/10/2003 SR, 06/01/2004 RL, 15/01/2004, 09/03/2004 NC, 07/07/2006 WW, 06/09/2007 RL, 25/11/2008 DB
*/
(
   Transaction_Primary
,  Batched
,  Origin
,  Transaction_Type
,  Transaction_Reference /* Order number or invoice number */
,  Cost
,  Transaction_Date
,  Transaction_Year
,  Transaction_Period
,  Period_Sort
,  Nominal_Code
,  Nominal_Name
,  Nominal_Period_Budget
,  Nominal_YTD_Budget
,  Major_Heading_Code
,  Major_Heading_Name
,  Item_Code
,  User_ID
,  Authoriser_ID
,  Account
,  Analysis
,  Cost_Header
,  Cost_Centre
,  Transaction_Key
,  Order_Number
,  Debit_Cost
,  Credit_Cost
,  Item_Type -- Stock (S), Price (P) or Text (T)
,  Currency
,  Rejecter_ID
,  Budget_Status
,  Inactive_Flag
)
as
select
   POD_PRIMARY
,  1
,  'PO'
,  POD_TYPE
,  POD_ORDER_NO
,  (case when POD_TYPE = 'O' then 1 else -1 end) * (POD_NETT - POD_T_DISCVAL) * (1 - (POD_QTYINVD / (case when POD_QTYORD = 0 then 1 else POD_QTYORD end)))
,  POD_DATE
,  (case PURCH_UPDTEYEAR when 'C' then POD_YEAR else substring('LCNN',charindex(POD_YEAR,'OLCN'),1) end)
,  POD_PERIOD
,  POD_PERIOD + (13*(charindex(POD_YEAR,'OLCN')-(case PURCH_UPDTEYEAR when 'N' then 1 else 2 end)))
,  NCODE
,  NNAME
,  (case POD_PERIOD + (13*(charindex(POD_YEAR,'OLCN')-(case PURCH_UPDTEYEAR when 'N' then 0 else 1 end)))
    when 14 then NBUDGET_L1
    when 15 then NBUDGET_L2
    when 16 then NBUDGET_L3
    when 17 then NBUDGET_L4
    when 18 then NBUDGET_L5
    when 19 then NBUDGET_L6
    when 20 then NBUDGET_L7
    when 21 then NBUDGET_L8
    when 22 then NBUDGET_L9
    when 23 then NBUDGET_L10
    when 24 then NBUDGET_L11
    when 25 then NBUDGET_L12
    when 26 then NBUDGET_L13
    when 27 then NBUDGET_C1
    when 28 then NBUDGET_C2
    when 29 then NBUDGET_C3
    when 30 then NBUDGET_C4
    when 31 then NBUDGET_C5
    when 32 then NBUDGET_C6
    when 33 then NBUDGET_C7
    when 34 then NBUDGET_C8
    when 35 then NBUDGET_C9
    when 36 then NBUDGET_C10
    when 37 then NBUDGET_C11
    when 38 then NBUDGET_C12
    when 39 then NBUDGET_C13
    when 40 then NBUDGET_N1
    when 41 then NBUDGET_N2
    when 42 then NBUDGET_N3
    when 43 then NBUDGET_N4
    when 44 then NBUDGET_N5
    when 45 then NBUDGET_N6
    when 46 then NBUDGET_N7
    when 47 then NBUDGET_N8
    when 48 then NBUDGET_N9
    when 49 then NBUDGET_N10
    when 50 then NBUDGET_N11
    when 51 then NBUDGET_N12
    when 52 then NBUDGET_N13
    else 0 end)
,  (case POD_PERIOD + (13*(charindex(POD_YEAR,'OLCN')-(case PURCH_UPDTEYEAR when 'N' then 0 else 1 end)))
    when 14 then NBUDGET_L1
    when 15 then NBUDGET_L2 + NBUDGET_L1
    when 16 then NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 17 then NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 18 then NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 19 then NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 20 then NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 21 then NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 22 then NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 23 then NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 24 then NBUDGET_L11 + NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 25 then NBUDGET_L12 + NBUDGET_L11 + NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 26 then NBUDGET_L13 + NBUDGET_L12 + NBUDGET_L11 + NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 27 then NBUDGET_C1
    when 28 then NBUDGET_C2 + NBUDGET_C1
    when 29 then NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 30 then NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 31 then NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 32 then NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 33 then NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 34 then NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 35 then NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 36 then NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 37 then NBUDGET_C11 + NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 38 then NBUDGET_C12 + NBUDGET_C11 + NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 39 then NBUDGET_C13 + NBUDGET_C12 + NBUDGET_C11 + NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 40 then NBUDGET_N1
    when 41 then NBUDGET_N2 + NBUDGET_N1
    when 42 then NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 43 then NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 44 then NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 45 then NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 46 then NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 47 then NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 48 then NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 49 then NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 50 then NBUDGET_N11 + NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 51 then NBUDGET_N12 + NBUDGET_N11 + NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 52 then NBUDGET_N13 + NBUDGET_N12 + NBUDGET_N11 + NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    else 0 end)
,  NMAJORHEADCODE
,  NL_MAJORNAME
,  (case POD_ENTRY_TYPE when 'S' then POD_STOCK_CODE when 'P' then POD_PRICE_CODE else POD_DETAIL end)
,  POH_ORIGINAL_USER_PUTIN
,  POH_AUTHORISER_ID
,  POD_ACCOUNT
,  POD_ANALYSIS
,  POD_COSTHEADER
,  POD_COSTCENTRE
,  ''
,  POD_ORDER_NO
,  (case when ((case when POD_TYPE = 'O' then 1 else -1 end) * (POD_NETT - POD_T_DISCVAL) * (1 - (POD_QTYINVD / (case when POD_QTYORD = 0 then 1 else POD_QTYORD end)))) > 0 then ((case when POD_TYPE = 'O' then 1 else -1 end) * (POD_NETT - POD_T_DISCVAL) * (1 - (POD_QTYINVD / (case when POD_QTYORD = 0 then 1 else POD_QTYORD end)))) else 0 end)
,  (case when ((case when POD_TYPE = 'O' then 1 else -1 end) * (POD_NETT - POD_T_DISCVAL) * (1 - (POD_QTYINVD / (case when POD_QTYORD = 0 then 1 else POD_QTYORD end)))) < 0 then (-1 * (case when POD_TYPE = 'O' then 1 else -1 end) * (POD_NETT - POD_T_DISCVAL) * (1 - (POD_QTYINVD / (case when POD_QTYORD = 0 then 1 else POD_QTYORD end)))) else 0 end)
,  POD_ENTRY_TYPE
,  POH_CURR_CODE
,  POH_REJECTER_ID
,  POH_BUDGET_STATUS
,  isnull(N_DO_NOT_USE,0)
   from
      POP_DETAIL
         inner join PL_ANALYSIS     with(nolock)   on       PACODE            = POD_ANALYSIS
         inner join NL_ACCOUNTS     with(nolock)   on       PANOMINALDR       = NCODE
         inner join NL_MAJORHEADING with(nolock)   on       NL_MAJORCODE      = NMAJORHEADCODE
                                                      and   NMAJORHEADCODE    in (2,4,6,7,8)
         inner join SYS_DATAINFO    with(nolock)   on       SYS_PRIMARY       = 1
         left  join POP_HEADER      with(nolock)   on       POH_ORDER_NUMBR   = POD_ORDER_NO
   where
            POD_BATCH_FLAG = 1
      and   POD_STATUS    <> 2
union
select
   DET_PRIMARY
,  DET_BATCH_FLAG
,  DET_ORIGIN
,  DET_TYPE
,  DET_HEADER_REF
,  (
      case
         when DET_TYPE in ('INV','ACR') then DET_NETT
         else
            -DET_NETT
      end
   )
,  DET_DATE
,  DET_NOM_YEAR
,  DET_NOM_PERIOD
,  DET_NOM_PERSORT
,  NCODE
,  NNAME
,  (
      case DET_NOM_PERIOD + (13*(charindex(DET_NOM_YEAR,'OLCN')-1))
         when 14 then NBUDGET_L1
         when 15 then NBUDGET_L2
         when 16 then NBUDGET_L3
         when 17 then NBUDGET_L4
         when 18 then NBUDGET_L5
         when 19 then NBUDGET_L6
         when 20 then NBUDGET_L7
         when 21 then NBUDGET_L8
         when 22 then NBUDGET_L9
         when 23 then NBUDGET_L10
         when 24 then NBUDGET_L11
         when 25 then NBUDGET_L12
         when 26 then NBUDGET_L13
         when 27 then NBUDGET_C1
         when 28 then NBUDGET_C2
         when 29 then NBUDGET_C3
         when 30 then NBUDGET_C4
         when 31 then NBUDGET_C5
         when 32 then NBUDGET_C6
         when 33 then NBUDGET_C7
         when 34 then NBUDGET_C8
         when 35 then NBUDGET_C9
         when 36 then NBUDGET_C10
         when 37 then NBUDGET_C11
         when 38 then NBUDGET_C12
         when 39 then NBUDGET_C13
         when 40 then NBUDGET_N1
         when 41 then NBUDGET_N2
         when 42 then NBUDGET_N3
         when 43 then NBUDGET_N4
         when 44 then NBUDGET_N5
         when 45 then NBUDGET_N6
         when 46 then NBUDGET_N7
         when 47 then NBUDGET_N8
         when 48 then NBUDGET_N9
         when 49 then NBUDGET_N10
         when 50 then NBUDGET_N11
         when 51 then NBUDGET_N12
         when 52 then NBUDGET_N13
         else
            0
      end
   )
,  (
      case DET_NOM_PERIOD + (13*(charindex(DET_NOM_YEAR,'OLCN')-1))
         when 14 then      NBUDGET_L1

         when 15 then      NBUDGET_L2
                        +  NBUDGET_L1

         when 16 then      NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 17 then      NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 18 then      NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 19 then      NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 20 then      NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 21 then      NBUDGET_L8
                        +  NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 22 then      NBUDGET_L9
                        +  NBUDGET_L8
                        +  NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 23 then      NBUDGET_L10
                        +  NBUDGET_L9
                        +  NBUDGET_L8
                        +  NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 24 then      NBUDGET_L11
                        +  NBUDGET_L10
                        +  NBUDGET_L9
                        +  NBUDGET_L8
                        +  NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 25 then      NBUDGET_L12
                        +  NBUDGET_L11
                        +  NBUDGET_L10
                        +  NBUDGET_L9
                        +  NBUDGET_L8
                        +  NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 26 then      NBUDGET_L13
                        +  NBUDGET_L12
                        +  NBUDGET_L11
                        +  NBUDGET_L10
                        +  NBUDGET_L9
                        +  NBUDGET_L8
                        +  NBUDGET_L7
                        +  NBUDGET_L6
                        +  NBUDGET_L5
                        +  NBUDGET_L4
                        +  NBUDGET_L3
                        +  NBUDGET_L2
                        +  NBUDGET_L1

         when 27 then      NBUDGET_C1

         when 28 then      NBUDGET_C2
                        +  NBUDGET_C1

         when 29 then      NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 30 then      NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 31 then      NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 32 then      NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 33 then      NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 34 then      NBUDGET_C8
                        +  NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 35 then      NBUDGET_C9
                        +  NBUDGET_C8
                        +  NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 36 then      NBUDGET_C10
                        +  NBUDGET_C9
                        +  NBUDGET_C8
                        +  NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 37 then      NBUDGET_C11
                        +  NBUDGET_C10
                        +  NBUDGET_C9
                        +  NBUDGET_C8
                        +  NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 38 then      NBUDGET_C12
                        +  NBUDGET_C11
                        +  NBUDGET_C10
                        +  NBUDGET_C9
                        +  NBUDGET_C8
                        +  NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 39 then      NBUDGET_C13
                        +  NBUDGET_C12
                        +  NBUDGET_C11
                        +  NBUDGET_C10
                        +  NBUDGET_C9
                        +  NBUDGET_C8
                        +  NBUDGET_C7
                        +  NBUDGET_C6
                        +  NBUDGET_C5
                        +  NBUDGET_C4
                        +  NBUDGET_C3
                        +  NBUDGET_C2
                        +  NBUDGET_C1

         when 40 then      NBUDGET_N1

         when 41 then      NBUDGET_N2
                        +  NBUDGET_N1

         when 42 then      NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 43 then      NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 44 then      NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 45 then      NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 46 then      NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 47 then      NBUDGET_N8
                        +  NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 48 then      NBUDGET_N9
                        +  NBUDGET_N8
                        +  NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 49 then      NBUDGET_N10
                        +  NBUDGET_N9
                        +  NBUDGET_N8
                        +  NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 50 then      NBUDGET_N11
                        +  NBUDGET_N10
                        +  NBUDGET_N9
                        +  NBUDGET_N8
                        +  NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 51 then      NBUDGET_N12
                        +  NBUDGET_N11
                        +  NBUDGET_N10
                        +  NBUDGET_N9
                        +  NBUDGET_N8
                        +  NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1

         when 52 then      NBUDGET_N13
                        +  NBUDGET_N12
                        +  NBUDGET_N11
                        +  NBUDGET_N10
                        +  NBUDGET_N9
                        +  NBUDGET_N8
                        +  NBUDGET_N7
                        +  NBUDGET_N6
                        +  NBUDGET_N5
                        +  NBUDGET_N4
                        +  NBUDGET_N3
                        +  NBUDGET_N2
                        +  NBUDGET_N1
         else
            0
      end
   )
,  NMAJORHEADCODE
,  NL_MAJORNAME
,  (
      case isnull(DET_STOCK_CODE,'')+isnull(DET_PRICE_CODE,'')
         when '' then DET_DESCRIPTION
         else
            isnull(DET_STOCK_CODE,'')+isnull(DET_PRICE_CODE,'')
      end
   )
,  isnull(nullif(POH_ORIGINAL_USER_PUTIN,''),DET_USER_PUTIN)
,  POH_AUTHORISER_ID
,  DET_ACCOUNT
,  DET_ANALYSIS
,  DET_COSTHEADER
,  DET_COSTCENTRE
,  DET_HEADER_KEY
,  PT_ORDER_NUMBER
,  (
      case
         when  (
                  case
                     when DET_TYPE in ('INV','ACR') then DET_NETT
                     else
                     -DET_NETT
                  end
               ) > 0
               then  (
                        case
                           when DET_TYPE in ('INV','ACR') then DET_NETT
                           else
                              -DET_NETT
                        end
                     )
         else
            0
      end
   )
,  (
      case
         when
            (
               case
                  when DET_TYPE in ('INV','ACR') then DET_NETT
                  else
                     -DET_NETT
               end
            ) < 0
            then  (
                     -1
                     *
                     case
                        when DET_TYPE in ('INV','ACR') then DET_NETT
                        else
                           -DET_NETT
                     end
                  )
         else
            0
      end
   )
,  (
      case isnull(DET_STOCK_CODE,'')+isnull(DET_PRICE_CODE,'')
         when '' then 'T'
         else
            (
               case isnull(DET_STOCK_CODE,'')
                  when '' then 'P'
                  else
                     'S'
               end
            )
      end
   )
,  DET_CURR_CODE
,  ''
,  ''
,  isnull(N_DO_NOT_USE,0)
   from
      SL_PL_NL_DETAIL
         inner join NL_ACCOUNTS     with(nolock)   on       NCODE             = DET_NOMINALDR
         inner join NL_MAJORHEADING with(nolock)   on       NL_MAJORCODE      = NMAJORHEADCODE
                                                      and   NMAJORHEADCODE    in (2,4,6,7,8)
         inner join PL_TRANSACTIONS with(nolock)   on       PT_HEADER_KEY     = DET_HEADER_KEY
                                                      and   PT_BATCH_FLAG     = 1
         left  join POP_HEADER      with(nolock)   on       POH_ORDER_NUMBR   = PT_ORDER_NUMBER
union
select
   DET_PRIMARY
,  DET_BATCH_FLAG
,  DET_ORIGIN
,  DET_TYPE
,  DET_HEADER_REF
,  (case when (DET_NOMINALDR <> '' and DET_NOMINALDR is not NULL) then DET_NETT else -DET_NETT end)
,  DET_DATE
,  DET_NOM_YEAR
,  DET_NOM_PERIOD
,  DET_NOM_PERSORT
,  NCODE
,  NNAME
,  (case DET_NOM_PERIOD + (13*(charindex(DET_NOM_YEAR,'OLCN')-1))
    when 14 then NBUDGET_L1
    when 15 then NBUDGET_L2
    when 16 then NBUDGET_L3
    when 17 then NBUDGET_L4
    when 18 then NBUDGET_L5
    when 19 then NBUDGET_L6
    when 20 then NBUDGET_L7
    when 21 then NBUDGET_L8
    when 22 then NBUDGET_L9
    when 23 then NBUDGET_L10
    when 24 then NBUDGET_L11
    when 25 then NBUDGET_L12
    when 26 then NBUDGET_L13
    when 27 then NBUDGET_C1
    when 28 then NBUDGET_C2
    when 29 then NBUDGET_C3
    when 30 then NBUDGET_C4
    when 31 then NBUDGET_C5
    when 32 then NBUDGET_C6
    when 33 then NBUDGET_C7
    when 34 then NBUDGET_C8
    when 35 then NBUDGET_C9
    when 36 then NBUDGET_C10
    when 37 then NBUDGET_C11
    when 38 then NBUDGET_C12
    when 39 then NBUDGET_C13
    when 40 then NBUDGET_N1
    when 41 then NBUDGET_N2
    when 42 then NBUDGET_N3
    when 43 then NBUDGET_N4
    when 44 then NBUDGET_N5
    when 45 then NBUDGET_N6
    when 46 then NBUDGET_N7
    when 47 then NBUDGET_N8
    when 48 then NBUDGET_N9
    when 49 then NBUDGET_N10
    when 50 then NBUDGET_N11
    when 51 then NBUDGET_N12
    when 52 then NBUDGET_N13
    else 0 end)
,  (case DET_NOM_PERIOD + (13*(charindex(DET_NOM_YEAR,'OLCN')-1))
    when 14 then NBUDGET_L1
    when 15 then NBUDGET_L2 + NBUDGET_L1
    when 16 then NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 17 then NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 18 then NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 19 then NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 20 then NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 21 then NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 22 then NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 23 then NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 24 then NBUDGET_L11 + NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 25 then NBUDGET_L12 + NBUDGET_L11 + NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 26 then NBUDGET_L13 + NBUDGET_L12 + NBUDGET_L11 + NBUDGET_L10 + NBUDGET_L9 + NBUDGET_L8 + NBUDGET_L7 + NBUDGET_L6 + NBUDGET_L5 + NBUDGET_L4 + NBUDGET_L3 + NBUDGET_L2 + NBUDGET_L1
    when 27 then NBUDGET_C1
    when 28 then NBUDGET_C2 + NBUDGET_C1
    when 29 then NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 30 then NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 31 then NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 32 then NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 33 then NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 34 then NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 35 then NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 36 then NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 37 then NBUDGET_C11 + NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 38 then NBUDGET_C12 + NBUDGET_C11 + NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 39 then NBUDGET_C13 + NBUDGET_C12 + NBUDGET_C11 + NBUDGET_C10 + NBUDGET_C9 + NBUDGET_C8 + NBUDGET_C7 + NBUDGET_C6 + NBUDGET_C5 + NBUDGET_C4 + NBUDGET_C3 + NBUDGET_C2 + NBUDGET_C1
    when 40 then NBUDGET_N1
    when 41 then NBUDGET_N2 + NBUDGET_N1
    when 42 then NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 43 then NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 44 then NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 45 then NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 46 then NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 47 then NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 48 then NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 49 then NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 50 then NBUDGET_N11 + NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 51 then NBUDGET_N12 + NBUDGET_N11 + NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    when 52 then NBUDGET_N13 + NBUDGET_N12 + NBUDGET_N11 + NBUDGET_N10 + NBUDGET_N9 + NBUDGET_N8 + NBUDGET_N7 + NBUDGET_N6 + NBUDGET_N5 + NBUDGET_N4 + NBUDGET_N3 + NBUDGET_N2 + NBUDGET_N1
    else 0 end)
,  NMAJORHEADCODE
,  NL_MAJORNAME
,  DET_DESCRIPTION
,  DET_USER_PUTIN
,  ''
,  DET_ACCOUNT
,  DET_ANALYSIS
,  DET_COSTHEADER
,  DET_COSTCENTRE
,  DET_HEADER_KEY
,  '0'
, (case when (case when (DET_NOMINALDR <> '' and DET_NOMINALDR is not NULL) then DET_NETT else -DET_NETT end) > 0 then (case when (DET_NOMINALDR <> '' and DET_NOMINALDR is not NULL) then DET_NETT else -DET_NETT end) else 0 end)
, (case when (case when (DET_NOMINALDR <> '' and DET_NOMINALDR is not NULL) then DET_NETT else -DET_NETT end) < 0 then (-1 * case when (DET_NOMINALDR <> '' and DET_NOMINALDR is not NULL) then DET_NETT else -DET_NETT end) else 0 end)
,  'T'
,  DET_CURR_CODE
,  ''
,  ''
,  isnull(N_DO_NOT_USE,0)
   from
      SL_PL_NL_DETAIL
         inner join NL_ACCOUNTS     with(nolock)   on NCODE          = isnull(DET_NOMINALCR,'')+isnull(DET_NOMINALDR,'')
         inner join NL_MAJORHEADING with(nolock)   on NL_MAJORCODE   = NMAJORHEADCODE
   where
            DET_HEADER_KEY like 'N%'
      and   NMAJORHEADCODE in (2,4,6,7,8)
      and   DET_BATCH_FLAG = 1
      and   DET_RECUR_FLAG = 0