create view AA_REPORTS_APPROVERS_GROUP_VIEW
/*
** 
** Written:
** Last Amended: 
**
*/
as
select 
      SU_PRIMARY
   ,  irap1.IR_AG_CODE     GroupCode1
   ,  irap2.IR_AG_CODE     GroupCode2
   ,  irap3.IR_AG_CODE     GroupCode3
from
   PL_ACCOUNTS with(nolock)
      left outer join PL_ACCOUNTS2 pa1 with(nolock) on PL_ACCOUNTS.SU_PRIMARY = SU_PRIMARY_2
      left outer join IR_APPROVER_GROUPS irap1 with(nolock) on irap1.IR_AG_PRIMARY = pa1.SU_IR_APPROVER_GROUP1_LINK
      left outer join IR_APPROVER_GROUPS irap2 with(nolock) on irap2.IR_AG_PRIMARY = pa1.SU_IR_APPROVER_GROUP2_LINK
      left outer join IR_APPROVER_GROUPS irap3 with(nolock) on irap3.IR_AG_PRIMARY = pa1.SU_IR_APPROVER_GROUP3_LINK
where
   isnull(irap1.IR_AG_CODE,'')<> ''
or    
   isnull(irap2.IR_AG_CODE,'')<> ''
or 
   isnull(irap3.IR_AG_CODE,'')<> ''
              
