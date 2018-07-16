create view AA_CST_CENTRE_TRANSACTION_SIMPLE_VIEW

/*
** Written     : 20/01/2006 JC
** Last Amended: 
*/

as

select 
    D.CT_PRIMARY                                                                                       [PRIMARY]
,   CST_ANALYSE_BY
,   isnull(D.CT_COSTCENTRE,'')                                                                         COSTCENTRE_CODE
,   isnull(D.CT_COSTHEADER,'')                                                                         PROJECT_CODE
,   D.CT_DATE
,   D.CT_YEAR + case when CT_WEEK_NO > 9 
                   then cast(CT_WEEK_NO as varchar(2))
                   else '0' + cast(CT_WEEK_NO as varchar(1))
                end                                                                                    YEAR_WEEK
,   D.CT_YEAR + case when CT_PERIODNUMBR > 9 
                   then cast(CT_PERIODNUMBR as varchar(2))
                   else '0' + cast(CT_PERIODNUMBR as varchar(1))
                end                                                                                    YEAR_PERIOD
,   D.CT_STATUS
,   D.CT_PUTIN_LEDGER
,   D.CT_TRANTYPE
,   isnull(S.CTT_NAME,'')                                                                              SUBTYPE_NAME
,   isnull(D.CT_HEADER_REF,'')                                                                         HEADER_REF
,   dbo.AA_VALUE_DPS_F(isnull(D.CT_QUANTITY,0))                                                        CT_QUANTITY
,   dbo.AA_VALUE_DPS_F(D.CT_GROSS)                                                                     HOME_VALUE
,   dbo.AA_VALUE_DPS_F(D.CT_GROSS)
    -
    dbo.AA_VALUE_DPS_F(D.CT_CENTRE_UPLV)                                                               HOME_UPLIFTED_VALUE
,   dbo.AA_VALUE_DPS_F
    (
      dbo.AA_PRICE_DPS_F(isnull(CT_PRICE,0))
      *
      case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
    )                                                                                                  HOME_WIP
,   case  when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
             dbo.AA_VALUE_DPS_F
             (
                dbo.AA_PRICE_DPS_F
                (
                   isnull(CT_PRICE,0)
                   +
                   isnull(CT_RESOURCE_MARGIN_VALUE,0)
                )
                *
                case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
             )                                                                                      
             +
             dbo.AA_VALUE_DPS_F(isnull(CT_CC_MARGIN_VALUE,0))
          else
             dbo.AA_VALUE_DPS_F
             (
                dbo.AA_PRICE_DPS_F
                (
                   isnull(CT_PRICE,0)
                   +
                   isnull(CT_RES_UPLV,0)
                   +
                   isnull(CT_RESOURCE_MARGIN_VALUE,0)
                )
                *
                case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
             )                                                                                      
             +
             dbo.AA_VALUE_DPS_F
             (
                isnull(CT_CENTRE_UPLV,0)
                +
                isnull(CT_CC_MARGIN_VALUE,0)
             )
          end                                                                                          HOME_INVOICEABLE_WIP

,   dbo.AA_VALUE_DPS_F(D.CT_GROSS)
    + 
    dbo.AA_VALUE_DPS_F(CT_VAT)                                                                         HOME_SALES_VALUE
,   cast(D.CT_BATCH_FLAG as bit)                                                                       CT_BATCH_FLAG
,   D.CT_BATCH_POSTED
,   isnull(D.CT_RESOURCE,'')                                                                           RESOURCE_CODE
,   isnull(P.CH_NAME,'')                                                                               PROJECT_NAME
,   isnull(C.CC_NAME,'')                                                                               COSTCENTRE_NAME
,   isnull(R.PRNAME,'')                                                                                RESOURCE_NAME
,   dbo.AA_VALUE_DPS_F
    (
       dbo.AA_PRICE_DPS_F
       (
          isnull(CT_RES_UPLV,0)
       )
       *
       case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
    )
    +
    dbo.AA_VALUE_DPS_F(isnull(CT_CENTRE_UPLV,0))                                                       HOME_UPLIFT
,   dbo.AA_VALUE_DPS_F(isnull(CT_CC_MARGIN_VALUE,0))                                                   HOME_MARKUP
,   D.CT_POSTTYPE
,   dbo.AA_PRICE_DPS_F(CT_PRICE)                                                                       HOME_PRICE
,   dbo.AA_PRICE_DPS_F(CC_COST_UPLIFTP)                                                                HOME_UPLIFT_HOURLY
,   isnull(D.CT_ACCOUNT,'')                                                                            ACCOUNT_CODE
,   case D.CT_PUTIN_LEDGER
       when 'SL' then SL.CUNAME
       when 'PL' then PL.SUNAME
       else ''
    end                                                                                                ACCOUNT_NAME
,   case D.CT_PUTIN_LEDGER
       when 'SL' then SL.CU_PRIMARY
       when 'PL' then PL.SU_PRIMARY
       when 'NL' then NL.N_PRIMARY
       else ''
    end                                                                                                ACCOUNT_PRIMARY
,   isnull(D.CT_NOMINAL,'')                                                                            NOMINAL_CODE
,   isnull(NL.NNAME,'')                                                                                NOMINAL_NAME
,   isnull(D.CT_ANALYSIS,'')                                                                           ANALYSIS_CODE
,   case D.CT_PUTIN_LEDGER
       when 'SL' then SA.SANAME
       when 'PL' then PA.PANAME
       else ''
    end                                                                                                ANALYSIS_NAME
,   case D.CT_PUTIN_LEDGER
       when 'SL' then SA.SA_PRIMARY
       when 'PL' then PA.PA_PRIMARY
       else ''
    end                                                                                                ANALYSIS_PRIMARY
,   isnull(D.CT_STOCKCODE,'')                                                                          STOCK_CODE
,   isnull(STK.STKNAME,'')                                                                             STOCK_NAME
,   isnull(CT_WEEK_NO,0)                                                                               [WEEK]
,   isnull(CT_PERIODNUMBR,0)                                                                           PERIOD
,   D.CT_YEAR
,   D.CT_CURR_CODE
,   dbo.AA_VALUE_DPS_F
    (
       dbo.AA_PRICE_DPS_F(isnull(CT_CURR_PRICE,0))
       *
       case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
    )                                                                                                  CURR_VALUE
,   dbo.AA_VALUE_DPS_F
    (
       dbo.AA_PRICE_DPS_F
       (
          isnull(CT_CURR_PRICE,0)
          +
          isnull(CT_CURR_RESUPLV,0)
       )
       *
       case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
    )
    +
    dbo.AA_VALUE_DPS_F(isnull(CT_CURR_CNTUPLV,0))                                                      CURR_UPLIFTED_VALUE
,   dbo.AA_VALUE_DPS_F
    (
      (
         dbo.AA_PRICE_DPS_F(isnull(CT_PRICE,0))
         *
         case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
      )
      *
      CT_CURR_RATE
    )                                                                                                  CURR_WIP
,   case  when CST_INVOICEABLE_VALUE_CALC_OPT = 0 then
             dbo.AA_VALUE_DPS_F
             (
                dbo.AA_PRICE_DPS_F
                (
                   isnull(CT_PRICE,0)
                   +
                   isnull(CT_RESOURCE_MARGIN_VALUE,0)
                )
                *
                case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
             )                                                                                      
             +
             dbo.AA_VALUE_DPS_F(isnull(CT_CC_MARGIN_VALUE,0))
          else
             dbo.AA_VALUE_DPS_F
             (
                dbo.AA_PRICE_DPS_F
                (
                   isnull(CT_CURR_PRICE,0)
                   +
                   isnull(CT_CURR_RESUPLV,0)
                   +
                   isnull(CT_RESOURCE_MARGIN_VALUE,0)
                   *
                   isnull(CT_CURR_RATE,1)
                )
                *
                case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
             )                                                                                      
             +
             dbo.AA_VALUE_DPS_F
             (
                isnull(CT_CURR_CNTUPLV,0)
                +
                isnull(CT_CC_MARGIN_VALUE,0)
                *
                isnull(CT_CURR_RATE,1)
             )
          end                                                                                          CURR_INVOICEABLE_VALUE
,   dbo.AA_VALUE_DPS_F(D.CT_CURR_VALUE)                                                                CURR_SALES_VALUE
,   dbo.AA_VALUE_DPS_F
    (
       dbo.AA_PRICE_DPS_F(isnull(CT_CURR_RESUPLV,0))
       *
       case when isnull(CT_QUANTITY,0) = 0 then 1 else CT_QUANTITY end
    )
    +
    dbo.AA_VALUE_DPS_F(isnull(CT_CURR_CNTUPLV,0))                                                      CURR_UPLIFT
,   dbo.AA_VALUE_DPS_F(isnull(CT_CC_MARGIN_VALUE,0) * CT_CURR_RATE)                                    CURR_MARKUP
,   dbo.AA_PRICE_DPS_F(isnull(CT_CURR_PRICE,0))                                                        CURR_PRICE
,   dbo.AA_PRICE_DPS_F(CC_COST_UPLIFTP * CT_CURR_RATE)                                                 CURR_UPLIFT_HOURLY_COST
,   ''                                                                                                 ORDER_ACCOUNT_CODE
,   ''                                                                                                 INVOICE_ACCOUNT_CODE
--  AUDIT_DETAIL_ORDER
,   CH_PRIMARY                                                                                         AUDIT_DETAIL_COSTING
,   D.CT_TRANSACTION_LINK                                                                              AUDIT_DETAIL_TRAN
,   P.CH_DATE_REQ                                                                                      CT_DEADLINE
,   P.CH_STATUS                                                                                        CT_PROJECT_STATUS
,   isnull(TRD.DET_PL_INTERNAL,0)                                                                      PL_INTERNAL

from CST_DETAIL D
   inner join CST_COSTHEADER P on D.CT_COSTHEADER = P.CH_CODE
   inner join CST_COSTCENTRE C on D.CT_COSTHEADER = C.CC_COPYHEADER and D.CT_COSTCENTRE = C.CC_CODE
   left outer join CST_TRANSACTION_SUBTYPE S on D.CT_TRANSACTION_SUBTYPE_LINK = S.CTT_PRIMARY
   left outer join PRC_PRICE_RECS R on D.CT_RESOURCE = R.PRCODE and 'R' = R.PR_TYPE
   left outer join SL_ACCOUNTS SL on D.CT_ACCOUNT = SL.CUCODE and CT_PUTIN_LEDGER = 'SL'
   left outer join PL_ACCOUNTS PL on D.CT_ACCOUNT = PL.SUCODE and CT_PUTIN_LEDGER = 'PL'
   left outer join SL_ANALYSIS SA on D.CT_ANALYSIS = SA.SACODE and CT_PUTIN_LEDGER = 'SL'
   left outer join PL_ANALYSIS PA on D.CT_ANALYSIS = PA.PACODE and CT_PUTIN_LEDGER = 'PL'
   left outer join NL_ACCOUNTS NL on D.CT_NOMINAL = NL.NCODE
   left outer join SL_PL_NL_DETAIL TRD on D.CT_TRANSACTION_LINK = TRD.DET_PRIMARY and CT_PUTIN_LEDGER <> 'ST'
   left outer join STK_STOCK STK on D.CT_TRANSACTION_LINK = STK.STK_PRIMARY and CT_PUTIN_LEDGER = 'ST'
   join SYS_DATAINFO3 on SYS_PRIMARY_3 = 1