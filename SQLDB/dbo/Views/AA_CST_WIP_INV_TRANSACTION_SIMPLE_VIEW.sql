create view AA_CST_WIP_INV_TRANSACTION_SIMPLE_VIEW
as
/*
**
** Intended to be called by AA_CST_WIP_INV_TRANSACTION_LIST_S
** The following fields are intended to be displayed:
**          Project code                     - PROJECT_CODE
**          Project Name                     - PROJECT_NAME
**          Costcentre Code                  - COSTCENTRE_CODE
**          Costcentre Name                  - COSTCENTRE_NAME
**          Resource Code                    - RESOURCE_CODE
**          Resource Name                    - RESOURCE_NAME
**          Transaction Date                 - CT_DATE
**          Quantity                         - QUANTITY
**          Home Uplifted Value              - UPLIFTED_COST_VALUE
**          Home Invoiceable Value           - INVOICEABLE_VALUE
**          Currency Code                    - CURRENCY_CODE
**          Currency Uplifted Value          - UPLIFTED_COST_VALUE_C
**          Currency Invoicable Value        - INVOICEABLE_VALUE_C
**          Invoiced Flag                    - CT_INVOICE_FLAG
**          Origin                           - CT_PUTIN_LEDGER
**          Transaction Type                 - CT_TRANTYPE
**          Header Reference                 - CT_HEADER_REF
**          Account Code                     - CT_ACCOUNT
**          Customer Code                    - CUSTOMER_CODE
**          Percentage to Invoice            - MS_PERCENTAGE
**          Cost to Invoice                  - COST_TO_INVOICE
**          Invoice Value                    - VALUE_INVOICED
**
** The following fields are required for searching:
**          Project Code                     - CT_COSTHEADER
**          Costcentre                       - CT_COSTCENTRE
**          Customer Code                    - CH_ACCOUNT
**          Milestone Date                   - MS_DATE
**          Year (L,C,N)                     - CT_YEAR
**          Period (1-13)                    - CT_PERIODNUMBR
**          Week Number                      - CT_WEEK_NO
**          Project Status                   - CH_STATUS
**          WIP Invoicing Style              - CH_INVOICE_STYLE
**          Currency Code                    - CUCURRENCYCODE
**          Any Currency Flag                - CU_MULTI_CURR
**
**          [PRIMARY] identifies a row in the result set
**
** The list will be sorted by PRIMARY with any other supplied order by field
**
** Written     :  11/01/2006 SB
** Last Amended:  25/01/2006 DB
*/
select
   CT_PRIMARY                                               [PRIMARY]
   --DISPLAY FIELDS
,  isnull(CT_COSTHEADER,'')                                 PROJECT_CODE
,  isnull(CH_NAME,      '')                                 PROJECT_NAME
,  isnull(CT_COSTCENTRE,'')                                 COSTCENTRE_CODE
,  isnull(CC_NAME,      '')                                 COSTCENTRE_NAME
,  isnull(CT_RESOURCE,  '')                                 RESOURCE_CODE
,  isnull(PRNAME,       '')                                 RESOURCE_NAME
,  CT_DATE
,  dbo.AA_VALUE_DPS_F(CT_QUANTITY 
   - 
   CT_UNRECOV_QUANTITY)                                     QUANTITY
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F
      (
         CT_PRICE
         +
         CT_RES_UPLV
      )
      *
      case
         when CT_QUANTITY = 0 then 1
         else
            CT_QUANTITY
            - 
            CT_UNRECOV_QUANTITY       
      end
   )
   +
   dbo.AA_VALUE_DPS_F(CT_CENTRE_UPLV)
   -
   dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)                     UPLIFTED_COST_VALUE     -- home uplifted cost value
,  case when CT_UNRECOV_QUANTITY = 0 then
      case
         when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RESOURCE_MARGIN_VALUE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
               end
            )
            +
            dbo.AA_VALUE_DPS_F(CT_CC_MARGIN_VALUE)
         else
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RES_UPLV
                  +
                  CT_RESOURCE_MARGIN_VALUE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
               end
            )
            +
            dbo.AA_VALUE_DPS_F
            (
               CT_CENTRE_UPLV
               +
               CT_CC_MARGIN_VALUE
            )
      end                                                                -- original home invoiceable value
   else
      case
         when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RESOURCE_MARGIN_VALUE
                  -
                  CT_UNRECOV_VALUE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY      
               end
            )
            +
            dbo.AA_VALUE_DPS_F(CT_CC_MARGIN_VALUE)
         else
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RES_UPLV
                  +
                  CT_RESOURCE_MARGIN_VALUE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY       
               end
            )
            +
            dbo.AA_VALUE_DPS_F
            (
               CT_CENTRE_UPLV
               +
               CT_CC_MARGIN_VALUE
            )
      end
      *
      case when
         dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RES_UPLV
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY      
               end
            )
            +
            dbo.AA_VALUE_DPS_F(CT_CENTRE_UPLV)
            -
            dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)
         = 0 then dbo.AA_VALUE_DPS_F(0)
      else
         (
         dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)
         /
         dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RES_UPLV
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY       
               end
            )
            +
            dbo.AA_VALUE_DPS_F(CT_CENTRE_UPLV)
            -
            dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)
         )
      end
   end                                                      INVOICEABLE_VALUE       -- home invoiceable value
,  isnull(CT_CURR_CODE,'')                                  CURRENCY_CODE
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F
      (
         CT_CURR_PRICE
         +
         CT_CURR_RESUPLV
      )
      *
      case
         when CT_QUANTITY = 0 then 1
         else
            CT_QUANTITY
            - 
            CT_UNRECOV_QUANTITY       
      end
   )
   +
   dbo.AA_VALUE_DPS_F(CT_CURR_CNTUPLV)
   -
   dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)           
   *
   CT_CURR_RATE                                             UPLIFTED_COST_VALUE_C   -- currency uplifted cost value

,  case when CT_UNRECOV_QUANTITY = 0 then 
      case
         when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RESOURCE_MARGIN_VALUE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
               end
            )
            +
            dbo.AA_VALUE_DPS_F(CT_CC_MARGIN_VALUE)
         else
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_CURR_PRICE
                  +
                  CT_CURR_RESUPLV
                  +
                  CT_RESOURCE_MARGIN_VALUE
                  *
                  CT_CURR_RATE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
               end
            )
            +
            dbo.AA_VALUE_DPS_F
            (
               CT_CURR_CNTUPLV
               +
               CT_CC_MARGIN_VALUE
               *
               CT_CURR_RATE
            )
      end                                                              --original currency invoiceable value
   else
      case
         when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_PRICE
                  +
                  CT_RESOURCE_MARGIN_VALUE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY       
               end
            )
            +
            dbo.AA_VALUE_DPS_F(CT_CC_MARGIN_VALUE)
         else
            dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_CURR_PRICE
                  +
                  CT_CURR_RESUPLV
                  +
                  CT_RESOURCE_MARGIN_VALUE
                  *
                  CT_CURR_RATE
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY       
               end
            )
            +
            dbo.AA_VALUE_DPS_F
            (
               CT_CURR_CNTUPLV
               +
               CT_CC_MARGIN_VALUE
               *
               CT_CURR_RATE
            )
      end
      *
      case when 
      (
         dbo.AA_VALUE_DPS_F
         (
            dbo.AA_PRICE_DPS_F
            (
               CT_CURR_PRICE
               +
               CT_CURR_RESUPLV
            )
            *
            case
               when CT_QUANTITY = 0 then 1
               else
                  CT_QUANTITY
                  - 
                  CT_UNRECOV_QUANTITY       
            end
         )
         +
         dbo.AA_VALUE_DPS_F(CT_CURR_CNTUPLV)
         -
         dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)           
         *
         CT_CURR_RATE   
      ) 
      = 0 then dbo.AA_VALUE_DPS_F(0)
      else
         dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)
         /
         dbo.AA_VALUE_DPS_F
            (
               dbo.AA_PRICE_DPS_F
               (
                  CT_CURR_PRICE
                  +
                  CT_CURR_RESUPLV
               )
               *
               case
                  when CT_QUANTITY = 0 then 1
                  else
                     CT_QUANTITY
                     - 
                     CT_UNRECOV_QUANTITY       
         end
      )
      +
      dbo.AA_VALUE_DPS_F(CT_CURR_CNTUPLV)
      -
      dbo.AA_VALUE_DPS_F(CT_UNRECOV_VALUE)           
      *
      CT_CURR_RATE   end

   end                                                      INVOICEABLE_VALUE_C     -- currency invoiceable value
,  isnull(CT_INVOICE_FLAG, 0)                               CT_INVOICE_FLAG
,  isnull(CT_PUTIN_LEDGER, '')                              CT_PUTIN_LEDGER         -- origin
,  isnull(CT_TRANTYPE,     '')                              CT_TRANTYPE             -- transaction type
,  isnull(CT_HEADER_REF,   '')                              CT_HEADER_REF
,  isnull(CT_ACCOUNT,      '')                              CT_ACCOUNT              -- account code
,  isnull(CH_ACCOUNT,      '')                              CUSTOMER_CODE           -- customer code
,  dbo.AA_VALUE_DPS_F(MS_PERCENTAGE)                        MS_PERCENTAGE           -- percentage to invoice
,  dbo.AA_VALUE_DPS_F(isnull(MS_PERCENTAGE,0))
   *
   (
      dbo.AA_VALUE_DPS_F
      (
         dbo.AA_PRICE_DPS_F
         (
            CT_CURR_PRICE
            +
            CT_CURR_RESUPLV
         )
         *
         case
            when CT_QUANTITY = 0 then 1
            else
               CT_QUANTITY
               - 
               CT_UNRECOV_QUANTITY       
         end
      )
      +
      dbo.AA_VALUE_DPS_F(CT_CURR_CNTUPLV)
   )                                                        COST_TO_INVOICE         -- currency uplifted cost value
   ,dbo.AA_VALUE_DPS_F(MS_PERCENTAGE)
      *
      (
         case
            when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
               dbo.AA_VALUE_DPS_F
               (
                  dbo.AA_PRICE_DPS_F
                  (
                     CT_PRICE
                     +
                     CT_RESOURCE_MARGIN_VALUE
                  )
                  *
                  case
                     when CT_QUANTITY = 0 then 1
                     else
                        CT_QUANTITY
                        - 
                        CT_UNRECOV_QUANTITY      
                  end
               )
               +
               dbo.AA_VALUE_DPS_F(CT_CC_MARGIN_VALUE)
            else
               dbo.AA_VALUE_DPS_F
               (
                  dbo.AA_PRICE_DPS_F
                  (
                     CT_CURR_PRICE
                     +
                     CT_CURR_RESUPLV
                     +
                     CT_RESOURCE_MARGIN_VALUE
                     *
                     CT_CURR_RATE
                  )
                  *
                  case
                     when CT_QUANTITY = 0 then 1
                     else
                        CT_QUANTITY
                        - 
                        CT_UNRECOV_QUANTITY      
                  end
               )
               +
               dbo.AA_VALUE_DPS_F
               (
                  CT_CURR_CNTUPLV
                  +
                  CT_CC_MARGIN_VALUE
                  *
                  CT_CURR_RATE
               )
         end
      )
                                                            INVOICE_VALUE     -- currency invoiceable value
   -- SEARCH FIELDS
,  CT_COSTHEADER                                                             -- Project
,  CT_COSTCENTRE                                                             -- Cost Centre
,  CH_ACCOUNT                                                                -- Customer
,  MS_DATE                                                                   -- Milestone Date
,  CT_YEAR                                                                   -- Year
,  CT_PERIODNUMBR                                                            -- Period
,  CT_WEEK_NO                                                                -- Week No
,  CH_STATUS                                                                 -- Project Status
,  CH_INVOICE_STYLE                                                          -- WIP Invoicing Method
,  CUCURRENCYCODE                                                            -- Customer Currency Code
,  CU_MULTI_CURR                                                             -- 1 = Customer is Any Currency;
                                                                             -- 0 = Customer only trades in its
                                                                             --     CUCURRENCYCODE
   from
      CST_COSTHEADER
         left  join CST_MILESTONES     on       MS_PRIMARY     = CH_NEXT_MILESTONE_LINK
         left  join SL_ACCOUNTS        on       CUCODE         = CH_ACCOUNT
         inner join CST_DETAIL         on       CT_COSTHEADER  = CH_CODE
         inner join CST_COSTCENTRE     on       CC_CODE        = CT_COSTCENTRE
                                       and      CC_COPYHEADER  = CH_CODE
         left  join PRC_PRICE_RECS     on       PRCODE         = CT_RESOURCE
         left  join SYS_DATAINFO3      on       SYS_PRIMARY_3  = 1

   where
            CT_INVOICE_FLAG   = 0            -- Transaction is not already invoiced
      and   CT_ALLOCATED      = 0            -- Transaction is not already allocated
      and   CT_POSTTYPE       = 'C'          -- Post Type is not Sales
      and   CH_STATUS         in ('A','R')   -- Active Projects only
      and   CT_STATUS         = 'A'          -- Active Transactions only
      and   CT_BATCH_FLAG     = 0            -- Transaction is not in a batch
