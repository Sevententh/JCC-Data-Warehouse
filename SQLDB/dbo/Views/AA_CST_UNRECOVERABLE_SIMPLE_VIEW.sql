create view AA_CST_UNRECOVERABLE_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_CST_UNRECOVERABLE_LIST_S
**
** Written     :  27/01/2006 DB
** Last Amended:  07/02/2006 DB, 10/02/2006 DB, 13/02/2006 DB, 14/02/2006 DB, 23/02/2006 DB, 24/02/2006 DB, 01/03/2006 DB, 31/03/2006 DB
**
*/
as

select
   Unrecoverable.*
,  InvoiceableValue-UpliftedCostValue                                          as Markup
,  InvoiceableValue_C-UpliftedCostValue_C                                      as Markup_C
   from
   (
      -- Derived table containing most of the fields required for view
      -- used this method because fictional Markup field is based on two other
      -- fictional fields and I didn't want copies of big calculations as
      -- they would have to be kept in sync with each other.
      select
         CST_DETAIL_Calculations.*
      ,  [Year]
         +
         case
            when WeekNo<10 then '0'
            else
               ''
         end
         +
         convert(varchar,WeekNo)                                              as YearWeek
      ,  [Year]
         +
         case
            when Period<10 then '0'
            else
               ''
         end
         +
         convert(varchar,Period)                                              as YearPeriod
      ,  UpliftedCostValue-UnrecoverableValue                                 as OutstandingValue
      ,  UpliftedCostValue_C-UnrecoverableValue_C                             as OutstandingValue_C
      ,  0                                                                    as Flag
      ,  isnull(CTT_NAME,'')                                                  as SubtypeName
      ,  CH_NAME                                                              as ProjectName
      ,  CC_NAME                                                              as CostCentreName
      ,  isnull(PRNAME,'')                                                    as ResourceName
      ,  (
            dbo.AA_VALUE_DPS_F
            (
               CT_ORIGINAL_INVOICEABLE_VALUE
               -
               case UpliftedCostValue
                  when 0 then 0
                  else
                     (
                        UnrecoverableValue
                        /
                        UpliftedCostValue
                     )
                     *
                     CT_ORIGINAL_INVOICEABLE_VALUE
               end
            )
            -
            dbo.AA_VALUE_DPS_F(CT_VALUE_INVOICED)
         )                                                                    as InvoiceableValue
      ,  (
            dbo.AA_VALUE_DPS_F
            (
               CT_ORIGINAL_INVOICEABLE_VALUE_C
               -
               case UpliftedCostValue_C
                  when 0 then 0
                  else
                     (
                        UnrecoverableValue_C
                        /
                        UpliftedCostValue_C
                     )
                     *
                     CT_ORIGINAL_INVOICEABLE_VALUE_C
               end
            )
            -
            CT_VALUE_INVOICED_C
         )                                                                    as InvoiceableValue_C
         from
            (
               -- Derived table containing fictional currency fields so
               -- calculations to get missing currency fields won't need
               -- to be repeated and kept in sync.
               select
                  CST_DETAIL_DPS.*
               ,  dbo.AA_VALUE_DPS_F
                  (
                     CT_VALUE_INVOICED
                     *
                     case UpliftedCostValue
                        when 0 then 0
                        else
                           (UpliftedCostValue_C/UpliftedCostValue)
                     end
                  )                                                           as CT_VALUE_INVOICED_C
                  from
                  (
                     select
                        CT_COSTHEADER                                         as ProjectCode
                     ,  CT_COSTCENTRE                                         as CostCentreCode
                     ,  CT_CURR_CODE                                          as CurrencySymbol
                     ,  CT_DATE_PUTIN
                     ,  CT_DETAIL
                     ,  CT_HEADER_REF
                     ,  CT_ORIGINAL_INVOICEABLE_VALUE
                     ,  CT_ORIGINAL_INVOICEABLE_VALUE_C
                     ,  CT_PRIMARY                                            as [PRIMARY]
                     ,  CT_PRIMARY                                            as AuditNo
                     ,  isnull(CT_RESOURCE,'')                                as ResourceCode
                     ,  CT_SORTTYPE
                     ,  CT_TRANSACTION_LINK
                     ,  CT_TRANSACTION_SUBTYPE_LINK
                     ,  CT_TRANTYPE
                     ,  CT_UPLIFTED_UNIT_COST                                 as UpliftedUnitCost
                     ,  CT_UPLIFTED_UNIT_COST_C                               as UpliftedUnitCost_C
                     ,  CT_UPLIFTED_COST                                      as UpliftedCostValue
                     ,  CT_UPLIFTED_COST_C                                    as UpliftedCostValue_C
                     ,  CT_USER_PUTIN
                     ,  CT_YEAR                                               as [Year]
                     ,  CT_PERIODNUMBR                                        as Period
                     ,  CT_WEEK_NO                                            as WeekNo

                     ,  dbo.AA_SIX_DPS_F(CT_CURR_RATE)                        as CT_CURR_RATE
                     ,  isnull(CT_FLAT_RATE,0)                                as CT_FLAT_RATE
                     ,  dbo.AA_QUANTITY_DPS_F(CT_QUANTITY)                    as CT_QUANTITY
                     ,  dbo.AA_QUANTITY_DPS_F(CT_UNRECOV_QUANTITY)            as UnrecoverableQuantity
                     ,  dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)                  as UnrecoverableValue
                     ,  dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE_C)                as UnrecoverableValue_C
                     ,  dbo.AA_VALUE_DPS_F(CT_VALUE_INVOICED)                 as CT_VALUE_INVOICED
                        from
                           CST_DETAIL
                        where
                                 CT_POSTTYPE    = 'C'    -- all Active cost type transactions (FS-CST-010107)
                           and   CT_ALLOCATED   = 0      -- not been flagged as ‘Release WIP’ (FS-CST-0309)
                           and   CT_STATUS      = 'A'    -- all Active cost type transactions (FS-CST-010107)
                           and   CT_BATCH_FLAG  = 0
                           and   CT_PRICE       <> 0
                  )
                  CST_DETAIL_DPS
            )
            CST_DETAIL_Calculations
               left  join CST_DETAIL2              on CT_PRIMARY_2         = [PRIMARY]
               inner join CST_COSTHEADER           on CH_CODE              = ProjectCode
               inner join CST_COSTCENTRE           on       CC_CODE        = CostCentreCode
                                                      and   CC_COPYHEADER  = ProjectCode
               left  join PRC_PRICE_RECS           on PRCODE               = ResourceCode
               left  join CST_TRANSACTION_SUBTYPE  on CTT_PRIMARY          = CT_TRANSACTION_SUBTYPE_LINK
               left  join STK_MOVEMENTS            on       SM_PRIMARY     = CT_TRANSACTION_LINK
                                                      and   CT_SORTTYPE    like 'STSTM%'
                                                      and   SM_ORIGIN      = 'M'
         where
            CT_SORTTYPE not like 'STSTM%' -- Stock Movement In is not displayed in Unrecoverable Costs lists
            or                            --    (BR-CST-010)
            (
                     CT_SORTTYPE like 'STSTM%'
               and   (
                        (SM_ASSEMBLY = 0 and SM_STATUS = 'O' and SM_VALUE <> 0)
                        or
                        (SM_ASSEMBLY = 1 and SM_VALUE > 0)
                     )
            )
   ) Unrecoverable
