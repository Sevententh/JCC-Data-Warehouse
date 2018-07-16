create view AA_CST_PROJECT_TRANSACTION_ADVANCED_VIEW

/*
** Written     :  18/01/2006 JC
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

-- ADVANCED
,  D.CT_USER_PUTIN
,  D.CT_DATE_PUTIN
,  D.CT_BATCH_REF
,  ''                                                                                              ORDER_ACCOUNT_NAME
,  ''                                                                                              DELIVERY_ACCOUNT_CODE
,  ''                                                                                              DELIVERY_ACCOUNT_NAME
,  ''                                                                                              INVOICE_ACCOUNT_NAME
,  case D.CT_PUTIN_LEDGER
      when 'SL' then SA.SATYPE_S_B_D
      when 'PL' then PA.PATYPE_P_B_D
      else
         ''
   end                                                                                             ANALYSIS_TYPE

,  case D.CT_PUTIN_LEDGER
      when 'SL' then isnull(SA.SANOMINALDR,'')
      when 'PL' then isnull(PA.PANOMINALDR,'')
      else
         ''
   end                                                                                             NOM_DEBIT_ACC
,  case D.CT_PUTIN_LEDGER
      when 'SL' then isnull(SLDR.NNAME,'')
      when 'PL' then isnull(PLDR.NNAME,'')
      else
         ''
   end                                                                                             NOM_DEBIT_NAME
,  case D.CT_PUTIN_LEDGER
      when 'SL' then isnull(SA.SANOMINALCR,'')
      when 'PL' then isnull(PA.PANOMINALCR,'')
      else
         ''
   end                                                                                             NOM_CREDIT_ACC
,  case D.CT_PUTIN_LEDGER
      when 'SL' then isnull(SLCR.NNAME,'')
      when 'PL' then isnull(PLCR.NNAME,'')
      else
         ''
   end                                                                                             NOM_CREDIT_NAME
,  case D.CT_PUTIN_LEDGER
      when 'SL' then isnull(SA.SANOMINALVAT,'')
      when 'PL' then isnull(PA.PANOMINALVAT,'')
      else
         ''
   end                                                                                             NOM_VAT_ACC
,  case D.CT_PUTIN_LEDGER
      when 'SL' then isnull(SLVAT.NNAME,'')
      when 'PL' then isnull(PLVAT.NNAME,'')
      else
         ''
   end                                                                                             NOM_VAT_NAME
,  isnull(D.CT_VATCODE,'')                                                                         VAT_CODE

-- STOCK_SELL_PRICE
,  dbo.AA_PRICE_DPS_F(STK.STK_COSTPRICE)                                                           STOCK_COST_PRICE
,  isnull(TRD.DET_SUB_LEDGER,'')                                                                   SUB_LEDGER
,  isnull(TRD.DET_SERIALNO,'')                                                                     SERIAL_NUMBER
,  isnull(TRD.DET_DESCRIPTION,'')                                                                  [DESCRIPTION]
,  isnull(D.CT_USER_KEY1,'')                                                                       USER_KEY1
,  isnull(D.CT_USER_KEY2,'')                                                                       USER_KEY2
,  isnull(D.CT_USER_KEY3,'')                                                                       USER_KEY3
,  isnull(TRD.DET_L_DISCOUNT,0)                                                                    LINE_DISCOUNT
,  isnull(TRD.DET_T_DISCOUNT,0)                                                                    TOTAL_DISCOUNT
,  isnull(TRD.DET_SUB_AUDIT_NO,0)                                                                  SUB_LEDGER_AUDIT_NO
,  isnull(D.CT_CURR_RATE,0)                                                                        CURR_RATE
,  isnull(D2.CT_USRCHAR1,'')                                                                       USER_CHAR1
,  isnull(D2.CT_USRCHAR2,'')                                                                       USER_CHAR2
,  isnull(D2.CT_USRCHAR3,'')                                                                       USER_CHAR3
,  isnull(D2.CT_USRCHAR4,'')                                                                       USER_CHAR4
,  D2.CT_USRFLAG1                                                                                  USER_FLAG1
,  D2.CT_USRFLAG2                                                                                  USER_FLAG2
,  D2.CT_USRDATE1                                                                                  USER_DATE1
,  D2.CT_USRDATE2                                                                                  USER_DATE2
,  D2.CT_USRNUM1                                                                                   USER_NUM1
,  D2.CT_USRNUM2                                                                                   USER_NUM2
,  D.CT_RESOURCE                                                                                   RESOURCE_RATE_NAME

from
   CST_DETAIL  D
      left  join CST_DETAIL2              D2    on       D2.CT_PRIMARY_2      = D.CT_PRIMARY
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
      left  join NL_ACCOUNTS              SLDR  on       SLDR.NCODE           = SA.SANOMINALDR
      left  join NL_ACCOUNTS              SLCR  on       SLCR.NCODE           = SA.SANOMINALCR
      left  join NL_ACCOUNTS              SLVAT on       SLVAT.NCODE          = SA.SANOMINALVAT
      left  join NL_ACCOUNTS              PLDR  on       PLDR.NCODE           = PA.PANOMINALDR
      left  join NL_ACCOUNTS              PLCR  on       PLCR.NCODE           = PA.PANOMINALCR
      left  join NL_ACCOUNTS              PLVAT on       PLVAT.NCODE          = PA.PANOMINALVAT
      left  join SL_PL_NL_DETAIL          TRD   on       TRD.DET_PRIMARY      = D.CT_TRANSACTION_LINK
                                                   and   D.CT_PUTIN_LEDGER    <> 'ST'
      left  join STK_STOCK                STK   on       STK.STK_PRIMARY      = D.CT_TRANSACTION_LINK
                                                   and   D.CT_PUTIN_LEDGER    = 'ST'
      inner join SYS_DATAINFO3            SDI3  on       SDI3.SYS_PRIMARY_3   = 1


