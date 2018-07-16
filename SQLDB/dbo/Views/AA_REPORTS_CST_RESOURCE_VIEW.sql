create view AA_REPORTS_CST_RESOURCE_VIEW
/*
** Written:
** Last Amended:
**
**
*/
as
select 
   PR_PRIMARY
,  PRCODE
,  PRNAME
,  PR_EMPLOYEE_CODE
,  PR_TEXT
,  PR_NOTES
,  PR_LEVEL
,  PR_DO_NOT_USE
,  PR_DATE_USER1
,  PR_DATE_USER2
,  PR_DATE_USER3
,  PR_TARGET_HOURS
,  PR_TARGET_VALUE
,  PR_TIMESHEET_UNITS
,  substring('01',charindex(isnull(PR_TIMESHEET_UNIT_TYPE,'H'),'HD'),1) as PR_TIMESHEET_UNIT_TYPE
,  PR_DATE_PUTIN
,  PR_USER_PUTIN
,  PR_DATE_EDITED
,  PR_USER_EDITED
,  PR_SORT_KEY
,  PR_SORT_KEY1
,  PR_SORT_KEY2
,  PR_SORT_KEY3
,  PR_SORT_KEY4
,  PR_SORT_KEY5
,  PR_SORT_KEY6
,  PR_PERSON_LINK
,  dbo.AA_VALUE_DPS_F(PR_QTY_YTD)                                       as PR_QTY_YTD 
,  dbo.AA_VALUE_DPS_F(PR_COSTVAL_YTD)                                   as PR_COSTVAL_YTD
,  PR_COST_1      
,  PR_COST_2      
,  PR_COST_3      
,  PR_COST_4      
,  PR_COST_5      
,  PR_COST_6      
,  PR_COST_7      
,  PR_COST_8      
,  PR_COST_9      
,  PR_COST_10     
,  PR_UPLIFT_V1   
,  PR_UPLIFT_V2   
,  PR_UPLIFT_V3   
,  PR_UPLIFT_V4   
,  PR_UPLIFT_V5   
,  PR_UPLIFT_V6   
,  PR_UPLIFT_V7   
,  PR_UPLIFT_V8   
,  PR_UPLIFT_V9   
,  PR_UPLIFT_V10  
,  PR_UPLIFT_P1   
,  PR_UPLIFT_P2   
,  PR_UPLIFT_P3   
,  PR_UPLIFT_P4   
,  PR_UPLIFT_P5   
,  PR_UPLIFT_P6   
,  PR_UPLIFT_P7   
,  PR_UPLIFT_P8   
,  PR_UPLIFT_P9   
,  PR_UPLIFT_P10  
,  PR_UPLIFT_C_V1 
,  PR_UPLIFT_C_V2 
,  PR_UPLIFT_C_V3 
,  PR_UPLIFT_C_V4 
,  PR_UPLIFT_C_V5 
,  PR_UPLIFT_C_V6 
,  PR_UPLIFT_C_V7 
,  PR_UPLIFT_C_V8 
,  PR_UPLIFT_C_V9 
,  PR_UPLIFT_C_V10
,  PR_CURR_1      
,  PR_CURR_2      
,  PR_CURR_3      
,  PR_CURR_4      
,  PR_CURR_5      
,  PR_CURR_6      
,  PR_CURR_7      
,  PR_CURR_8      
,  PR_CURR_9      
,  PR_CURR_10     
,  PR_COST_C_1    
,  PR_COST_C_2    
,  PR_COST_C_3    
,  PR_COST_C_4    
,  PR_COST_C_5    
,  PR_COST_C_6    
,  PR_COST_C_7    
,  PR_COST_C_8    
,  PR_COST_C_9    
,  PR_COST_C_10   

from 
   PRC_PRICE_RECS
where 
   PR_TYPE = 'R'