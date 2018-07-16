create view AA_CST_CENTRE_VIEW
/*
** Written     :  26/02/2004 SR
** Last Amended:  05/01/2006 DB, 11/01/2006 DB, 31/01/2006 JC, 01/01/2006 JC, 08/02/2006 DB, 08/02/2006 JC, 09/02/2006 JC, 10/02/2006 JC, 23/02/2006 DB, 01/03/2006 DB
*/
as

select
   -- Master Cost Centre only fields
   CCM_PRIMARY                                                    as [PRIMARY]            -- Cost Centre Master Primary

   -- Cost Centre only fields
,  CC_PRIMARY                                                                             -- Cost Centre Primary
,  CH_PRIMARY                                                                             -- Project Primary
,  CC_COPYHEADER                                                                          -- Project Code
,  isnull(CH_NAME,'')                                             as CH_NAME              -- Project Name
,  case isnull(CC_STATUS,'')
      when '' then '-1'
      else
         substring('012345',charindex(CC_STATUS,'EASRXC'),1)
   end                                                            as CC_STATUS            -- Status:
                                                                                          --   -1 = None
                                                                                          --    0 = Estimate
                                                                                          --    1 = Active
                                                                                          --    2 = Suspended
                                                                                          --    3 = Reopened
                                                                                          --    4 = Cancelled
                                                                                          --    5 = Completed

,  CC_DATE_REQ                                                                            -- Deadline
,  CC_CONCAT_CODES
,  substring('01234',charindex(CC_DUR_TYPE,'HDWMY'),1)            as CC_DUR_TYPE          -- Duration Type:
                                                                                          --    0 = Hour
                                                                                          --    1 = Days
                                                                                          --    2 = Weeks
                                                                                          --    3 = Months
                                                                                          --    4 = Years
,  CC_DURATION
,  CC_LEVELPOINTER
,  CC_LEVELSEQ
,  isnull(CC_USED,0)                                              as CC_USED
,  CC_ACTUAL_COST                                                                         -- Actual costs
,  CC_COMITT_COST                                                                         -- Committed costs
,  CC_COST_INVTD                                                                          -- Invoice costs
,  CC_WIP                                                                                 -- WIP
,  CC_SALES_WIP                                                                           -- Sales WIP

   -- Fields on both Master and Cost Centre that cannot be different
,  CCM_CODE                                                       as CC_CODE              -- Cost Centre Code

   -- Fields on both Master and Cost Centre that may be different
,  0                                                              as CODE_EDITABLE
,  isnull(CC_NAME,CCM_NAME)                                       as CC_NAME              -- Cost Centre Name
,  isnull(CC_ANALYSIS,CCM_SL_ANALYSIS.SACODE)                     as CC_ANALYSIS          -- Sales Analysis
,  isnull(CC_PURCHASE_ANALYSIS_LINK,CCM_PURCHASE_ANALYSIS_LINK)   as CC_PURCHASE_ANALYSIS_LINK
,  isnull(CC_PL_ANALYSIS.PACODE,CCM_PL_ANALYSIS.PACODE)           as PACODE               -- Purchase Analysis
,  isnull(CC_SL_ANALYSIS.SANAME,CCM_SL_ANALYSIS.SANAME)           as SANAME
,  isnull(CC_PL_ANALYSIS.PANAME,CCM_PL_ANALYSIS.PANAME)           as PANAME
,  isnull(CC_NOTES,CCM_NOTES)                                     as CC_NOTES
,  isnull(CC_UPLIFT_TYPE,CCM_UPLIFT_TYPE)                         as CC_UPLIFT_TYPE       -- Uplift Type:
                                                                                          --    0 = Percentage
                                                                                          --    1 = Value

,  isnull(CC_MARGIN_TYPE,CCM_MARKUP_TYPE)                         as CC_MARGIN_TYPE       -- Margin Type:
                                                                                          --    0 = Percentage
                                                                                          --    1 = Value
,  case isnull(CC_CHRG_RATE,CCM_CHRG_RATE)
      when 'F' then  dbo.AA_PRICE_DPS_F
                     (
                        isnull(CC_CHRG_VALUE,CCM_CHRG_VALUE)
                     )
      else
         0
   end                                                            as CC_CHRG_VALUE        -- Fixed Charge
,  case isnull(CC_UPLIFT_TYPE,CCM_UPLIFT_TYPE)
      when 1 then dbo.AA_VALUE_DPS_F
                  (
                     isnull(CC_COST_UPLIFTP,CCM_UPLIFT_VALUE)
                  )
      else
         0
   end                                                            as CC_COST_UPLIFTV      -- Uplift Value
,  case isnull(CC_UPLIFT_TYPE,CCM_UPLIFT_TYPE)
      when 0 then dbo.AA_TWO_DPS_F
                  (
                     isnull(CC_COST_UPLIFTP,CCM_UPLIFT_VALUE)
                  )
      else
         0
   end                                                            as CC_COST_UPLIFTP      -- Uplift %
,  case isnull(CC_MARGIN_TYPE,CCM_MARKUP_TYPE)
      when 1 then dbo.AA_VALUE_DPS_F(isnull(CC_MARGIN_VALUE,CCM_MARKUP_VALUE))
      else
         0
   end                                                            as CC_MARGIN_VALUE      -- Markup Value
,  case isnull(CC_MARGIN_TYPE,CCM_MARKUP_TYPE)
      when 0 then dbo.AA_TWO_DPS_F(isnull(CC_MARGIN_PC,CCM_MARKUP_P))
      else
         0
   end                                                            as CC_MARGIN_PC         -- Markup %

,  substring
   (
      '012'
   ,  charindex(isnull(CC_CATEGORY,CCM_CATEGORY),'IEB')
   ,  1
   )                                                              as CC_CATEGORY          -- Category:
                                                                                          --    0 = Income
                                                                                          --    1 = Expenditure
                                                                                          --    2 = Both

,  isnull(CC_USER_SUBTOT,CCM_SUBTOTAL_SORTKEY)                    as CC_USER_SUBTOT       -- Subtotal
,  isnull(CC_CHRG_LINE,CCM_CHRG_LINE)                             as CC_CHRG_LINE         -- Resource Rate
,  substring
   (
      '01'
   ,  charindex(isnull(CC_CHRG_RATE,CCM_CHRG_RATE),'RF')
   ,  1
   )                                                              as CC_CHRG_RATE         -- Charge Type:
                                                                                          --    0 = Resource
                                                                                          --    1 = Fixed Skill

,  isnull(CC_DATE_PUTIN,CCM_DATE_PUTIN)                           as CC_DATE_PUTIN        -- Date Inserted
,  isnull(CC_USER_PUTIN,CCM_USER_PUTIN)                           as CC_USER_PUTIN        -- User Inserted
,  CC_DATE_EDITED                                                                         -- Date Edited
,  CC_USER_EDITED                                                                         -- User Edited
,  isnull(CC_LEVEL,CCM_SECURITY_LEVEL)                            as PROFILELEVEL         -- Security Level
,  isnull(CC_USRCHAR1,CCM_USRCHAR1)                               as CC_USRCHAR1          -- User char 1
,  isnull(CC_USRCHAR2,CCM_USRCHAR2)                               as CC_USRCHAR2          -- User char 2
,  isnull(CC_USRCHAR3,CCM_USRCHAR3)                               as CC_USRCHAR3          -- User char 3
,  isnull(CC_USRCHAR4,CCM_USRCHAR4)                               as CC_USRCHAR4          -- User char 4
,  isnull(CC_USRCHAR5,CCM_USRCHAR5)                               as CC_USRCHAR5          -- User char 5
,  isnull(CC_USRCHAR6,CCM_USRCHAR6)                               as CC_USRCHAR6          -- User char 6
,  isnull(CC_USRCHAR7,CCM_USRCHAR7)                               as CC_USRCHAR7          -- User char 7
,  isnull(CC_USRCHAR8,CCM_USRCHAR8)                               as CC_USRCHAR8          -- User char 8
,  cast(isnull(CC_USRFLAG1,CCM_USRFLAG1) as bit)                  as CC_USRFLAG1          -- User flag 1
,  cast(isnull(CC_USRFLAG2,CCM_USRFLAG2) as bit)                  as CC_USRFLAG2          -- User flag 2
,  cast(isnull(CC_USRFLAG3,CCM_USRFLAG3) as bit)                  as CC_USRFLAG3          -- User flag 3
,  case isnull(CC_PRIMARY,0)
      when 0 then CCM_USRDATE1
      else
         CC_USRDATE1
   end                                                            as CC_USRDATE1          -- User date 1
,  case isnull(CC_PRIMARY,0)
      when 0 then CCM_USRDATE2
      else
         CC_USRDATE2
   end                                                            as CC_USRDATE2          -- User date 2
,  case isnull(CC_PRIMARY,0)
      when 0 then CCM_USRDATE3
      else
         CC_USRDATE3
   end                                                            as CC_USRDATE3          -- User date 3
,  dbo.AA_VALUE_DPS_F(isnull(CC_USRNUM1,CCM_USRNUM1))             as CC_USRNUM1           -- User no. 1
,  dbo.AA_VALUE_DPS_F(isnull(CC_USRNUM2,CCM_USRNUM2))             as CC_USRNUM2           -- User no. 2
,  dbo.AA_VALUE_DPS_F(isnull(CC_USRNUM3,CCM_USRNUM3))             as CC_USRNUM3           -- User no. 3
,  isnull(CC_DO_NOT_USE,CCM_DO_NOT_USE)                           as CC_DO_NOT_USE        -- Excluded
,  isnull(CC_TYPE,CCM_TYPE)                                       as CC_TYPE              -- Post type
,  isnull(CC_ALLOW_QTY_BUDGETS,CCM_ALLOW_QTY_BUDGETS)             as CC_ALLOW_QTY_BUDGETS -- Allow Quantity Budgets
,  substring
   (
      '01',
      charindex(CH_TYPE,'TP')
      ,1
   )                                                              as CH_BUDGET_STYLE      -- 0=Transactional, 1=Period
   from
      CST_COSTHEADER
         inner join CST_PROJECT_STRUCTURE_NODES    on       CPN_STRUCTURE_LINK         = CH_TEMPLATE_LINK
         inner join CST_MASTER_RECORD              on       CCM_PRIMARY                = CPN_CC_MASTER_LINK
         left  join PL_ANALYSIS  CCM_PL_ANALYSIS   on       CCM_PL_ANALYSIS.PA_PRIMARY = CCM_PURCHASE_ANALYSIS_LINK
         left  join SL_ANALYSIS  CCM_SL_ANALYSIS   on       CCM_SL_ANALYSIS.SA_PRIMARY = CCM_SALES_ANALYSIS_LINK
         left  join CST_COSTCENTRE                 on       CC_CODE                    = CCM_CODE
                                                      and   CC_COPYHEADER              = CH_CODE
            left  join CST_COSTCENTRE2                on       CC_PRIMARY_2               = CC_PRIMARY
            left  join PL_ANALYSIS     CC_PL_ANALYSIS on       CC_PL_ANALYSIS.PA_PRIMARY  = CC_PURCHASE_ANALYSIS_LINK
            left  join SL_ANALYSIS     CC_SL_ANALYSIS on       CC_SL_ANALYSIS.SACODE      = CC_ANALYSIS
