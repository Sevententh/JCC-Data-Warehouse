create view AA_NL_ENQ_VIEW
/*
** Written:       16/05/2005 RL
** Last Amended:  1/06/2005 CHW, 07/06/2005 CHW, 20/07/2005 DB, 18/11/2005 WW, 22/11/05chw, 19/12/2005 RL; 08/03/06 NC, 20/2/2007 RL, 6/9/2007 RL, 19/10/2010 CC, 07/06/11 NC
**
*/
(
DET_PRIMARY,
UNIQUE_KEY,
DET_BATCH_REF,
DET_SUB_LEDGER,
DET_DATE,
DET_NOM_PERSORT,
DET_HEADER_REF,
DET_CURR_CODE,
DET_HEADER_KEY,
DET_BATCH_FLAG,
DET_RECUR_FLAG,
DET_CURR_RATE,
DET_JNL_LINEREF,
DET_ORIGIN,
DET_TYPE,
DET_NOM_PERIOD,
DET_NOM_YEAR,
DET_USER_PUTIN,
DET_DATE_PUTIN,
DET_VAT_RULES,
DET_NOMINALDR,
DET_NOMINALCR,
DET_NOMINALVAT,
DET_ACCOUNT,
DET_ANALYSIS,
DET_COSTCENTRE,
DET_COSTHEADER,
DET_GROSS,
DET_VAT,
DET_NETT,
DET_CURR_TAX,
DET_CURR_NETT,
DET_ANALTYPE,
DET_CHEQUE_PAYEE,
DET_TRI_RATE1,
DET_TRI_RATE2,
DET_DESCRIPTION,
--DET_NETT_BASE2,
--DET_VAT_BASE2,
DET_GROSS_BASE2,
--DET_RECON_REF,
DET_PL_INTERNAL,
DET_TRI_RATECHNG1,
DET_TRI_RATECHNG2,
DET_CURR_RTEFLG,
--DET_HEADER_REF2,
DET_ORDER_LINK,
DET_RECONCILED,
DET_STOCK_CODE,
DET_PRICE_CODE,

HOME_DEBIT,
CURRENCY_DEBIT,
BASE2_DEBIT,
HOME_CREDIT,
CURRENCY_CREDIT,
BASE2_CREDIT,
NOMINAL_TYPE,

NCODE,
NNAME,
NCURRENCYCODE,
NTYPE,
NCATEGORYCODE1,
NCATEGORYCODE2,
NCATEGORYCODE3,
NCATEGORYCODE4,
NCATEGORYCODE5,
NCATEGORYCODE6,
NCATEGORYCODE7,
NCATEGORYCODE8,
NMAJORHEADCODE,
N_EXCLUDE_TRNREP,
DET_QUANTITY,
DET_DIMENSION1,
DET_DIMENSION2,
DET_DIMENSION3,
N_DO_NOT_USE,
DET_VATCODE
)
as
select
DET_PRIMARY,
convert(char(25),NCODE)+convert(char(5),convert(int,isnull(DET_DATE,0)))+convert(char(3),DET_NOM_PERSORT)+convert(char(10),DET_HEADER_KEY),
DET_BATCH_REF,
DET_SUB_LEDGER,
DET_DATE,
DET_NOM_PERSORT,
DET_HEADER_REF,
DET_CURR_CODE,
DET_HEADER_KEY,
DET_BATCH_FLAG,
DET_RECUR_FLAG,
DET_CURR_RATE,
DET_JNL_LINEREF,
DET_ORIGIN,
DET_TYPE,
DET_NOM_PERIOD,
DET_NOM_YEAR,
DET_USER_PUTIN,
DET_DATE_PUTIN,
DET_VAT_RULES,
DET_NOMINALDR,
DET_NOMINALCR,
DET_NOMINALVAT,
DET_ACCOUNT,
DET_ANALYSIS,
DET_COSTCENTRE,
DET_COSTHEADER,
DET_GROSS,
DET_VAT,
DET_NETT,
DET_CURR_TAX,
DET_CURR_NETT,
DET_ANALTYPE,
DET_CHEQUE_PAYEE,
DET_TRI_RATE1,
DET_TRI_RATE2,
DET_DESCRIPTION,
--DET_NETT_BASE2,
--DET_VAT_BASE2,
DET_GROSS_BASE2,
--DET_RECON_REF,
DET_PL_INTERNAL,
DET_TRI_RATECHNG1,
DET_TRI_RATECHNG2,
DET_CURR_RTEFLG,
--DET_HEADER_REF2,
DET_ORDER_LINK,
DET_RECONCILED,
DET_STOCK_CODE,
DET_PRICE_CODE,

-- HOME_DEBIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY, 1, 1)
         when 'S' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_GROSS < 0 then -DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT > 0 then DET_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_GROSS < 0 then -DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT < 0 then -DET_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_VAT < 0 then -DET_VAT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                           else
                              case when DET_VAT > 0 then DET_VAT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                           else
                              case when DET_VAT > 0 then DET_VAT else 0 end
                        end
                  end
            end
         when 'P' then
            case DET_TYPE
               when 'CRN' then
                  case when DET_VAT < 0 then -DET_VAT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case DET_TYPE
                           when 'ADR' then
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                           else
                              case when DET_VAT > 0 then DET_VAT else 0 end
                        end
                     else
                        case DET_TYPE
                           when 'ACR' then
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                           else
                              case when DET_VAT > 0 then DET_VAT else 0 end
                        end
                  end
            end
         else 0
      end
   else 0
end,

--CURRENCY_DEBIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE = 'CRN' then
                  case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                     end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                        end
                  end
            end
         else 0
      end
   else 0
end,

--BASE2_DEBIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                        end
                  end
            end
         else 0
      end
   else 0
end,

--HOME_CREDIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY, 1, 1)
         when 'S' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_GROSS > 0 then DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT > 0 then DET_NETT else 0 end
                           else
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT > 0 then DET_NETT else 0 end
                           else
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT < 0 then -DET_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT > 0 then DET_NETT else 0 end
                           else
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT > 0 then DET_NETT else 0 end
                           else
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_GROSS > 0 then DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT > 0 then DET_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_VAT > 0 then DET_VAT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT > 0 then DET_VAT else 0 end
                           else
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT > 0 then DET_VAT else 0 end
                           else
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_VAT > 0 then DET_VAT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT > 0 then DET_VAT else 0 end
                           else
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT > 0 then DET_VAT else 0 end
                           else
                              case when DET_VAT < 0 then -DET_VAT else 0 end
                        end
                  end
            end
         else 0-- Nominal journals do not populate DET_NOMINALVAT
      end
   else 0
end,

--CURRENCY_CREDIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE = 'CRN' then
                  case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                        end
                     end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                           end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                           else
                              case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                        end
                  end
            end
         else
            0
      end
   else 0
end,

--BASE2_CREDIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         else
            case when isnull(DET_NOMINALVAT,'') = '' and DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
      end
   else
      0
   end
+
case
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','PAY') then
                  case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE = 'CRN' then
                  case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE = 'ADR' then
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE = 'ACR' then
                              case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                           else
                              case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                        end
                  end
            end
         else
            0
      end
   else 0
end,

--NOMINAL_TYPE
case
   when DET_NOMINALDR = NCODE then 0
   when DET_NOMINALCR = NCODE then 1
   else 2
end,
NCODE,
NNAME,
NCURRENCYCODE,
NTYPE,
NCATEGORYCODE1,
NCATEGORYCODE2,
NCATEGORYCODE3,
NCATEGORYCODE4,
NCATEGORYCODE5,
NCATEGORYCODE6,
NCATEGORYCODE7,
NCATEGORYCODE8,
NMAJORHEADCODE,
N_EXCLUDE_TRNREP,
DET_QUANTITY,
DET_DIMENSION1,
DET_DIMENSION2,
DET_DIMENSION3,
isnull(N_DO_NOT_USE,0),
DET_VATCODE
from
   SL_PL_NL_DETAIL,
   NL_ACCOUNTS
where
         SL_PL_NL_DETAIL.DET_TYPE not in('MIN','MCR','MAD','MAC','MPA')
   and   (
            SL_PL_NL_DETAIL.DET_NOMINALDR    = NL_ACCOUNTS.NCODE
               or
            SL_PL_NL_DETAIL.DET_NOMINALCR    = NL_ACCOUNTS.NCODE
               or
            SL_PL_NL_DETAIL.DET_NOMINALVAT   = NL_ACCOUNTS.NCODE
         )


