create view AA_CST_PROJECT_TRANSACTION_SIMPLE_VIEW

/*
** Written     :  13/01/2006 JC
** Last Amended:  30/01/2006 DB
*/

as

select
   D.CT_PRIMARY                                                                                    [PRIMARY]
,  SDI3.CST_ANALYSE_BY
,  isnull(D.CT_COSTHEADER,'')                                                                      PROJECT_CODE
,  isnull(D.CT_COSTCENTRE,'')                                                                      COSTCENTRE_CODE
,  D.CT_DATE
,  D.CT_YEAR + case
                  when D.CT_WEEK_NO<10 then '0'
                  else
                     ''
               end
               +
               convert(varchar,D.CT_WEEK_NO)                                                       YEAR_WEEK
,  D.CT_YEAR + case
                  when D.CT_PERIODNUMBR<10 then '0'
                  else
                     ''
               end
               +
               convert(varchar,D.CT_PERIODNUMBR)                                                   YEAR_PERIOD
,  D.CT_STATUS
,  D.CT_PUTIN_LEDGER
,  D.CT_TRANTYPE
,  isnull(S.CTT_NAME,'')                                                                           SUBTYPE_NAME
,  isnull(D.CT_HEADER_REF,'')                                                                      HEADER_REF
,  dbo.AA_VALUE_DPS_F(isnull(D.CT_QUANTITY,0))                                                     CT_QUANTITY
,  dbo.AA_VALUE_DPS_F(D.CT_GROSS)                                                                  HOME_VALUE
,  dbo.AA_VALUE_DPS_F(D.CT_GROSS)
   -
   dbo.AA_VALUE_DPS_F(D.CT_CENTRE_UPLV)                                                            HOME_UPLIFTED_VALUE
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F(isnull(D.CT_PRICE,0))
      *
      case
         when isnull(D.CT_QUANTITY,0) = 0 then 1
         else
            D.CT_QUANTITY
      end
   )                                                                                               HOME_WIP
,  case
      when SDI3.CST_INVOICEABLE_VALUE_CALC_OPT = 0 then  dbo.AA_VALUE_DPS_F
                                                         (
                                                            dbo.AA_PRICE_DPS_F
                                                            (
                                                               isnull(D.CT_PRICE,0)
                                                               +
                                                               isnull(D.CT_RESOURCE_MARGIN_VALUE,0)
                                                            )
                                                            *
                                                            case
                                                               when isnull(D.CT_QUANTITY,0) = 0 then 1
                                                               else
                                                                  D.CT_QUANTITY
                                                            end
                                                         )
                                                         +
                                                         dbo.AA_VALUE_DPS_F
                                                         (
                                                            isnull(D.CT_CC_MARGIN_VALUE,0)
                                                         )
      else
         dbo.AA_VALUE_DPS_F
         (
            dbo.AA_PRICE_DPS_F
            (
               isnull(D.CT_PRICE,0)
               +
               isnull(D.CT_RES_UPLV,0)
               +
               isnull(D.CT_RESOURCE_MARGIN_VALUE,0)
            )
            *
            case
               when isnull(D.CT_QUANTITY,0) = 0 then 1
               else
                  D.CT_QUANTITY
            end
         )
         +
         dbo.AA_VALUE_DPS_F
         (
            isnull(D.CT_CENTRE_UPLV,0)
            +
            isnull(D.CT_CC_MARGIN_VALUE,0)
         )
   end                                                                                             HOME_INVOICEABLE_WIP

,  dbo.AA_VALUE_DPS_F(D.CT_GROSS)
   +
   dbo.AA_VALUE_DPS_F(D.CT_VAT)                                                                    HOME_SALES_VALUE
,  cast(D.CT_BATCH_FLAG as bit)                                                                    CT_BATCH_FLAG
,  D.CT_BATCH_POSTED
,  isnull(D.CT_RESOURCE,'')                                                                        RESOURCE_CODE
,  isnull(P.CH_NAME,'')                                                                            PROJECT_NAME
,  isnull(C.CC_NAME,'')                                                                            COSTCENTRE_NAME
,  isnull(R.PRNAME,'')                                                                             RESOURCE_NAME
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F(isnull(D.CT_RES_UPLV,0))
      *
      case
         when isnull(D.CT_QUANTITY,0) = 0 then 1
         else
            D.CT_QUANTITY
      end
   )
   +
   dbo.AA_VALUE_DPS_F(isnull(D.CT_CENTRE_UPLV,0))                                                  HOME_UPLIFT
,  dbo.AA_VALUE_DPS_F(isnull(D.CT_CC_MARGIN_VALUE,0))                                              HOME_MARKUP
,  D.CT_POSTTYPE
,  dbo.AA_PRICE_DPS_F(D.CT_PRICE)                                                                  HOME_PRICE
,  dbo.AA_PRICE_DPS_F(C.CC_COST_UPLIFTP)                                                           HOME_UPLIFT_HOURLY
,  isnull(D.CT_ACCOUNT,'')                                                                         ACCOUNT_CODE
,  case D.CT_PUTIN_LEDGER
      when 'SL' then SL.CUNAME
      when 'PL' then PL.SUNAME
      else
         ''
   end                                                                                             ACCOUNT_NAME
,  case D.CT_PUTIN_LEDGER
      when 'SL' then SL.CU_PRIMARY
      when 'PL' then PL.SU_PRIMARY
      when 'NL' then NL.N_PRIMARY
      else
         ''
   end                                                                                             ACCOUNT_PRIMARY
,  isnull(D.CT_NOMINAL,'')                                                                         NOMINAL_CODE
,  isnull(NL.NNAME,'')                                                                             NOMINAL_NAME
,  isnull(D.CT_ANALYSIS,'')                                                                        ANALYSIS_CODE
,  case D.CT_PUTIN_LEDGER
      when 'SL' then SA.SANAME
      when 'PL' then PA.PANAME
      else
         ''
   end                                                                                             ANALYSIS_NAME
,  case D.CT_PUTIN_LEDGER
      when 'SL' then SA.SA_PRIMARY
      when 'PL' then PA.PA_PRIMARY
      else
         ''
   end                                                                                             ANALYSIS_PRIMARY
,  isnull(D.CT_STOCKCODE,'')                                                                       STOCK_CODE
,  isnull(STK.STKNAME,'')                                                                          STOCK_NAME
,  isnull(D.CT_WEEK_NO,0)                                                                          [WEEK]
,  isnull(D.CT_PERIODNUMBR,0)                                                                      PERIOD
,  D.CT_YEAR
,  D.CT_CURR_CODE
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F(isnull(D.CT_CURR_PRICE,0))
      *
      case
         when isnull(D.CT_QUANTITY,0) = 0 then 1
         else
            D.CT_QUANTITY
      end
   )                                                                                               CURR_VALUE
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F
      (
       isnull(D.CT_CURR_PRICE,0)
       +
       isnull(D.CT_CURR_RESUPLV,0)
      )
      *
      case
         when isnull(D.CT_QUANTITY,0) = 0 then 1
         else
            D.CT_QUANTITY
      end
   )
   +
   dbo.AA_VALUE_DPS_F(isnull(D.CT_CURR_CNTUPLV,0))                                                 CURR_UPLIFTED_VALUE
,  dbo.AA_VALUE_DPS_F
   (
      (
         dbo.AA_PRICE_DPS_F(isnull(D.CT_PRICE,0))
         *
         case
            when isnull(D.CT_QUANTITY,0) = 0 then 1
            else
               D.CT_QUANTITY
         end
      )
      *
      D.CT_CURR_RATE
   )                                                                                               CURR_WIP
,  case
      when SDI3.CST_INVOICEABLE_VALUE_CALC_OPT = 0 then  dbo.AA_VALUE_DPS_F
                                                         (
                                                            dbo.AA_PRICE_DPS_F
                                                            (
                                                               isnull(D.CT_PRICE,0)
                                                               +
                                                               isnull(D.CT_RESOURCE_MARGIN_VALUE,0)
                                                            )
                                                            *
                                                            case
                                                               when isnull(D.CT_QUANTITY,0) = 0 then 1
                                                               else
                                                                  D.CT_QUANTITY
                                                            end
                                                         )
                                                         +
                                                         dbo.AA_VALUE_DPS_F
                                                         (
                                                            isnull(D.CT_CC_MARGIN_VALUE,0)
                                                         )
      else
         dbo.AA_VALUE_DPS_F
         (
            dbo.AA_PRICE_DPS_F
            (
               isnull(D.CT_CURR_PRICE,0)
               +
               isnull(D.CT_CURR_RESUPLV,0)
               +
               isnull(D.CT_RESOURCE_MARGIN_VALUE,0)
               *
               isnull(D.CT_CURR_RATE,1)
            )
            *
            case
               when isnull(D.CT_QUANTITY,0) = 0 then 1
               else
                  D.CT_QUANTITY
            end
         )
         +
         dbo.AA_VALUE_DPS_F
         (
            isnull(D.CT_CURR_CNTUPLV,0)
            +
            isnull(D.CT_CC_MARGIN_VALUE,0)
            *
            isnull(D.CT_CURR_RATE,1)
         )
   end                                                                                             CURR_INVOICEABLE_VALUE
,  dbo.AA_VALUE_DPS_F(D.CT_CURR_VALUE)                                                             CURR_SALES_VALUE
,  dbo.AA_VALUE_DPS_F
   (
      dbo.AA_PRICE_DPS_F(isnull(D.CT_CURR_RESUPLV,0))
      *
      case
         when isnull(D.CT_QUANTITY,0) = 0 then 1
         else
            D.CT_QUANTITY
      end
   )
   +
   dbo.AA_VALUE_DPS_F(isnull(D.CT_CURR_CNTUPLV,0))                                                 CURR_UPLIFT
,  dbo.AA_VALUE_DPS_F(isnull(D.CT_CC_MARGIN_VALUE,0) * D.CT_CURR_RATE)                             CURR_MARKUP
,  dbo.AA_PRICE_DPS_F(isnull(D.CT_CURR_PRICE,0))                                                   CURR_PRICE
,  dbo.AA_PRICE_DPS_F(C.CC_COST_UPLIFTP * D.CT_CURR_RATE)                                          CURR_UPLIFT_HOURLY_COST
,  ''                                                                                              ORDER_ACCOUNT_CODE
,  ''                                                                                              INVOICE_ACCOUNT_CODE
-- AUDIT_DETAIL_ORDER
,  P.CH_PRIMARY                                                                                    AUDIT_DETAIL_COSTING
,  D.CT_TRANSACTION_LINK                                                                           AUDIT_DETAIL_TRAN
,  P.CH_DATE_REQ                                                                                   CT_DEADLINE
,  P.CH_DATE_USER1                                                                                 CT_PROJECT_DATE1
,  P.CH_DATE_USER2                                                                                 CT_PROJECT_DATE2
,  P.CH_DATE_USER3                                                                                 CT_PROJECT_DATE3
,  P.CH_SORT                                                                                       CT_PROJECT_SORTKEY
,  P.CH_USER1                                                                                      CT_PROJECT_USERSORT1
,  P.CH_USER2                                                                                      CT_PROJECT_USERSORT2
,  P.CH_USER3                                                                                      CT_PROJECT_USERSORT3
,  P.CH_USER4                                                                                      CT_PROJECT_USERSORT4
,  P.CH_USER5                                                                                      CT_PROJECT_USERSORT5
,  P.CH_USER6                                                                                      CT_PROJECT_USERSORT6
,  P.CH_STATUS                                                                                     CT_PROJECT_STATUS
,  isnull(TRD.DET_PL_INTERNAL,0)                                                                   PL_INTERNAL

from
   CST_DETAIL  D
      inner join CST_COSTHEADER           P     on       P.CH_CODE            = D.CT_COSTHEADER
      inner join CST_COSTCENTRE           C     on       C.CC_COPYHEADER      = D.CT_COSTHEADER
                                                   and   C.CC_CODE            = D.CT_COSTCENTRE
      left  join CST_TRANSACTION_SUBTYPE  S     on       S.CTT_PRIMARY        = D.CT_TRANSACTION_SUBTYPE_LINK
      left  join PRC_PRICE_RECS           R     on       R.PRCODE             = D.CT_RESOURCE
                                                   and   R.PR_TYPE            = 'R'
      left  join SL_ACCOUNTS              SL    on       SL.CUCODE            = D.CT_ACCOUNT
                                                   and   D.CT_PUTIN_LEDGER    = 'SL'
      left  join PL_ACCOUNTS              PL    on       PL.SUCODE            = D.CT_ACCOUNT
                                                   and   D.CT_PUTIN_LEDGER    = 'PL'
      left  join SL_ANALYSIS              SA    on       SA.SACODE            = D.CT_ANALYSIS
                                                   and   D.CT_PUTIN_LEDGER    = 'SL'
      left  join PL_ANALYSIS              PA    on       PA.PACODE            = D.CT_ANALYSIS
                                                   and   D.CT_PUTIN_LEDGER    = 'PL'
      left  join NL_ACCOUNTS              NL    on       NL.NCODE             = D.CT_NOMINAL
      left  join SL_PL_NL_DETAIL          TRD   on       TRD.DET_PRIMARY      = D.CT_TRANSACTION_LINK
                                                   and   D.CT_PUTIN_LEDGER    <> 'ST'
      left  join STK_STOCK                STK   on       STK.STK_PRIMARY      = D.CT_TRANSACTION_LINK
                                                   and   D.CT_PUTIN_LEDGER    = 'ST'
      inner join SYS_DATAINFO3            SDI3  on       SDI3.SYS_PRIMARY_3   = 1
