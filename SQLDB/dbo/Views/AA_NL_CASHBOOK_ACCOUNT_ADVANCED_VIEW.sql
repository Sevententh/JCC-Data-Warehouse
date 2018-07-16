create view AA_NL_CASHBOOK_ACCOUNT_ADVANCED_VIEW
/*
** Returns a table to be used specifically with AA_NL_CASHBOOK_RECORD_LIST_S
** Written:      21/07/2004 DG
** Last Amended: 
**
*/
as

select 

 n.N_PRIMARY as [PRIMARY]
,n.NCODE	
,coalesce(n.NNAME,'') as NNAME
,case when (b.BUDGET_YTD > 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) > b.BUDGET_YTD)  then 1     -- +ve Budget
      when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) < b.BUDGET_YTD ) then 1     -- -ve Budget
      when (b.BUDGET_YTD < 0) and (dbo.AA_VALUE_DPS_F(n.NTURNOVERYTD) = 0) then 1                 -- -ve Budget and Zero Turnover
      else 0 
 end as OVERBUDGETFLAG
,n.NMAJORHEADCODE
,coalesce(n.NCURRENCYCODE,'') as NCURRENCYCODE
,dbo.AA_VALUE_DPS_F(n.NBALANCE)as NBALANCE
,coalesce(n.NCATEGORYCODE1,'') as NCATEGORYCODE1
,coalesce(n.NCATEGORYCODE2,'') as NCATEGORYCODE2
,coalesce(n.NCATEGORYCODE3,'') as NCATEGORYCODE3
,coalesce(n.NCATEGORYCODE4,'') as NCATEGORYCODE4
,coalesce(n.NCATEGORYCODE5,'') as NCATEGORYCODE5
,coalesce(n.NCATEGORYCODE6,'') as NCATEGORYCODE6
,coalesce(n.NCATEGORYCODE7,'') as NCATEGORYCODE7
,coalesce(n.NCATEGORYCODE8,'') as NCATEGORYCODE8
,n.N_PROFILE_REC
,n.N_DATE_PUTIN
,n.N_DATE_EDITED
,n.N_USER_PUTIN
,n.N_USER_EDITED
,n2.N_LEVEL
,coalesce(n2.N_USRCHAR1,'') as N_USRCHAR1
,coalesce(n2.N_USRCHAR2,'') as N_USRCHAR2
,coalesce(n2.N_USRCHAR3,'') as N_USRCHAR3
,coalesce(n2.N_USRCHAR4,'') as N_USRCHAR4
,coalesce(n2.N_USRCHAR5,'') as N_USRCHAR5
,coalesce(n2.N_USRCHAR6,'') as N_USRCHAR6
,coalesce(n2.N_USRCHAR7,'') as N_USRCHAR7
,coalesce(n2.N_USRCHAR8,'') as N_USRCHAR8
,n2.N_USRFLAG1
,n2.N_USRFLAG2
,n2.N_USRFLAG3
,n2.N_USRDATE1
,n2.N_USRDATE2
,n2.N_USRDATE3
,dbo.AA_VALUE_DPS_F(n2.N_USRNUM1)as N_USRNUM1
,dbo.AA_VALUE_DPS_F(n2.N_USRNUM2)as N_USRNUM2
,dbo.AA_VALUE_DPS_F(n2.N_USRNUM3)as N_USRNUM3
,case when n.NCURRENCYCODE in (HOME_CURR_SYMBL,null,'') then dbo.AA_VALUE_DPS_F(n.NRECONBALANCE) 
                                                        else dbo.AA_VALUE_DPS_F(n.NRECONBALANCE_C) end RECONBALANCE
,case when n.NCURRENCYCODE in (HOME_CURR_SYMBL,null,'') then dbo.AA_VALUE_DPS_F(n.NOPENBALMONTH) + dbo.AA_VALUE_DPS_F(n.N_INCOME) - dbo.AA_VALUE_DPS_F(n.N_EXPENSES) - dbo.AA_VALUE_DPS_F(n.NRECONBALANCE) 
                                                        else dbo.AA_VALUE_DPS_F(n.NOPENBALMTH_C) + dbo.AA_VALUE_DPS_F(n.N_INCOME_C) - dbo.AA_VALUE_DPS_F(n.N_EXPENSES_C) - dbo.AA_VALUE_DPS_F(n.NRECONBALANCE_C) end UNRECONBALANCE
from NL_ACCOUNTS n
inner join NL_ACCOUNTS2 n2 on n.N_PRIMARY = n2.N_PRIMARY_2
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
inner join SYS_DATAINFO on SYS_PRIMARY = 1 



