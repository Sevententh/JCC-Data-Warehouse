create view AA_NL_ACCOUNT_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_NL_RECORD_LIST_S
** Written:      27/02/03 SRB
** Last Amended: 13/03/03 ROBB; 25/03/03 SRB; 03/03/04 DG; 27/05/04 DG; 11/08/04 DG; 13/01/05 SR, 25/04/2005 SH; 08/07/05 SRB, 03/08/2005 SH; 07/09/2005 SRB, 29/07/2005 SB, 13/12/05 NC, 26/05/06 SR
**
*/
as

select 

 n.N_PRIMARY as [PRIMARY]
,n.NCODE
,case NTYPE
      when 'N' then 0
      when 'B' then 1
      when 'C' then 2
      when 'D' then 3
      when 'P' then 4
      when 'R' then 5 end AS NOMINAL_TYPE
,coalesce(n.NNAME,'') as NNAME

--The following case statement works out if the account is over budget on either period or year.
,case s.NOMINAL_PERIOD
      when 1 then 
         --YTD Values
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C1 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C1)  then 1     -- +ve Budget
            when (NBUDGET_C1 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C1 ) then 1     -- -ve Budget
         when (NBUDGET_C1 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 2 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C2 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C2)  then 1     -- +ve Budget
            when (NBUDGET_C2 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C2 ) then 1     -- -ve Budget
         when (NBUDGET_C2 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 3 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C3 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C3)  then 1     -- +ve Budget
            when (NBUDGET_C3 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C3 ) then 1     -- -ve Budget
         when (NBUDGET_C3 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 4 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C4 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C4)  then 1     -- +ve Budget
            when (NBUDGET_C4 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C4 ) then 1     -- -ve Budget
         when (NBUDGET_C4 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 5 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C5 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C5)  then 1     -- +ve Budget
            when (NBUDGET_C5 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C5 ) then 1     -- -ve Budget
         when (NBUDGET_C5 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 6 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C6 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C6)  then 1     -- +ve Budget
            when (NBUDGET_C6 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C6 ) then 1     -- -ve Budget
         when (NBUDGET_C6 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 7 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C7 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C7)  then 1     -- +ve Budget
            when (NBUDGET_C7 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C7 ) then 1     -- -ve Budget
         when (NBUDGET_C7 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 8 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C8 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C8)  then 1     -- +ve Budget
            when (NBUDGET_C8 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C8 ) then 1     -- -ve Budget
         when (NBUDGET_C8 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 9 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
               when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
            --PTD values
               when (NBUDGET_C9 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C9)  then 1     -- +ve Budget
               when (NBUDGET_C9 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C9 ) then 1     -- -ve Budget
            when (NBUDGET_C9 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         else 0 
         end as bit)
      when 10 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C10 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C10)  then 1     -- +ve Budget
            when (NBUDGET_C10 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C10 ) then 1     -- -ve Budget
         when (NBUDGET_C10 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 11 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C11 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C11)  then 1     -- +ve Budget
            when (NBUDGET_C11 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C11 ) then 1     -- -ve Budget
         when (NBUDGET_C11 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 12 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C12 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C12)  then 1     -- +ve Budget
            when (NBUDGET_C12 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C12 ) then 1     -- -ve Budget
         when (NBUDGET_C12 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
      when 13 then 
         cast(case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
            when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
         when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
         --PTD values
            when (NBUDGET_C13 > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) > NBUDGET_C13)  then 1     -- +ve Budget
            when (NBUDGET_C13 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) < NBUDGET_C13 ) then 1     -- -ve Budget
         when (NBUDGET_C13 < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERPTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
         end as bit)
end as OVERBUDGETFLAG

,n.NMAJORHEADCODE
,coalesce(n.NCURRENCYCODE,'') as NCURRENCYCODE
,dbo.AA_VALUE_DPS_F(n.NBALANCE)as NBALANCE
,case s.NOMINAL_PERIOD
      when 1 then NBUDGET_C1

      when 2 then NBUDGET_C2
      when 3 then NBUDGET_C3
      when 4 then NBUDGET_C4
      when 5 then NBUDGET_C5
      when 6 then NBUDGET_C6
      when 7 then NBUDGET_C7
      when 8 then NBUDGET_C8
      when 9 then NBUDGET_C9
      when 10 then NBUDGET_C10
      when 11 then NBUDGET_C11
      when 12 then NBUDGET_C12
      when 13 then NBUDGET_C13
end as BUDGET_VALUE

,coalesce(n.NCATEGORYCODE1,'') as NCATEGORYCODE1
,coalesce(n.NCATEGORYCODE2,'') as NCATEGORYCODE2
,coalesce(n.NCATEGORYCODE3,'') as NCATEGORYCODE3
,coalesce(n.NCATEGORYCODE4,'') as NCATEGORYCODE4
,coalesce(n.NCATEGORYCODE5,'') as NCATEGORYCODE5
,coalesce(n.NCATEGORYCODE6,'') as NCATEGORYCODE6
,coalesce(n.NCATEGORYCODE7,'') as NCATEGORYCODE7
,coalesce(n.NCATEGORYCODE8,'') as NCATEGORYCODE8
,cast(n.N_PROFILE_REC as bit) as N_PROFILE_REC
,n.N_DATE_PUTIN
,n.N_DATE_EDITED
,cast(n.N_FORCE_COSTING as bit) as N_FORCE_COSTING
,case when CURREC_NOM_SALECON = n.NCODE then 1
      when CURREC_NOM_PURCHCON = n.NCODE then 2
      when s.NOM_VAT_CNTRL = n.NCODE then 3
      else 0
 end as SALES_PURCH_VAT_CONTROL_ACCOUNT

--Extra fields 
,n.NCATEGORYCODE1 as NCATCODE1_SRCH
,n.NCATEGORYCODE2 as NCATCODE2_SRCH
,n.NCATEGORYCODE3 as NCATCODE3_SRCH
,n.NCATEGORYCODE4 as NCATCODE4_SRCH
,n.NCATEGORYCODE5 as NCATCODE5_SRCH
,n.NCATEGORYCODE6 as NCATCODE6_SRCH
,n.NCATEGORYCODE7 as NCATCODE7_SRCH
,n.NCATEGORYCODE8 as NCATCODE8_SRCH
,n.N_DO_NOT_USE as EXCLUDED
,n2.N_LEVEL as PROFILELEVEL

from NL_ACCOUNTS n
inner join NL_ACCOUNTS2 n2 on n.N_PRIMARY = n2.N_PRIMARY_2
inner join SYS_DATAINFO s with ( nolock ) on SYS_PRIMARY = 1
left join SYS_CURRENCY_REC C on C.CURREC_SYMBOL = n.NCURRENCYCODE
inner join (select
             N_PRIMARY 
            , (case when NOMINAL_PERIOD > 0  then dbo.AA_VALUE_DPS_F(NBUDGET_C1)  else 0 end) 
            + (case when NOMINAL_PERIOD > 1  then dbo.AA_VALUE_DPS_F(NBUDGET_C2)  else 0 end) 
            + (case when NOMINAL_PERIOD > 2  then dbo.AA_VALUE_DPS_F(NBUDGET_C3)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 3  then dbo.AA_VALUE_DPS_F(NBUDGET_C4)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 4  then dbo.AA_VALUE_DPS_F(NBUDGET_C5)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 5  then dbo.AA_VALUE_DPS_F(NBUDGET_C6)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 6  then dbo.AA_VALUE_DPS_F(NBUDGET_C7)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 7  then dbo.AA_VALUE_DPS_F(NBUDGET_C8)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 8  then dbo.AA_VALUE_DPS_F(NBUDGET_C9)  else 0 end)                                   
            + (case when NOMINAL_PERIOD > 9  then dbo.AA_VALUE_DPS_F(NBUDGET_C10) else 0 end)                                   
            + (case when NOMINAL_PERIOD > 10 then dbo.AA_VALUE_DPS_F(NBUDGET_C11) else 0 end)                                   
            + (case when NOMINAL_PERIOD > 11 then dbo.AA_VALUE_DPS_F(NBUDGET_C12) else 0 end)                                   
            + (case when NOMINAL_PERIOD > 12 then dbo.AA_VALUE_DPS_F(NBUDGET_C13) else 0 end) BUDGET_YTD 
            from NL_ACCOUNTS ,SYS_DATAINFO) b
on b.N_PRIMARY = n.N_PRIMARY