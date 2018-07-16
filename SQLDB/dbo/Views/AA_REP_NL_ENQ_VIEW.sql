CREATE view AA_REP_NL_ENQ_VIEW
/*
** Written:       16/5/2005 RL
** Last Amended:  18/5/2005 RL, 20/5/2005 RL,1/6/05chw,7/6/05chw, 27/06/05 RV, 28/06/05 RV, 29/09/05 RV, 17/11/05 NC, 08/05/2006 RV, 10/01/2007 SH
** Comments:     view to create list of detail lines for use in crystal journal reports
*/
(
[PRIMARY],
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
DET_ACCOUNT,
DET_ANALYSIS,
DET_COSTCENTRE,
DET_COSTHEADER,
DET_CHEQUE_PAYEE,
DET_TRI_RATE1,
DET_TRI_RATE2,
DET_DESCRIPTION,
--DET_NETT_BASE2,DET_VAT_BASE2,
DET_BASE2_RATE,
--DET_RECON_REF,
DET_PL_INTERNAL,
DET_TRI_RATECHNG1,
DET_TRI_RATECHNG2,
DET_CURR_RTEFLG,
--DET_HEADER_REF2,
DET_RECONCILED,
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
NCATEGORYCODE1,NCATEGORYCODE2,NCATEGORYCODE3,NCATEGORYCODE4,NCATEGORYCODE5,NCATEGORYCODE6,NCATEGORYCODE7,NCATEGORYCODE8,NMAJORHEADCODE,
N_EXCLUDE_TRNREP,
DET_DIMENSION1,DET_DIMENSION2,DET_DIMENSION3, NT_REVERSE_FLAG, ACCOUNT_NAME, CH_NAME, CC_NAME, ANALYSIS_NAME, DET_BATCH_POSTD
)
as 
select convert(bigint,(case
   when DET_NOMINALDR = NCODE then '1'
   when DET_NOMINALCR = NCODE then '2'
   else '3' end)+convert(varchar,DET_PRIMARY)),
DET_PRIMARY,
convert(char(25),NCODE)+convert(char(5),convert(int,isnull(DET_DATE,0)))+convert(char(3),DET_NOM_PERSORT)+convert(char(10),DET_HEADER_KEY),
DET_BATCH_REF,DET_SUB_LEDGER,
DET_DATE,DET_NOM_PERSORT,
isnull(DET_HEADER_REF,'') As DET_HEADER_REF,
DET_CURR_CODE,
DET_HEADER_KEY,
Cast(DET_BATCH_FLAG as Bit) as DET_BATCH_FLAG,
Cast(DET_RECUR_FLAG as Bit) As DET_RECUR_FLAG,
DET_CURR_RATE,DET_JNL_LINEREF,DET_ORIGIN,DET_TYPE,DET_NOM_PERIOD,DET_NOM_YEAR,
DET_USER_PUTIN,DET_DATE_PUTIN,
DET_VAT_RULES,
isnull(DET_ACCOUNT,'') As DET_ACCOUNT,
isnull(DET_ANALYSIS,'') As DET_ANALYSIS,
DET_COSTCENTRE,DET_COSTHEADER,
DET_CHEQUE_PAYEE,
DET_TRI_RATE1,DET_TRI_RATE2,
DET_DESCRIPTION,
--DET_NETT_BASE2,DET_VAT_BASE2,
DET_BASE2_RATE,
--DET_RECON_REF,
DET_PL_INTERNAL,
Cast (DET_TRI_RATECHNG1 as Bit) As DET_TRI_RATECHNG1,
Cast (DET_TRI_RATECHNG2 as Bit) As DET_TRI_RATECHNG2,
Cast (DET_CURR_RTEFLG as Bit) As DET_CURR_RTEFLG,
--DET_HEADER_REF2,
DET_RECONCILED,

-- HOME_DEBIT_VALUE
case
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY, 1, 1)
         when 'S' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_GROSS < 0 then -DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('JCR','ACR') then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('JDR','ADR') then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                           else
                              case when DET_NETT > 0 then DET_NETT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_GROSS < 0 then -DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                           else
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('INV','MIN','VIN','PAY') then
                        case when DET_VAT < 0 then -DET_VAT else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'S' then
                              case
                                 when DET_TYPE in ('ADR','JDR') then
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                                 else
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                                 else
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('CRN','MCR','VCR') then
                        case when DET_VAT < 0 then -DET_VAT else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'P' then
                              case
                                 when DET_TYPE in ('JDR','ADR') then
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                                 else
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                                 else
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                              end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALDR = '' then
                  case when DET_VAT < 0 then -DET_VAT else 0 end
               when DET_NOMINALDR is null then
                  case when DET_VAT < 0 then -DET_VAT else 0 end
               else
                  case when DET_VAT > 0 then DET_VAT else 0 end
            end
      end
   else 0
end,

--CURRENCY_DEBIT_VALUE
case 
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('JCR','ACR') then
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('JDR','ADR') then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                     end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                        end
                  end
            end
         else
            case
               when DET_NOMINALVAT = '' then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('INV','MIN','VIN','PAY') then
                        case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'S' then
                              case
                                 when DET_TYPE in ('ADR','JDR') then
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('CRN','MCR','VCR') then
                        case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'P' then
                              case
                                 when DET_TYPE in ('JDR','ADR') then
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                              end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALDR = '' then
                  case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
               when DET_NOMINALDR is null then
                  case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
               else
                  case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
            end
      end
   else 0
end,

--BASE2_DEBIT_VALUE
case 
   when DET_NOMINALDR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('JCR','ACR') then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('JDR','ADR') then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               else 0
            end
      end
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               else 0
            end
      end
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('INV','MIN','VIN','PAY') then
                        case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'S' then
                              case
                                 when DET_TYPE in ('ADR','JDR') then
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('CRN','MCR','VCR') then
                        case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'P' then
                              case
                                 when DET_TYPE in ('JDR','ADR') then
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                              end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALDR = '' then
                  case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
               when DET_NOMINALDR is null then
                  case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
               else
                  case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
            end
      end
   else 0
end,

--HOME_CREDIT_VALUE
case
   when DET_NOMINALDR = NCODE and DET_NOMINALDR <> isnull(DET_NOMINALCR,'') then
      case substring(DET_HEADER_KEY, 1, 1)
         when 'S' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_GROSS > 0 then DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('JCR','ACR') then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('JDR','ADR') then
                              case when DET_NETT > 0 then DET_NETT else 0 end
                           else
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_NETT > 0 then DET_NETT else 0 end
                           else
                              case when DET_NETT < 0 then -DET_NETT else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT < 0 then -DET_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case 
                     when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                        case when DET_GROSS > 0 then DET_GROSS else 0 end
                     else
                        case when DET_NETT > 0 then DET_NETT else 0 end
                  end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS > 0 then DET_GROSS else 0 end
                                 else
                                    case when DET_NETT > 0 then DET_NETT else 0 end
                              end
                           else
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS < 0 then -DET_GROSS else 0 end
                                 else
                                    case when DET_NETT < 0 then -DET_NETT else 0 end
                              end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS > 0 then DET_GROSS else 0 end
                                 else
                                    case when DET_NETT > 0 then DET_NETT else 0 end
                              end
                           else
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS < 0 then -DET_GROSS else 0 end
                                 else
                                    case when DET_NETT < 0 then -DET_NETT else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_GROSS > 0 then DET_GROSS else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS > 0 then DET_GROSS else 0 end
                           else
                              case when DET_GROSS < 0 then -DET_GROSS else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT > 0 then DET_NETT else 0 end
               else  0
            end
      end
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('INV','MIN','VIN','PAY') then
                        case when DET_VAT > 0 then DET_VAT else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'S' then
                              case
                                 when DET_TYPE in ('ADR','JDR') then
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                                 else
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                                 else
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('CRN','MCR','VCR') then
                        case when DET_VAT > 0 then DET_VAT else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'P' then
                              case
                                 when DET_TYPE in ('JDR','ADR') then
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                                 else
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT > 0 then DET_VAT else 0 end
                                 else
                                    case when DET_VAT < 0 then -DET_VAT else 0 end
                              end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALDR = '' then
                  case when DET_VAT > 0 then DET_VAT else 0 end
               when DET_NOMINALDR is null then
                  case when DET_VAT > 0 then DET_VAT else 0 end
               else
                  case when DET_VAT < 0 then -DET_VAT else 0 end
            end
      end
   else 0
end,

--CURRENCY_CREDIT_VALUE
case
   when DET_NOMINALDR = NCODE and DET_NOMINALDR <> isnull(DET_NOMINALCR,'') then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('JCR','ACR') then
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when (DET_CURR_NETT+DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT+DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('JDR','ADR') then
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                           else
                              case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                        end
                     end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case 
                     when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                        case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                     else
                        case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                  end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                              end
                           else
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
                                 else
                                    case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                              end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT + DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
                              end
                           else
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT + DET_CURR_TAX) else 0 end
                                 else
                                    case when DET_CURR_NETT < 0 then -DET_CURR_NETT else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                           end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when (DET_CURR_NETT + DET_CURR_TAX) > 0 then DET_CURR_NETT+DET_CURR_TAX else 0 end
                           else
                              case when (DET_CURR_NETT + DET_CURR_TAX) < 0 then -(DET_CURR_NETT+DET_CURR_TAX) else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_CURR_NETT > 0 then DET_CURR_NETT else 0 end
               else 0
            end
      end
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('INV','MIN','VIN','PAY') then
                        case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'S' then
                              case
                                 when DET_TYPE in ('ADR','JDR') then
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_VAT_RULES = 1 then 0 
               else
                  case
                     when DET_TYPE in ('CRN','MCR','VCR') then
                        case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'P' then
                              case
                                 when DET_TYPE in ('JDR','ADR') then
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
                                 else
                                    case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
                              end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALDR = '' then
                  case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
               when DET_NOMINALDR is null then
                  case when DET_CURR_TAX > 0 then DET_CURR_TAX else 0 end
               else
                  case when DET_CURR_TAX < 0 then -DET_CURR_TAX else 0 end
            end
      end
   else 0
end,

--BASE2_CREDIT_VALUE
case
   when DET_NOMINALDR = NCODE and DET_NOMINALDR <> isnull(DET_NOMINALCR,'') then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('JCR','ACR') then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('CRN','MCR','VCR') then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('JDR','ADR') then
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                           else
                              case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
               else 0
            end
      end
   when DET_NOMINALCR = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case 
                     when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                        case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                     else
                        case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                  end
               else
                  case
                     when DET_ANALTYPE = 'S' then
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                                 else
                                    case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                              end
                           else
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                                 else
                                    case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                              end
                        end
                     else
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                                 else
                                    case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
                              end
                           else
                              case 
                                 when DET_NOMINALCR = isnull(DET_NOMINALVAT, '') then
                                    case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                                 else
                                    case when DET_NETT_BASE2 < 0 then -DET_NETT_BASE2 else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_TYPE in ('INV','MIN','VIN','PAY') then
                  case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
               else
                  case
                     when DET_ANALTYPE = 'P' then
                        case
                           when DET_TYPE in ('ACR','JCR') then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                     else
                        case
                           when DET_TYPE in ('ADR','JDR') then
                              case when DET_GROSS_BASE2 > 0 then DET_GROSS_BASE2 else 0 end
                           else
                              case when DET_GROSS_BASE2 < 0 then -DET_GROSS_BASE2 else 0 end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALVAT = '' then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               when DET_NOMINALVAT is null then
                  case when DET_NETT_BASE2 > 0 then DET_NETT_BASE2 else 0 end
               else 0
            end
      end
   when DET_NOMINALVAT = NCODE then
      case substring(DET_HEADER_KEY,1,1)
         when 'S' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('INV','MIN','VIN','PAY') then
                        case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'S' then
                              case
                                 when DET_TYPE in ('ADR','JDR') then
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                              end
                        end
                  end
            end
         when 'P' then
            case
               when DET_VAT_RULES = 1 then 0
               else
                  case
                     when DET_TYPE in ('CRN','MCR','VCR') then
                        case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                     else
                        case
                           when DET_ANALTYPE = 'P' then
                              case
                                 when DET_TYPE in ('JDR','ADR') then
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                              end
                           else
                              case
                                 when DET_TYPE in ('ACR','JCR') then
                                    case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
                                 else
                                    case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
                              end
                        end
                  end
            end
         else
            case 
               when DET_NOMINALDR = '' then
                  case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
               when DET_NOMINALDR is null then
                  case when DET_VAT_BASE2 > 0 then DET_VAT_BASE2 else 0 end
               else
                  case when DET_VAT_BASE2 < 0 then -DET_VAT_BASE2 else 0 end
            end
      end
   else 0
end,

--NOMINAL_TYPE
case
   when DET_NOMINALDR = NCODE then 0
   when DET_NOMINALCR = NCODE then 1
   else 2
end,
NCODE,NNAME,
NCURRENCYCODE,NTYPE,
NCATEGORYCODE1,NCATEGORYCODE2,NCATEGORYCODE3,NCATEGORYCODE4,NCATEGORYCODE5,NCATEGORYCODE6,NCATEGORYCODE7,NCATEGORYCODE8,NMAJORHEADCODE,
N_EXCLUDE_TRNREP,
DET_DIMENSION1,DET_DIMENSION2,DET_DIMENSION3, NT_REVERSE_FLAG,

(case when DET_ORIGIN = 'S'
         Then
            Cast(CUNAME as VARCHAR(40))
      when DET_ORIGIN = 'P'
         Then  
            Cast(SUNAME as VARCHAR(40))
      
         end)
   ACCOUNT_NAME,
CH_NAME,
CC_NAME,
(case when DET_ORIGIN = 'S'
         Then
            Cast(SANAME as VARCHAR(40))
      when DET_ORIGIN = 'P'
         Then  
            Cast(PANAME as VARCHAR(40))
      
         end)
   ANALYSIS_NAME,
DET_BATCH_POSTD
from SL_PL_NL_DETAIL 

   left outer join NL_TRANSACTIONS 
   on NT_PRIMARY = convert(int,substring(DET_HEADER_KEY,2,10))

   left outer join SL_ACCOUNTS 
   on CUCODE = DET_ACCOUNT And substring(DET_ORIGIN,1,1) = 'S'  And ((CUCODE <> '' And DET_ACCOUNT <> '') or (CUCODE is not null And DET_ACCOUNT is not null ))

   left outer join PL_ACCOUNTS 
   on SUCODE = DET_ACCOUNT And substring(DET_ORIGIN,1,1) = 'P'  

   Left Outer JOIN SL_ANALYSIS 
   ON SL_PL_NL_DETAIL.DET_ANALYSIS = SL_ANALYSIS.SACODE

   Left Outer JOIN PL_ANALYSIS 
   ON SL_PL_NL_DETAIL.DET_ANALYSIS = PL_ANALYSIS.PACODE

   LEFT OUTER JOIN CST_COSTCENTRE 
   ON CC_CONCAT_CODES = DET_COSTHEADER + SPACE(10 - LEN(DET_COSTHEADER)) + DET_COSTCENTRE 
  
   LEFT OUTER JOIN CST_COSTHEADER
   ON SL_PL_NL_DETAIL.DET_COSTHEADER = CST_COSTHEADER.CH_CODE

   , NL_ACCOUNTS

where SL_PL_NL_DETAIL.DET_TYPE not in('MIN','MCR', 'MAC', 'MPA', 'MAD')
      and (SL_PL_NL_DETAIL.DET_NOMINALDR = NL_ACCOUNTS.NCODE
      or SL_PL_NL_DETAIL.DET_NOMINALCR = NL_ACCOUNTS.NCODE
      or SL_PL_NL_DETAIL.DET_NOMINALVAT = NL_ACCOUNTS.NCODE)






