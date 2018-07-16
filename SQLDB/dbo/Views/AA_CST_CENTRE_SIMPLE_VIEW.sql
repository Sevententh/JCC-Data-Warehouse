create view AA_CST_CENTRE_SIMPLE_VIEW

as
/*
** Returns a table to be used specifically with AA_CST_COSTCENTRE_LIST_S
**
** Written     :  15/03/2006 SH
** Last Amended:  
*/

select
   -- Master Cost Centre only fields
   CC_PRIMARY                                                     as [PRIMARY]         -- Cost Centre Master Primary

   -- Cost Centre only fields
,  CC_PRIMARY                                                                          -- Cost Centre Primary
,  CC_COPYHEADER                                                                       -- Project Code
,  isnull(CH_NAME,'')                                             as CH_NAME           -- Project Name
,  isnull(CH_ACCOUNT, '')                                         as CH_ACCOUNT        -- Customer Code (not in RD)
,  isnull(CC_STATUS,'')                                           as CC_STATUS         -- Cost Centre Status
,  CC_DATE_REQ                                                                         -- Deadline

   -- Fields on both Master and Cost Centre that cannot be different
,  CC_CODE                                                        as CC_CODE           -- Cost Centre Code

   -- Fields on both Master and Cost Centre that may be different
,  isnull(CC_NAME,'')                                             as CC_NAME           -- Cost Centre Name
,  isnull(CC_ANALYSIS,'')                                         as CC_ANALYSIS       -- Sales Analysis
,  isnull(CC_PL_ANALYSIS.PACODE,'')                               as PACODE            -- Purchase Analysis
,  case isnull(CC_CHRG_RATE,'')
      when 'F' then dbo.AA_PRICE_DPS_F(CC_CHRG_VALUE)
      else
         0
   end                                                            as CC_CHRG_VALUE     -- Fixed Charge
,  case isnull(CC_UPLIFT_TYPE,0)
      when 1 then dbo.AA_VALUE_DPS_F(CC_COST_UPLIFTP)
      else
         0
   end                                                            as CC_COST_UPLIFTV   -- Uplift Value
,  case isnull(CC_UPLIFT_TYPE,0)
      when 0 then dbo.AA_TWO_DPS_F(CC_COST_UPLIFTP)
      else
         0
   end                                                            as CC_COST_UPLIFTP   -- Uplift %
,  case isnull(CC_MARGIN_TYPE,0)
      when 1 then dbo.AA_VALUE_DPS_F(CC_MARGIN_VALUE)
      else
         0
   end                                                            as CC_MARGIN_VALUE   -- Markup Value
,  case isnull(CC_MARGIN_TYPE,0)
      when 0 then dbo.AA_TWO_DPS_F(CC_MARGIN_PC)
      else
         0
   end                                                            as CC_MARGIN_PC      -- Markup %
,  isnull(CC_CATEGORY,'')                                         as CC_CATEGORY       -- Category
,  isnull(CC_USER_SUBTOT,'')                                      as CC_USER_SUBTOT    -- Subtotal
,  isnull(CC_CHRG_LINE,0)                                         as CC_CHRG_LINE      -- Resource Rate
,  isnull(CC_CHRG_RATE,0)                                         as CC_CHRG_RATE      -- Rate Type
,  isnull(CC_DATE_PUTIN,'')                                       as CC_DATE_PUTIN     -- Date Inserted
,  CC_DATE_EDITED                                                                      -- Date Edited
,  isnull(CC_LEVEL,0)                                             as PROFILELEVEL      -- Security Level
,  isnull(CC_DO_NOT_USE,0)                                        as CC_DO_NOT_USE     -- Excluded
,  isnull(CC_TYPE,0)                                              as CC_TYPE           -- Post type
   from
      CST_COSTCENTRE
            left  join CST_COSTHEADER                 on CH_CODE                    = CC_COPYHEADER
            left  join PL_ANALYSIS     CC_PL_ANALYSIS on CC_PL_ANALYSIS.PA_PRIMARY  = CC_PURCHASE_ANALYSIS_LINK