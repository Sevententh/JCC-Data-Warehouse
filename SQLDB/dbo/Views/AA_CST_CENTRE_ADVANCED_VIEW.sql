create view AA_CST_CENTRE_ADVANCED_VIEW
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

,  dbo.AA_VALUE_DPS_F(CC_MARGIN_VALUE)                            as CC_MARGIN_VALUE   -- Markup Value
,  dbo.AA_TWO_DPS_F(CC_MARGIN_PC)                                 as CC_MARGIN_PC      -- Markup %
,  isnull(CC_CATEGORY,'')                                         as CC_CATEGORY       -- Category
,  isnull(CC_USER_SUBTOT,'')                                      as CC_USER_SUBTOT    -- Subtotal
,  isnull(CC_CHRG_LINE,0)                                         as CC_CHRG_LINE      -- Resource Rate
,  isnull(CC_CHRG_RATE,0)                                         as CC_CHRG_RATE      -- Rate Type
,  isnull(CC_DATE_PUTIN,'')                                       as CC_DATE_PUTIN     -- Date Inserted
,  CC_DATE_EDITED                                                                      -- Date Edited
,  isnull(CC_LEVEL,0)                                             as PROFILELEVEL      -- Security Level
,  isnull(CC_USER_PUTIN,'')                                       as CC_USER_PUTIN     -- User Inserted
,  CC_USER_EDITED                                                                      -- User Edited
,  isnull(CC_USRCHAR1,'')                                         as CC_USRCHAR1       -- User char 1
,  isnull(CC_USRCHAR2,'')                                         as CC_USRCHAR2       -- User char 2
,  isnull(CC_USRCHAR3,'')                                         as CC_USRCHAR3       -- User char 3
,  isnull(CC_USRCHAR4,'')                                         as CC_USRCHAR4       -- User char 4
,  isnull(CC_USRCHAR5,'')                                         as CC_USRCHAR5       -- User char 5
,  isnull(CC_USRCHAR6,'')                                         as CC_USRCHAR6       -- User char 6
,  isnull(CC_USRCHAR7,'')                                         as CC_USRCHAR7       -- User char 7
,  isnull(CC_USRCHAR8,'')                                         as CC_USRCHAR8       -- User char 8
,  cast(isnull(CC_USRFLAG1,0) as bit)                             as CC_USRFLAG1       -- User flag 1
,  cast(isnull(CC_USRFLAG2,0) as bit)                             as CC_USRFLAG2       -- User flag 2
,  cast(isnull(CC_USRFLAG3,0) as bit)                             as CC_USRFLAG3       -- User flag 3
,  CC_USRDATE1                                                    as CC_USRDATE1       -- User date 1
,  CC_USRDATE2                                                    as CC_USRDATE2       -- User date 2
,  CC_USRDATE3                                                    as CC_USRDATE3       -- User date 3
,  dbo.AA_VALUE_DPS_F(CC_USRNUM1)                                 as CC_USRNUM1        -- User no. 1
,  dbo.AA_VALUE_DPS_F(CC_USRNUM2)                                 as CC_USRNUM2        -- User no. 2
,  dbo.AA_VALUE_DPS_F(CC_USRNUM3)                                 as CC_USRNUM3        -- User no. 3
,  isnull(CC_DO_NOT_USE,0)                                        as CC_DO_NOT_USE     -- Excluded
,  isnull(CC_TYPE,0)                                              as CC_TYPE           -- Post type
   from
         CST_COSTCENTRE
            left  join CST_COSTCENTRE2                on CC_PRIMARY_2               = CC_PRIMARY
            left  join CST_COSTHEADER                 on CH_CODE                    = CC_COPYHEADER
            left  join PL_ANALYSIS     CC_PL_ANALYSIS on CC_PL_ANALYSIS.PA_PRIMARY  = CC_PURCHASE_ANALYSIS_LINK