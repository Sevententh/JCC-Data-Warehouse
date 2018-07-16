create view AA_CST_RESOURCE_TRANSACTION_ADVANCED_VIEW

/*
** Written     :  23/01/2006 JC
** Last Amended:  30/01/2006 DB
*/

as

select
   D.CT_PRIMARY                                                                                    [PRIMARY]
,  SDI3.CST_ANALYSE_BY
,  isnull(D.CT_RESOURCE,'')                                                                        RESOURCE_CODE
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
,  isnull(P.CH_NAME,'')                                                                            PROJECT_NAME
,  isnull(C.CC_NAME,'')                                                                            COSTCENTRE_NAME
,  isnull(R.PRNAME,'')                                                                             RESOURCE_NAME
,  isnull(D.CT_EMPCODE,'')                                                                         EMP_CODE
,  isnull(PP.PP_CODE,'')                                                                           PERSON_CODE
,  isnull(PP.PP_KNOWN_AS,'')                                                                       KNOWN_AS

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
,  case D.CT_PUTIN_LEDGER
      when 'SL' then SL.CU_PRIMARY
      when 'PL' then PL.SU_PRIMARY
      when 'NL' then NL.N_PRIMARY
      else
         ''
   end                                                                                             ACCOUNT_PRIMARY
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
,  P.CH_PRIMARY                                                                                    AUDIT_DETAIL_COSTING
,  R.PR_SORT_KEY                                                                                   CT_RESOURCE_SORTKEY
,  R.PR_SORT_KEY1                                                                                  CT_RESOURCE_USERSORT1
,  R.PR_SORT_KEY2                                                                                  CT_RESOURCE_USERSORT2
,  R.PR_SORT_KEY3                                                                                  CT_RESOURCE_USERSORT3
,  R.PR_SORT_KEY4                                                                                  CT_RESOURCE_USERSORT4
,  R.PR_SORT_KEY5                                                                                  CT_RESOURCE_USERSORT5
,  R.PR_SORT_KEY6                                                                                  CT_RESOURCE_USERSORT6
,  RR.R_RATE_NUMBER                                                                                RESOURCE_RATE_NO
,  isnull(RR.R_DESCRIPTION,'')                                                                     RESOURCE_RATE_NAME
,  D.CT_USER_PUTIN
,  D.CT_DATE_PUTIN
,  isnull(D.CT_BATCH_REF,'')                                                                       BATCH_REFERENCE
,  isnull(D.CT_DETAIL,'')                                                                          TRANS_DETAIL
,  isnull(D.CT_USER_KEY1,'')                                                                       TRANS_USERKEY_1
,  isnull(D.CT_USER_KEY2,'')                                                                       TRANS_USERKEY_2
,  isnull(D.CT_USER_KEY3,'')                                                                       TRANS_USERKEY_3
,  D.CT_CURR_RATE
,  isnull(D2.CT_USRCHAR1,'')                                                                       USER_CHAR1
,  isnull(D2.CT_USRCHAR2,'')                                                                       USER_CHAR2
,  isnull(D2.CT_USRCHAR3,'')                                                                       USER_CHAR3
,  isnull(D2.CT_USRCHAR4,'')                                                                       USER_CHAR4
,  convert(bit,D2.CT_USRFLAG1)                                                                     USER_FLAG1
,  convert(bit,D2.CT_USRFLAG2)                                                                     USER_FLAG2
,  D2.CT_USRDATE1                                                                                  USER_DATE1
,  D2.CT_USRDATE2                                                                                  USER_DATE2
,  D2.CT_USRNUM1                                                                                   USER_NUM1
,  D2.CT_USRNUM2                                                                                   USER_NUM2
,  isnull(D.CT_PAYTYPE_CODE,'')                                                                    PAYTYPE_CODE

from
   CST_DETAIL  D
   inner join CST_COSTCENTRE           C     on       C.CC_COPYHEADER      = D.CT_COSTHEADER
                                                and   C.CC_CODE            = D.CT_COSTCENTRE
   inner join CST_COSTHEADER           P     on       P.CH_CODE            = D.CT_COSTHEADER
   inner join PRC_PRICE_RECS           R     on       R.PRCODE             = D.CT_RESOURCE
                                                and   R.PR_TYPE            = 'R'
   left  join SYS_RESOURCE_RATES       RR    on       RR.R_RATE_NUMBER     = D.CT_RESLINE
   left  join CST_TRANSACTION_SUBTYPE  S     on       S.CTT_PRIMARY        = D.CT_TRANSACTION_SUBTYPE_LINK
   left  join SL_ACCOUNTS              SL    on       SL.CUCODE            = D.CT_ACCOUNT
                                                and   D.CT_PUTIN_LEDGER    = 'SL'
   left  join PL_ACCOUNTS              PL    on       PL.SUCODE            = D.CT_ACCOUNT
                                                and   D.CT_PUTIN_LEDGER    = 'PL'
   left  join NL_ACCOUNTS              NL    on       NL.NCODE             = D.CT_NOMINAL
   left  join SYS_PEOPLE               PP    on       PP.PP_PRIMARY        = P.CH_PERSON_LINK
   left  join CST_DETAIL2              D2    on       D2.CT_PRIMARY_2      = D.CT_PRIMARY
   inner join SYS_DATAINFO3            SDI3  on       SDI3.SYS_PRIMARY_3   = 1

