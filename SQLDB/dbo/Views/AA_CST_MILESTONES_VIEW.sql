create view AA_CST_MILESTONES_VIEW
/*
**
** Intended to be called by AA_CST_MILESTONES_RETRIEVE_S
** The following fields are intended to be displayed:
**          Milestone Description               MS_DESCRIPTION
**          Date                                MS_DATE
**          Value                               MS_VALUE
**          Percentage                          MS_PERCENTAGE
**          Cost Centre                         CC_CODE
**          Cost Centre Name                    CC_NAME
**          Completed Flag                      MS_COMPLETED
**          Invoiced Costs for this milestone   MS_INVOICED_COSTS
**          Invoiced Sales for this milestone   MS_INVOICED
**          Total Costs up to this milestone    MS_TOTAL_COSTS
**          Retained                            MS_RETAINED
**
** Other fields:
**          CH_PRIMARY identifies the project 
**          MS_PRIMARY uniquely identifies a record
**          DUPLICATE_FLAG: 1=Duplicate (Leave some fields blank) 0=Not Duplicate (Return all fields in the view)
**          This view will need changing when we know which fields are needed when creating a duplicate.  I have
**          assumed that only the descriptive fields will be needed.
**
** Written: 08/12/05 SB
** Last Amended: 09/12/05 SB, 01/03/06 SB, 02/03/06 SB, 23/03/2006 ROBB
*/
as
select CH.CH_PRIMARY
   ,MS.MS_PROJECT_LINK
   ,MS.MS_PRIMARY
   ,MS.MS_DESCRIPTION 
   ,MS.MS_DATE
   ,dbo.AA_VALUE_DPS_F(MS.MS_VALUE)                            MS_VALUE
   ,MS.MS_PERCENTAGE
   ,CV.CC_CODE
   ,CV.CC_NAME
   ,MS.MS_COMPLETED
   ,dbo.AA_VALUE_DPS_F(MS.MS_COSTS)                            MS_INVOICED_COSTS
   ,dbo.AA_VALUE_DPS_F(MS.MS_INVOICED)                         MS_INVOICED
   ,dbo.AA_VALUE_DPS_F(sum(V.MS_COSTS))                        MS_TOTAL_COSTS -- Calculated field will be sum of all milestone invoiced costs so far (including this milestone)
   ,dbo.AA_VALUE_DPS_F(MS.MS_RETAINED)                         MS_RETAINED
   ,MS.MS_WIP_CENTRE_LINK
   ,0                                                          DUPLICATE_FLAG -- This is for when the duplicating requirements are ready 
   ,MS_PRIMARY                                                 [PRIMARY]
from CST_COSTHEADER CH
   left join CST_MILESTONES MS      on CH.CH_PRIMARY = MS.MS_PROJECT_LINK
   left join (
      select MS_PROJECT_LINK, MS_DATE, MS_COSTS 
      from CST_MILESTONES)V         on CH.CH_PRIMARY = V.MS_PROJECT_LINK
   left join AA_CST_CENTRE_VIEW CV  on CH.CH_PRIMARY = CV.CH_PRIMARY
                                    and CV.[PRIMARY] = MS.MS_WIP_CENTRE_LINK
where datediff(day,MS.MS_DATE,V.MS_DATE) <= 0
group by CH.CH_PRIMARY
   ,MS.MS_PROJECT_LINK
   ,MS.MS_PRIMARY
   ,MS.MS_DESCRIPTION 
   ,MS.MS_DATE
   ,MS.MS_VALUE                               
   ,MS.MS_PERCENTAGE
   ,CV.CC_CODE
   ,CV.CC_NAME
   ,MS.MS_COMPLETED
   ,MS.MS_COSTS                               
   ,MS.MS_INVOICED                            
   ,MS.MS_RETAINED                            
   ,MS.MS_WIP_CENTRE_LINK
   ,MS.MS_PRIMARY
                                     
union all
select CH.CH_PRIMARY
   ,MS_PROJECT_LINK
   ,0                                                          MS_PRIMARY
   ,MS_DESCRIPTION 
   ,MS_DATE
   ,MS_VALUE
   ,MS_PERCENTAGE
   ,CV.CC_CODE
   ,CV.CC_NAME
   ,NULL                                                       MS_COMPLETED
   ,NULL                                                       MS_INVOICED_COSTS
   ,NULL                                                       MS_INVOICED
   ,NULL                                                       MS_TOTAL_COSTS
   ,NULL                                                       MS_RETAINED
   ,MS.MS_WIP_CENTRE_LINK
   ,1                                                          DUPLICATE_FLAG -- This is for when the duplicating requirements are ready 
   ,MS_PRIMARY                                                 [PRIMARY]
from CST_COSTHEADER CH
   left join CST_MILESTONES MS      on CH.CH_PRIMARY = MS.MS_PROJECT_LINK
   left join AA_CST_CENTRE_VIEW CV  on CH.CH_PRIMARY = CV.CH_PRIMARY
                                    and CV.[PRIMARY] = MS.MS_WIP_CENTRE_LINK