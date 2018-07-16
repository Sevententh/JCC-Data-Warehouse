create view PRC_PRICE_RECORDS_VIEW

/*
**
** Price Records including all price line info
**
** Written     :  30/08/2011 CC
** Last Amended:  31/08/2011 CC
**
*/

as
select
   PRCODE
,  PRNAME
,  PR_TYPE
,  PR_TEXT
,  PR_DEL_ITEM
,  PR_PRICE
,  PR_PRICE_C
,  PR_BASE_COST
,  PR_COSTVALUE
,  PR_SALEVALUE
,  PR_SALEVAL_1
,  PR_SALEVAL_2
,  PR_SALEVAL_3
,  PR_S_ANALYSIS
,  PR_P_ANALYSIS
,  PR_EMPLOYEE_CODE
,  PR_PAYTYPE_LIST
,  PR_CURRENCY
,  PR_SALEVAL_4
,  PR_SALEVAL_5
,  PR_SALEVAL_6
,  PR_SALEVAL_7
,  PR_SALEVAL_8
,  PR_SALEVAL_9
,  PR_SALEVAL_10
,  PR_SALEVAL_11
,  PR_ARCHIVE
,  PR_NOTES
,  PR_SALEVAL_12
,  PR_SALEVAL_13
,  PR_MATRIX_KEY
,  PR_SORT_KEY
,  PR_SORT_KEY1
,  PR_SORT_KEY2
,  PR_SORT_KEY3
,  PR_SORT_KEY4
,  PR_SORT_KEY5
,  PR_SORT_KEY6
,  PR_DATE_USER1
,  PR_DATE_USER2
,  PR_DATE_USER3
,  PR_EC_KILOS
,  PR_EC_ORIGIN
,  PR_EC_COM_CODE
,  PR_EC_SUP_UNIT
,  PR_TURNOVER_O1
,  PR_TURNOVER_O2
,  PR_TURNOVER_O3
,  PR_TURNOVER_O4
,  PR_TURNOVER_O5
,  PR_TURNOVER_O6
,  PR_TURNOVER_O7
,  PR_TURNOVER_O8
,  PR_TURNOVER_O9
,  PR_TURNOVER_O10
,  PR_TURNOVER_O11
,  PR_TURNOVER_O12
,  PR_TURNOVER_O13
,  PR_TURNOVER_L1
,  PR_TURNOVER_L2
,  PR_TURNOVER_L3
,  PR_TURNOVER_L4
,  PR_TURNOVER_L5
,  PR_TURNOVER_L6
,  PR_TURNOVER_L7
,  PR_TURNOVER_L8
,  PR_TURNOVER_L9
,  PR_TURNOVER_L10
,  PR_TURNOVER_L11
,  PR_TURNOVER_L12
,  PR_TURNOVER_L13
,  PR_TURNOVER_C1
,  PR_TURNOVER_C2
,  PR_TURNOVER_C3
,  PR_TURNOVER_C4
,  PR_TURNOVER_C5
,  PR_TURNOVER_C6
,  PR_TURNOVER_C7
,  PR_TURNOVER_C8
,  PR_TURNOVER_C9
,  PR_TURNOVER_C10
,  PR_TURNOVER_C11
,  PR_TURNOVER_C12
,  PR_TURNOVER_C13
,  PR_TURNOVER_PTD
,  PR_TURNOVER_YTD
,  PR_TURNOVER_LY
,  PR_TURNOVER
,  PR_COSTVAL_PTD
,  PR_COSTVAL_YTD
,  PR_SALEVAL_PTD
,  PR_SALEVAL_YTD
,  PR_QTY_PTD
,  PR_QTY_YTD
,  PR_QTY_LY
,  PR_QUANTITY
,  PR_INC_LIVE_PTD
,  PR_INC_LIVE_YTD
,  PR_INC_LIVE_TOT
,  PR_COSTVAL_1
,  PR_INC_ESTM_TOT
,  PR_COSTVAL_2
,  PR_COSTVAL_3
,  PR_COSTVAL_4
,  PR_COSTVAL_5
,  PR_COSTVAL_6
,  PR_COSTVAL_7
,  PR_COSTVAL_8
,  PR_COSTVAL_9
,  PR_COSTVAL_10
,  PR_COSTVAL_11
,  PR_COSTVAL_12
,  PR_COSTVAL_13
,  PR_COST_1
,  PR_COST_2
,  PR_COST_3
,  PR_COST_4
,  PR_COST_5
,  PR_COST_6
,  PR_COST_7
,  PR_COST_8
,  PR_COST_9
,  PR_COST_10
,  PR_UPLIFT_V1
,  PR_UPLIFT_V2
,  PR_UPLIFT_V3
,  PR_UPLIFT_V4
,  PR_UPLIFT_V5
,  PR_UPLIFT_V6
,  PR_UPLIFT_V7
,  PR_UPLIFT_V8
,  PR_UPLIFT_V9
,  PR_UPLIFT_V10
,  PR_UPLIFT_P1
,  PR_UPLIFT_P2
,  PR_UPLIFT_P3
,  PR_UPLIFT_P4
,  PR_UPLIFT_P5
,  PR_UPLIFT_P6
,  PR_UPLIFT_P7
,  PR_UPLIFT_P8
,  PR_UPLIFT_P9
,  PR_UPLIFT_P10
,  PR_UPLIFT_C_V1
,  PR_UPLIFT_C_V2
,  PR_UPLIFT_C_V3
,  PR_UPLIFT_C_V4
,  PR_UPLIFT_C_V5
,  PR_UPLIFT_C_V6
,  PR_UPLIFT_C_V7
,  PR_UPLIFT_C_V8
,  PR_UPLIFT_C_V9
,  PR_UPLIFT_C_V10
,  PR_CURR_1
,  PR_CURR_2
,  PR_CURR_3
,  PR_CURR_4
,  PR_CURR_5
,  PR_CURR_6
,  PR_CURR_7
,  PR_CURR_8
,  PR_CURR_9
,  PR_CURR_10
,  PR_COST_C_1
,  PR_COST_C_2
,  PR_COST_C_3
,  PR_COST_C_4
,  PR_COST_C_5
,  PR_COST_C_6
,  PR_COST_C_7
,  PR_COST_C_8
,  PR_COST_C_9
,  PR_COST_C_10
,  PR_QTY_O1
,  PR_QTY_O2
,  PR_QTY_O3
,  PR_QTY_O4
,  PR_QTY_O5
,  PR_QTY_O6
,  PR_QTY_O7
,  PR_QTY_O8
,  PR_QTY_O9
,  PR_QTY_O10
,  PR_QTY_O11
,  PR_QTY_O12
,  PR_QTY_O13
,  PR_QTY_L1
,  PR_QTY_L2
,  PR_QTY_L3
,  PR_QTY_L4
,  PR_QTY_L5
,  PR_QTY_L6
,  PR_QTY_L7
,  PR_QTY_L8
,  PR_QTY_L9
,  PR_QTY_L10
,  PR_QTY_L11
,  PR_QTY_L12
,  PR_QTY_L13
,  PR_QTY_C1
,  PR_QTY_C2
,  PR_QTY_C3
,  PR_QTY_C4
,  PR_QTY_C5
,  PR_QTY_C6
,  PR_QTY_C7
,  PR_QTY_C8
,  PR_QTY_C9
,  PR_QTY_C10
,  PR_QTY_C11
,  PR_QTY_C12
,  PR_QTY_C13
,  PR_USER_EDITED
,  PR_USER_PUTIN
,  PR_DATE_PUTIN
,  PR_DATE_EDITED
,  PR_MU_STATUS
,  PR_USED
,  PR_NO_TAX
,  PR_PRIMARY
,  PR_RTP_FLAG
,  PR_LEVEL
,  PR_GROUP
,  PR_PRICE_BASE2
,  PR_BASE_COST_BASE2
,  PR_SOURCE
,  PR_NOMINAL
,  PR_ISSUE_ANALYSIS
,  PR_WRITE_OFF_ANALYSIS
,  PR_REVERSE_CHRGE_VAT
,  PR_DO_NOT_USE
,  PR_SERVICE
,  PRR_SELL_PRICE_1
,  PRR_SELL_PRICE_2
,  PRR_SELL_PRICE_3
,  PRR_SELL_PRICE_4
,  PRR_SELL_PRICE_5
,  PRR_SELL_PRICE_6
,  PRR_SELL_PRICE_7
,  PRR_SELL_PRICE_8
,  PRR_SELL_PRICE_9
,  PRR_SELL_PRICE_10
,  PRR_SELL_CURR_1
,  PRR_SELL_CURR_2
,  PRR_SELL_CURR_3
,  PRR_SELL_CURR_4
,  PRR_SELL_CURR_5
,  PRR_SELL_CURR_6
,  PRR_SELL_CURR_7
,  PRR_SELL_CURR_8
,  PRR_SELL_CURR_9
,  PRR_SELL_CURR_10
,  PRR_SELL_PRICE_C_1
,  PRR_SELL_PRICE_C_2
,  PRR_SELL_PRICE_C_3
,  PRR_SELL_PRICE_C_4
,  PRR_SELL_PRICE_C_5
,  PRR_SELL_PRICE_C_6
,  PRR_SELL_PRICE_C_7
,  PRR_SELL_PRICE_C_8
,  PRR_SELL_PRICE_C_9
,  PRR_SELL_PRICE_C_10
,  PRR_SELL_ANALYSIS_1
,  PRR_SELL_ANALYSIS_2
,  PRR_SELL_ANALYSIS_3
,  PRR_SELL_ANALYSIS_4
,  PRR_SELL_ANALYSIS_5
,  PRR_SELL_ANALYSIS_6
,  PRR_SELL_ANALYSIS_7
,  PRR_SELL_ANALYSIS_8
,  PRR_SELL_ANALYSIS_9
,  PRR_SELL_ANALYSIS_10
,  PRR_BUY_PRICE_1
,  PRR_BUY_PRICE_2
,  PRR_BUY_PRICE_3
,  PRR_BUY_PRICE_4
,  PRR_BUY_PRICE_5
,  PRR_BUY_PRICE_6
,  PRR_BUY_PRICE_7
,  PRR_BUY_PRICE_8
,  PRR_BUY_PRICE_9
,  PRR_BUY_PRICE_10
,  PRR_BUY_CURR_1
,  PRR_BUY_CURR_2
,  PRR_BUY_CURR_3
,  PRR_BUY_CURR_4
,  PRR_BUY_CURR_5
,  PRR_BUY_CURR_6
,  PRR_BUY_CURR_7
,  PRR_BUY_CURR_8
,  PRR_BUY_CURR_9
,  PRR_BUY_CURR_10
,  PRR_BUY_PRICE_C_1
,  PRR_BUY_PRICE_C_2
,  PRR_BUY_PRICE_C_3
,  PRR_BUY_PRICE_C_4
,  PRR_BUY_PRICE_C_5
,  PRR_BUY_PRICE_C_6
,  PRR_BUY_PRICE_C_7
,  PRR_BUY_PRICE_C_8
,  PRR_BUY_PRICE_C_9
,  PRR_BUY_PRICE_C_10
,  PRR_BUY_ANALYSIS_1
,  PRR_BUY_ANALYSIS_2
,  PRR_BUY_ANALYSIS_3
,  PRR_BUY_ANALYSIS_4
,  PRR_BUY_ANALYSIS_5
,  PRR_BUY_ANALYSIS_6
,  PRR_BUY_ANALYSIS_7
,  PRR_BUY_ANALYSIS_8
,  PRR_BUY_ANALYSIS_9
,  PRR_BUY_ANALYSIS_10
   from
   (
      select
         max(case TYPEPRICELINE when 'S1'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_1
      ,  max(case TYPEPRICELINE when 'S2'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_2
      ,  max(case TYPEPRICELINE when 'S3'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_3
      ,  max(case TYPEPRICELINE when 'S4'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_4
      ,  max(case TYPEPRICELINE when 'S5'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_5
      ,  max(case TYPEPRICELINE when 'S6'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_6
      ,  max(case TYPEPRICELINE when 'S7'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_7
      ,  max(case TYPEPRICELINE when 'S8'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_8
      ,  max(case TYPEPRICELINE when 'S9'    then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_9
      ,  max(case TYPEPRICELINE when 'S10'   then PRP_PRICE    else 0   end)  PRR_SELL_PRICE_10
      ,  max(case TYPEPRICELINE when 'S1'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_1
      ,  max(case TYPEPRICELINE when 'S2'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_2
      ,  max(case TYPEPRICELINE when 'S3'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_3
      ,  max(case TYPEPRICELINE when 'S4'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_4
      ,  max(case TYPEPRICELINE when 'S5'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_5
      ,  max(case TYPEPRICELINE when 'S6'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_6
      ,  max(case TYPEPRICELINE when 'S7'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_7
      ,  max(case TYPEPRICELINE when 'S8'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_8
      ,  max(case TYPEPRICELINE when 'S9'    then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_9
      ,  max(case TYPEPRICELINE when 'S10'   then PRP_CURRENCY else ''  end)  PRR_SELL_CURR_10
      ,  max(case TYPEPRICELINE when 'S1'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_1
      ,  max(case TYPEPRICELINE when 'S2'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_2
      ,  max(case TYPEPRICELINE when 'S3'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_3
      ,  max(case TYPEPRICELINE when 'S4'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_4
      ,  max(case TYPEPRICELINE when 'S5'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_5
      ,  max(case TYPEPRICELINE when 'S6'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_6
      ,  max(case TYPEPRICELINE when 'S7'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_7
      ,  max(case TYPEPRICELINE when 'S8'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_8
      ,  max(case TYPEPRICELINE when 'S9'    then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_9
      ,  max(case TYPEPRICELINE when 'S10'   then PRP_PRICE_C  else 0   end)  PRR_SELL_PRICE_C_10
      ,  max(case TYPEPRICELINE when 'S1'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_1
      ,  max(case TYPEPRICELINE when 'S2'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_2
      ,  max(case TYPEPRICELINE when 'S3'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_3
      ,  max(case TYPEPRICELINE when 'S4'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_4
      ,  max(case TYPEPRICELINE when 'S5'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_5
      ,  max(case TYPEPRICELINE when 'S6'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_6
      ,  max(case TYPEPRICELINE when 'S7'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_7
      ,  max(case TYPEPRICELINE when 'S8'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_8
      ,  max(case TYPEPRICELINE when 'S9'    then SACODE       else ''  end)  PRR_SELL_ANALYSIS_9
      ,  max(case TYPEPRICELINE when 'S10'   then SACODE       else ''  end)  PRR_SELL_ANALYSIS_10
      ,  max(case TYPEPRICELINE when 'B1'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_1
      ,  max(case TYPEPRICELINE when 'B2'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_2
      ,  max(case TYPEPRICELINE when 'B3'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_3
      ,  max(case TYPEPRICELINE when 'B4'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_4
      ,  max(case TYPEPRICELINE when 'B5'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_5
      ,  max(case TYPEPRICELINE when 'B6'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_6
      ,  max(case TYPEPRICELINE when 'B7'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_7
      ,  max(case TYPEPRICELINE when 'B8'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_8
      ,  max(case TYPEPRICELINE when 'B9'    then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_9
      ,  max(case TYPEPRICELINE when 'B10'   then PRP_PRICE    else 0   end)  PRR_BUY_PRICE_10
      ,  max(case TYPEPRICELINE when 'B1'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_1
      ,  max(case TYPEPRICELINE when 'B2'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_2
      ,  max(case TYPEPRICELINE when 'B3'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_3
      ,  max(case TYPEPRICELINE when 'B4'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_4
      ,  max(case TYPEPRICELINE when 'B5'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_5
      ,  max(case TYPEPRICELINE when 'B6'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_6
      ,  max(case TYPEPRICELINE when 'B7'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_7
      ,  max(case TYPEPRICELINE when 'B8'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_8
      ,  max(case TYPEPRICELINE when 'B9'    then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_9
      ,  max(case TYPEPRICELINE when 'B10'   then PRP_CURRENCY else ''  end)  PRR_BUY_CURR_10
      ,  max(case TYPEPRICELINE when 'B1'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_1
      ,  max(case TYPEPRICELINE when 'B2'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_2
      ,  max(case TYPEPRICELINE when 'B3'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_3
      ,  max(case TYPEPRICELINE when 'B4'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_4
      ,  max(case TYPEPRICELINE when 'B5'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_5
      ,  max(case TYPEPRICELINE when 'B6'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_6
      ,  max(case TYPEPRICELINE when 'B7'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_7
      ,  max(case TYPEPRICELINE when 'B8'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_8
      ,  max(case TYPEPRICELINE when 'B9'    then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_9
      ,  max(case TYPEPRICELINE when 'B10'   then PRP_PRICE_C  else 0   end)  PRR_BUY_PRICE_C_10
      ,  max(case TYPEPRICELINE when 'B1'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_1
      ,  max(case TYPEPRICELINE when 'B2'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_2
      ,  max(case TYPEPRICELINE when 'B3'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_3
      ,  max(case TYPEPRICELINE when 'B4'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_4
      ,  max(case TYPEPRICELINE when 'B5'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_5
      ,  max(case TYPEPRICELINE when 'B6'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_6
      ,  max(case TYPEPRICELINE when 'B7'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_7
      ,  max(case TYPEPRICELINE when 'B8'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_8
      ,  max(case TYPEPRICELINE when 'B9'    then PACODE       else ''  end)  PRR_BUY_ANALYSIS_9
      ,  max(case TYPEPRICELINE when 'B10'   then PACODE       else ''  end)  PRR_BUY_ANALYSIS_10
      ,  PRP_PR_LINK
         from
            (
               select
                  PRP_PR_LINK
               ,  case PRP_TYPE
                     when 0 then 'B'
                     else
                        'S'
                  end
                  +
                  cast(PRP_PRICE_LINE as varchar(1)) TYPEPRICELINE
               ,  PRP_CURRENCY
               ,  PRP_PRICE
               ,  PRP_PRICE_C
               ,  isnull(PACODE,'') PACODE
               ,  isnull(SACODE,'') SACODE
                  from
                     PRC_PRICE_REC_PRICES
                        left join PL_ANALYSIS on PA_PRIMARY = PRP_PL_ANALYSIS_LINK
                        left join SL_ANALYSIS on SA_PRIMARY = PRP_SL_ANALYSIS_LINK
            ) pricelines
         group by
            PRP_PR_LINK
   ) prices
      inner join PRC_PRICE_RECS on PR_PRIMARY = PRP_PR_LINK
