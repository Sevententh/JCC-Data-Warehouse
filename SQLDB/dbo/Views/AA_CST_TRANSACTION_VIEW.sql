create view AA_CST_TRANSACTION_VIEW

/*
** Only shows transactions entered through the Costing Module.
** Note: If a column is compulsory in all costing transaction types then a default is not provided.
**
** Written     :  25/01/2006 LM
** Last Amended:  26/01/2006 LM, 31/01/2006 SR, 10/02/2006 LM, 13/02/2006 LM, 17/02/2006 LM, 02/03/2006 DB
*/

as

select
   cast(CT_PRIMARY as int)                                  as [PRIMARY]                  -- Costing Detail Primary
,  case CT_TRANTYPE
      when 'MSC' then 0
      when 'SAL' then 1
      when 'TIM' then 2
   end                                                      as CT_TRANTYPE                -- Transaction Type

/*
** Header Fields
*/
,  isnull(CT_HEADER_REF,'')                                 as CT_HEADER_REF              -- Reference
,  CT_DATE                                                                                -- Date
,  case CT_YEAR
      when 'C' then 0
      when 'N' then 1
   end                                                      as CT_YEAR                    -- Year
,  CT_PERIODNUMBR                                                                         -- Period
,  CT_WEEK_NO                                                                             -- Week Number
,  isnull(CT_DESCRIPTION,'')                                as CT_DESCRIPTION             -- Description
,  isnull(CT_BATCH_REF,'')                                  as CT_BATCH_REF               -- Batch Reference
,  CT_BATCH_FLAG                                                                          -- Batch Transaction
,  case CT_TRANTYPE
      when 'MSC' then   case  substring
                              (
                                 isnull(CT_TRAN_OPTIONS,'')
                              ,  10
                              ,  1
                              )
                           when '1' then 1
                           else
                              0
                        end
      when 'SAL' then   case substring
                              (
                                 isnull(CT_TRAN_OPTIONS,'')
                              ,  6
                              ,  1
                              )
                           when '1' then 1
                           else
                              0
                        end
      when 'TIM' then   case substring
                              (
                                 isnull(CT_TRAN_OPTIONS,'')
                              ,  11
                              ,  1
                              )
                           when '1' then 1
                           else
                              0
                        end
   end                                                      as EnterCurrency              -- Enter Currency
,  CT_ARCHIVE_FLG                                                                         -- Archive Transaction
,  case CT_TRANTYPE
      when 'MSC' then   0
      when 'SAL' then   0
      when 'TIM' then   case substring
                              (
                                 isnull(CT_TRAN_OPTIONS,'')
                              ,  12
                              ,  1
                              )
                           when '1' then 1
                           else
                              0
                        end
   end                                                      as ExcludeResourceFlag        -- Exclude Resource Uplift
,  case CT_TRANTYPE
      when 'MSC' then   0
      when 'SAL' then   0
      when 'TIM' then   case substring
                              (
                                 isnull(CT_TRAN_OPTIONS,'')
                              ,  13
                              ,  1
                              )
                           when '1' then 1
                           else
                              0
                        end
   end                                                      as CopyResourceNotesToDetail  -- Copy Resource Notes into
                                                                                          --    Detail

/*
** Detail Fields
*/
,  case CT_STATUS
      when 'A' then 0
      when 'E' then 1
   end                                                      as CT_STATUS                  -- Status
,  isnull(CT_RESOURCE,'')                                   as CT_RESOURCE                -- Resource Code
,  isnull(PRNAME,'')                                        as PRNAME                     -- Resource Name
,  CT_COSTHEADER                                                                          -- Project Code
,  isnull(CH_NAME,'')                                       as CH_NAME                    -- Project Name
,  CT_COSTCENTRE                                                                          -- Cost Centre Code
,  isnull(CC_NAME,'')                                       as CC_NAME                    -- Cost Centre Name
,  isnull
   (
      case CC_CATEGORY
         when 'E' then 0
         when 'I' then 1
         when 'B' then 2
         else
            -1
      end
   ,  -1
   )                                                        as CC_CATEGORY                -- Cost Centre Type
,  isnull(S1.PP_CODE,'')                                    as PersonCode                 -- Person Code
,  isnull(ProjectPerson.PP_CODE,'')                         as ProjectLeader              -- Project Leader
,  dbo.AA_QUANTITY_DPS_F(CT_TIME_UNIT_QUANTITY)             as CT_TIME_UNIT_QUANTITY      -- Number of Units of Measure
,  dbo.AA_QUANTITY_DPS_F(CT_TIME_UNITS)                     as CT_TIME_UNITS              -- 'Quantity' portion of the Unit
                                                                                          --    of Measure
,  case CT_TIME_UNIT_TYPE
      when 'H' then 0
      when 'D' then 1
      else
         -1
   end                                                      as CT_TIME_UNIT_TYPE          -- 'Measure' portion of the Unit
                                                                                          --    of Measure (H)our, (D)ay
,  dbo.AA_QUANTITY_DPS_F(CT_QUANTITY)                       as CT_QUANTITY                -- Quantity
,  dbo.AA_PRICE_DPS_F(CT_PRICE)                             as CT_PRICE                   -- Base Unit/Hourly Cost
,  isnull(CT_PAYTYPE_CODE,'')                               as CT_PAYTYPE_CODE            -- Paytype Code
,  dbo.AA_VALUE_DPS_F(CT_NETT)                              as CT_NETT                    -- Value
,  CT_UPLIFTED_COST                                         as UpliftedCost               -- Uplifted Cost
,  dbo.AA_TWO_DPS_F(CT_RES_UPLP)                            as ResourceUpliftPC           -- Resource Uplift Percent
,  dbo.AA_PRICE_DPS_F(CT_RES_UPLV)                          as ResourceUpliftVal          -- Resource Uplift Value
                                                                                          --    Single Quantity
,  isnull(CT_CC_UPLTYPE,0)                                  as CostCentreUpliftType       -- Cost Centre Uplift Type
,  case isnull(CT_CC_UPLTYPE,0)
      when 0 then dbo.AA_TWO_DPS_F(CT_CENTRE_UPLP)
      when 1 then 0
   end                                                      as CostCentreUpliftPC         -- Cost Centre Uplift Percent
,  dbo.AA_PRICE_DPS_F
   (
      case CT_CC_UPLTYPE
         when 0 then dbo.AA_PRICE_DPS_F(CT_PRICE)  -- %
                     *
                     dbo.AA_TWO_DPS_F(CT_CENTRE_UPLP)
                     /
                     100
         else                                      -- Value
            isnull(CT_CENTRE_UPLP,0)
            -- single quantity value
            --    if type is value
      end
   )                                                        as CostCentreUpliftVal        -- Cost Centre Uplift Value
                                                                                          --    Single Quantity
,  dbo.AA_TWO_DPS_F(CT_RESOURCE_MARGIN_PC)                  as ResourceMarkupPC           -- Resource Markup Percent
,  dbo.AA_PRICE_DPS_F(CT_RESOURCE_MARGIN_VALUE)             as ResourceMarkupVal          -- Resource Markup Value

,  isnull(CT_CC_MARGIN_TYPE,0)                              as CostCentreMarkupType       -- Cost Centre Markup Type
,  case isnull(CT_CC_MARGIN_TYPE,0)
      when 0 then dbo.AA_TWO_DPS_F(CT_CC_MARGIN_PC)
      when 1 then 0
   end                                                      as CostCentreMarkupPC         -- Cost Centre Markup Percent
,  dbo.AA_PRICE_DPS_F
   (
      case isnull(CT_CC_MARGIN_TYPE,0)
         when 0 then 0
         when 1 then dbo.AA_PRICE_DPS_F(CT_CC_MARGIN_PC)
      end
   )                                                        as CostCentreMarkupVal        -- Cost Centre Markup Value
,  (
      dbo.AA_VALUE_DPS_F
      (
         CT_ORIGINAL_INVOICEABLE_VALUE
         -
         case CT_UPLIFTED_COST
            when 0 then 0
            else
               (
                  isnull(CT_UNRECOV_VALUE,0)
                  /
                  CT_UPLIFTED_COST
               )
               *
               CT_ORIGINAL_INVOICEABLE_VALUE
         end
      )
      -
      dbo.AA_VALUE_DPS_F(CT_VALUE_INVOICED)
   )                                                        as InvoiceableValue           -- Invoiceable Value
,  CT_CURR_CODE                                                                           -- Curr Symbol
,  dbo.AA_PRICE_DPS_F(CT_CURR_PRICE)                        as CT_CURR_PRICE              -- Curr Base Unit/Hourly Cost
,  dbo.AA_SIX_DPS_F(CT_CURR_RATE)                           as CT_CURR_RATE               -- Curr Rate
,  dbo.AA_VALUE_DPS_F(CT_CURR_VALUE)                        as CT_CURR_NETT               -- Curr Nett
,  CT_UPLIFTED_COST_C                                       as CurrUpliftedCost           -- Curr Uplifted Cost
,  dbo.AA_PRICE_DPS_F(CT_CURR_RESUPLV)                      as CurrResourceUpliftVal      -- Curr Resource Uplift Value
,  dbo.AA_PRICE_DPS_F(CT_CURR_CC_UPLIFT_UNIT_VAL)           as CurrCostCentreUpliftVal    -- Curr Cost Centre Uplift Value
                                                                                          --    Single Quantity
,  dbo.AA_PRICE_DPS_F(CT_CURR_RESOURCE_MARGIN_VALUE)        as CurrResourceMarkupVal      -- Curr Resource Markup Value
,  dbo.AA_PRICE_DPS_F
   (
      case isnull(CT_CC_MARGIN_TYPE,0)
         when 0 then 0
         when 1 then dbo.AA_PRICE_DPS_F(CT_CC_MARGIN_PC)
      end
   )
   *
   (CT_UPLIFTED_COST_C/CT_UPLIFTED_COST)                    as CurrCostCentreMarkupVal    -- Curr Cost Centre Markup Value
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_VALUE_DPS_F
      (
         CT_ORIGINAL_INVOICEABLE_VALUE_C
         -
         case CT_UPLIFTED_COST_C
            when 0 then 0
            else
               (
                  isnull(CT_UNRECOV_VALUE_C,0)
                  /
                  CT_UPLIFTED_COST_C
               )
               *
               CT_ORIGINAL_INVOICEABLE_VALUE_C
         end
      )
      -
      (
         isnull(CT_VALUE_INVOICED,0)
         *
         (CT_UPLIFTED_COST_C/CT_UPLIFTED_COST)
      )
   )                                                        as CurrInvoiceableValue       -- Curr Invoiceable Value
,  isnull(CT_RESLINE,0)                                     as CT_RESLINE                 -- Resource Rate
,  isnull(R_DESCRIPTION,'')                                 as R_DESCRIPTION              -- Resource Rate Description
,  isnull(CT_DETAIL,'')                                     as CT_DETAIL                  -- Detail
,  isnull(CT_ACCOUNT,'')                                    as CT_ACCOUNT                 -- Customer/Supplier Code
,  isnull(CUNAME,'')                                        as CUNAME                     -- Customer Name
,  isnull(SUNAME,'')                                        as SUNAME                     -- Supplier Name
,  dbo.AA_VALUE_DPS_F(CH_ACTUAL_COST)                       as CH_ACTUAL_COST             -- Actual Project Costs
,  dbo.AA_VALUE_DPS_F
   (
      isnull
      (
         case CH_BUDGET_REVISED
            when 0 then CH_COST_OBUDG1
            when 1 then case CST_OBUDG_REV1_ONLY
                           when 0 then CH_COST_OBUDG1
                                       +
                                       CH_COST_RBUDG2
                           when 1 then CH_COST_RBUDG2
                        end
         end
      ,  0
      )
   )                                                        as EstimatedProjectCosts
,  dbo.AA_VALUE_DPS_F(CH_ACTUAL_SALES)                      as CH_ACTUAL_SALES            -- Actual Project Sales
,  dbo.AA_VALUE_DPS_F
   (
      isnull
      (
         case CH_BUDGET_REVISED
            when 0 then CH_SALE_OBUDG1
            when 1 then case CST_OBUDG_REV1_ONLY
                           when 0 then CH_SALE_OBUDG1
                                       +
                                       CH_SALE_RBUDG2
                           when 1 then CH_SALE_RBUDG2
                        end
         end
      ,  0
      )
   )                                                        as EstimatedProjectSales
,  dbo.AA_VALUE_DPS_F(CC_ACTUAL_COST)                       as CC_ACTUAL_COST             -- Actual CC Costs
,  dbo.AA_VALUE_DPS_F
   (
      isnull
      (
         case CC_BUDGET_REVISED
            when 0 then CC_COST_OBUDG1
            when 1 then case CST_OBUDG_REV1_ONLY
                           when 0 then CC_COST_OBUDG1
                                       +
                                       CC_COST_RBUDG2
                           when 1 then CC_COST_RBUDG2
                        end
         end
      ,  0
      )
   )                                                        as EstimatedCostCentreCosts
,  dbo.AA_VALUE_DPS_F(CC_ACTUAL_SALES)                      as CC_ACTUAL_SALES            -- Actual CC Sales
,  dbo.AA_VALUE_DPS_F
   (
      isnull
      (
         case CC_BUDGET_REVISED
            when 0 then CC_SALE_OBUDG1
            when 1 then case CST_OBUDG_REV1_ONLY
                           when 0 then CC_SALE_OBUDG1
                                       +
                                       CC_SALE_RBUDG2
                           when 1 then CC_SALE_RBUDG2
                        end
         end
      ,  0
      )
   )                                                        as EstimatedCostCentreSales
,  isnull(CT_USRCHAR1,'')                                   as CT_USRCHAR1                -- User Char 1
,  isnull(CT_USRCHAR2,'')                                   as CT_USRCHAR2                -- User Char 2
,  isnull(CT_USRCHAR3,'')                                   as CT_USRCHAR3                -- User Char 3
,  isnull(CT_USRCHAR4,'')                                   as CT_USRCHAR4                -- User Char 4
,  CT_USRDATE1                                                                            -- User Date 1
,  CT_USRDATE2                                                                            -- User Date 2
,  isnull(CT_USRFLAG1,0)                                    as CT_USRFLAG1                -- User Flag 1
,  isnull(CT_USRFLAG2,0)                                    as CT_USRFLAG2                -- User Flag 2
,  dbo.AA_VALUE_DPS_F(CT_USRNUM1)                           as CT_USRNUM1                 -- User Number 1
,  dbo.AA_VALUE_DPS_F(CT_USRNUM2)                           as CT_USRNUM2                 -- User Number 2
,  isnull(CT_USER_KEY1,'')                                  as CT_USER_KEY1               -- Transaction User Key 1
,  isnull(CT_USER_KEY2,'')                                  as CT_USER_KEY2               -- Transaction User Key 2
,  isnull(CT_USER_KEY3,'')                                  as CT_USER_KEY3               -- Transaction User Key 3
,  isnull(CH_NOTES,'')                                      as CH_NOTES                   -- Project Notes
,  isnull(CC_NOTES,'')                                      as CC_NOTES                   -- Cost Centre Notes
,  isnull(PR_NOTES,'')                                      as PR_NOTES                   -- Resource Notes

   from
      CST_DETAIL
         left outer join CST_DETAIL2                        on CT_PRIMARY_2               = CT_PRIMARY
         left outer join PRC_PRICE_RECS                     on PRCODE                     = CT_RESOURCE
         left outer join CST_COSTHEADER                     on CH_CODE                    = CT_COSTHEADER
         left outer join CST_COSTCENTRE                     on CC_CONCAT_CODES            = convert(char(10),CT_COSTHEADER)
                                                                                            +
                                                                                            CT_COSTCENTRE
         left outer join SYS_PEOPLE          S1             on S1.PP_PRIMARY              = PR_PERSON_LINK
         left outer join SYS_PEOPLE          ProjectPerson  on ProjectPerson.PP_PRIMARY   = CH_PERSON_LINK
         left outer join SYS_RESOURCE_RATES                 on R_RATE_NUMBER              = CT_RESLINE
         left outer join SL_ACCOUNTS                        on CUCODE                     = CT_ACCOUNT
         left outer join PL_ACCOUNTS                        on SUCODE                     = CT_ACCOUNT
   ,  SYS_DATAINFO2
   where
            CT_PUTIN_LEDGER   = 'CST'
      and   SYS_PRIMARY_2     = 1