create view AA_REP_CRM_TASKLIST_VIEW
/*
** Written     :  21/03/2006 RV
** Last Amended:
**
** Used by     :  Tasks Report.rpt
*/
as

select
   CUCODE
,  CUPROSCODE
,  CUNAME
,  CMT_TYPE
,  CMT_DATE_ENTERED
,  CMT_USER_ENTERED
,  CMT_REM_STATUS
,  CMT_REM_USER
,  CMT_REM_DATE
,  CMT_CONTACT
,  CMT_NOTES
,  (
      case
         when datediff(day,getdate(),CMT_REM_DATE)>0 then datediff(day,getdate(),CMT_REM_DATE)
         else
            0
      end
   )              as DaysOutstanding
,  CU_ACC_CODE    as CustomerorProspect
,  'ENGLISH   '   as LANGUAGE_LINK
   from
      CRM_TASKS
         left join SL_ACCOUNTS on CMT_CU_LINK = CU_PRIMARY