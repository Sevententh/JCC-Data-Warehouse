create view AA_CST_CENTRE_TRANSACTION_ADVANCED_VIEW

/*
** Written     : 23/01/2006 JC
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

-- ADVANCED
,   CT_USER_PUTIN
,   CT_DATE_PUTIN
,   CT_BATCH_REF
,   ''                                                                                                 ORDER_ACCOUNT_NAME
,   ''                                                                                                 DELIVERY_ACCOUNT_CODE
,   ''                                                                                                 DELIVERY_ACCOUNT_NAME
,   ''                                                                                                 INVOICE_ACCOUNT_NAME
,   case D.CT_PUTIN_LEDGER
       when 'SL' then SA.SATYPE_S_B_D
       when 'PL' then PA.PATYPE_P_B_D
       else ''
    end                                                                                                ANALYSIS_TYPE

,   case D.CT_PUTIN_LEDGER
       when 'SL' then isnull(SANOMINALDR,'')
       when 'PL' then isnull(PANOMINALDR,'')
       else ''
    end                                                                                                NOM_DEBIT_ACC
,   case D.CT_PUTIN_LEDGER
       when 'SL' then isnull(SLDR.NNAME,'')
       when 'PL' then isnull(PLDR.NNAME,'')
       else ''
    end                                                                                                NOM_DEBIT_NAME
,   case D.CT_PUTIN_LEDGER
       when 'SL' then isnull(SANOMINALCR,'')
       when 'PL' then isnull(PANOMINALCR,'')
       else ''
    end                                                                                                NOM_CREDIT_ACC
,   case D.CT_PUTIN_LEDGER
       when 'SL' then isnull(SLCR.NNAME,'')
       when 'PL' then isnull(PLCR.NNAME,'')
       else ''
    end                                                                                                NOM_CREDIT_NAME
,   case D.CT_PUTIN_LEDGER
       when 'SL' then isnull(SANOMINALVAT,'')
       when 'PL' then isnull(PANOMINALVAT,'')
       else ''
    end                                                                                                NOM_VAT_ACC
,   case D.CT_PUTIN_LEDGER
       when 'SL' then isnull(SLVAT.NNAME,'')
       when 'PL' then isnull(PLVAT.NNAME,'')
       else ''
    end                                                                                                NOM_VAT_NAME
,   isnull(CT_VATCODE,'')                                                                              VAT_CODE

-- STOCK_SELL_PRICE

,   dbo.AA_PRICE_DPS_F(STK_COSTPRICE)                                                                  STOCK_COST_PRICE
,   isnull(DET_SUB_LEDGER,'')                                                                          SUB_LEDGER
,   isnull(DET_SERIALNO,'')                                                                            SERIAL_NUMBER
,   isnull(DET_DESCRIPTION,'')                                                                         [DESCRIPTION]
,   isnull(CT_USER_KEY1,'')                                                                            USER_KEY1
,   isnull(CT_USER_KEY2,'')                                                                            USER_KEY2
,   isnull(CT_USER_KEY3,'')                                                                            USER_KEY3
,   isnull(DET_L_DISCOUNT,0)                                                                           LINE_DISCOUNT
,   isnull(DET_T_DISCOUNT,0)                                                                           TOTAL_DISCOUNT
,   isnull(DET_SUB_AUDIT_NO,0)                                                                         SUB_LEDGER_AUDIT_NO
,   isnull(CT_CURR_RATE,0)                                                                             CURR_RATE
,   isnull(D2.CT_USRCHAR1,'')                                                                          USER_CHAR1
,   isnull(D2.CT_USRCHAR2,'')                                                                          USER_CHAR2
,   isnull(D2.CT_USRCHAR3,'')                                                                          USER_CHAR3
,   isnull(D2.CT_USRCHAR4,'')                                                                          USER_CHAR4
,   CT_USRFLAG1                                                                                        USER_FLAG1
,   CT_USRFLAG2                                                                                        USER_FLAG2
,   CT_USRDATE1                                                                                        USER_DATE1
,   CT_USRDATE2                                                                                        USER_DATE2
,   CT_USRNUM1                                                                                         USER_NUM1
,   CT_USRNUM2                                                                                         USER_NUM2
,   CT_RESOURCE                                                                                        RESOURCE_RATE_NAME
,   isnull(CT_EMPCODE,'')                                                                              EMPCODE
,   isnull(CT_PAYTYPE_CODE,'')                                                                         PAYTYPE_CODE

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
   left outer join NL_ACCOUNTS SLDR on SA.SANOMINALDR = SLDR.NCODE
   left outer join NL_ACCOUNTS SLCR on SA.SANOMINALCR = SLCR.NCODE
   left outer join NL_ACCOUNTS SLVAT on SA.SANOMINALVAT = SLVAT.NCODE
   left outer join NL_ACCOUNTS PLDR on PA.PANOMINALDR = PLDR.NCODE
   left outer join NL_ACCOUNTS PLCR on PA.PANOMINALCR = PLCR.NCODE
   left outer join NL_ACCOUNTS PLVAT on PA.PANOMINALVAT = PLVAT.NCODE
   left outer join CST_DETAIL2 D2 on D.CT_PRIMARY = D2.CT_PRIMARY_2
   join SYS_DATAINFO3 on SYS_PRIMARY_3 = 1


