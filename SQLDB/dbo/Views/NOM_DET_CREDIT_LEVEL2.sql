CREATE VIEW NOM_DET_CREDIT_LEVEL2
/*
** Written:
** Last Amended: 22/10/02, 01/12/03 SR, 24/05/05 SR, 7/6/05chw, 19/12/2005 RL, 19/10/2010 CC
**
*/
(
DET_BATCH_REF,DET_SUB_LEDGER,DET_DATE,DET_NOM_PERSORT,DET_HEADER_REF,DET_CURR_CODE,DET_HEADER_KEY,DET_BATCH_FLAG,
DET_RECUR_FLAG,DET_CURR_RATE,DET_JNL_LINEREF,DET_ORIGIN,DET_TYPE,DET_NOM_PERIOD,DET_NOM_YEAR,DET_USER_PUTIN,
DET_DATE_PUTIN,DET_VAT_RULES,DET_NOMINALDR,DET_NOMINALCR,DET_NOMINALVAT,DET_ACCOUNT,DET_ANALYSIS,DET_COSTCENTRE,
DET_COSTHEADER,DET_GROSS,DET_VAT,DET_NETT,DET_CURR_TAX,DET_CURR_NETT,DET_ANALTYPE,DET_CHEQUE_PAYEE,
DET_TRI_RATE1,DET_TRI_RATE2,DET_DESCRIPTION,DET_NETT_BASE2,DET_VAT_BASE2,DET_GROSS_BASE2,DET_RECON_REF,DET_PL_INTERNAL,
DET_TRI_RATECHNG1,DET_TRI_RATECHNG2,DET_CURR_RTEFLG,DET_HEADER_REF2,DET_ORDER_LINK,DET_RECONCILED,DET_STOCK_CODE,DET_PRICE_CODE,
HOME_TEMP_VALUE,CURRENCY_TEMP_VALUE,BASE2_TEMP_VALUE,DET_PRIMARY,NOMINAL_CODE,DET_QUANTITY,DET_DIMENSION1,DET_DIMENSION2,
DET_DIMENSION3,DET_ARCHIVE_FLG,DET_VATCODE)
as select 
DET_BATCH_REF,DET_SUB_LEDGER,DET_DATE,DET_NOM_PERSORT,DET_HEADER_REF,DET_CURR_CODE,DET_HEADER_KEY,DET_BATCH_FLAG,
DET_RECUR_FLAG,DET_CURR_RATE,DET_JNL_LINEREF,DET_ORIGIN,DET_TYPE,DET_NOM_PERIOD,DET_NOM_YEAR,DET_USER_PUTIN,
DET_DATE_PUTIN,DET_VAT_RULES,DET_NOMINALDR,DET_NOMINALCR,DET_NOMINALVAT,DET_ACCOUNT,DET_ANALYSIS,DET_COSTCENTRE,
DET_COSTHEADER,DET_GROSS,DET_VAT,DET_NETT,DET_CURR_TAX,DET_CURR_NETT,DET_ANALTYPE,DET_CHEQUE_PAYEE,
DET_TRI_RATE1,DET_TRI_RATE2,DET_DESCRIPTION,DET_NETT_BASE2,DET_VAT_BASE2,DET_GROSS_BASE2,DET_RECON_REF,DET_PL_INTERNAL,
DET_TRI_RATECHNG1,DET_TRI_RATECHNG2,DET_CURR_RTEFLG,DET_HEADER_REF2,DET_ORDER_LINK,DET_RECONCILED,DET_STOCK_CODE,DET_PRICE_CODE,
(case substring(DET_HEADER_KEY,1,1)
	when 'S' then
		case
		when DET_TYPE in ('INV','MIN','VIN','PAY')
		then
			-DET_NETT
		else
			case
			when DET_ANALTYPE = 'S'
			then
				case
				when DET_TYPE in ('ADR','JDR')
				then
					-DET_NETT
				else
					DET_NETT
				end
			else
				case
				when DET_TYPE in ('ACR','JCR')
				then
					-DET_NETT
				else
					DET_NETT
				end
			end
		end
	when 'P' then
		case
		when DET_TYPE in ('INV','MIN','VIN','PAY')
		then
			-DET_GROSS
		else
			case
			when DET_ANALTYPE = 'P'
			then
				case
				when DET_TYPE in ('ACR','JCR')
				then
					-DET_GROSS
				else
					DET_GROSS
				end
			else
				case
				when DET_TYPE in ('ADR','JDR')
				then
					-DET_GROSS
				else
					DET_GROSS
				end
			end
		end
	else
	case 
	when DET_NOMINALVAT = '' then -DET_NETT
	when DET_NOMINALVAT is null then -DET_NETT
	else
	0
	end
end),
(case substring(DET_HEADER_KEY,1,1)
	when 'S' then
		case
		when DET_TYPE in ('INV','MIN','VIN','PAY')
		then
			-DET_CURR_NETT
		else
			case
			when DET_ANALTYPE = 'S'
			then
				case
				when DET_TYPE in ('ADR','JDR')
				then
					-DET_CURR_NETT
				else
					DET_CURR_NETT
				end
			else
				case
				when DET_TYPE in ('ACR','JCR')
				then
					-DET_CURR_NETT
				else
					DET_CURR_NETT
				end
			end
		end
	when 'P' then
			case
			when DET_TYPE in ('INV','MIN','VIN','PAY')
			then
				-(DET_CURR_NETT+DET_CURR_TAX)
			else
				case
				when DET_ANALTYPE = 'P'
				then
					case
					when DET_TYPE in ('ACR','JCR')
					then
						-(DET_CURR_NETT+DET_CURR_TAX)
					else
						(DET_CURR_NETT+DET_CURR_TAX)
					end
				else
					case
					when DET_TYPE in ('ADR','JDR')
					then
						-(DET_CURR_NETT+DET_CURR_TAX)
					else
						(DET_CURR_NETT+DET_CURR_TAX)
					end
				end
			end
	else
	case 
	when DET_NOMINALVAT = '' then -DET_CURR_NETT
	when DET_NOMINALVAT is null then -DET_CURR_NETT
	else
	0
	end
end),
(case substring(DET_HEADER_KEY,1,1)
	when 'S' then
			case
			when DET_TYPE in ('INV','MIN','VIN','PAY')
			then
				-DET_NETT_BASE2
			else
				case
				when DET_ANALTYPE = 'S'
				then
					case
					when DET_TYPE in ('ADR','JDR')
					then
						-DET_NETT_BASE2
					else
						DET_NETT_BASE2
					end
				else
					case
					when DET_TYPE in ('ACR','JCR')
					then
						-DET_NETT_BASE2
					else
						DET_NETT_BASE2
					end
				end
			end
	when 'P' then
			case
			when DET_TYPE in ('INV','MIN','VIN','PAY')
			then
				-DET_GROSS_BASE2
			else
				case
				when DET_ANALTYPE = 'P'
				then
					case
					when DET_TYPE in ('ACR','JCR')
					then
						-DET_GROSS_BASE2
					else
						DET_GROSS_BASE2
					end
				else
					case
					when DET_TYPE in ('ADR','JDR')
					then
						-DET_GROSS_BASE2
					else
						DET_GROSS_BASE2
					end
				end
			end
	else
	case 
	when DET_NOMINALVAT = '' then -DET_NETT_BASE2
	when DET_NOMINALVAT is null then -DET_NETT_BASE2
	else
	0
	end
end)
,DET_PRIMARY,DET_NOMINALCR,DET_QUANTITY,DET_DIMENSION1,DET_DIMENSION2,DET_DIMENSION3,DET_ARCHIVE_FLG,DET_VATCODE
from SL_PL_NL_DETAIL with (index (DET_NOMINALCR))
where DET_TYPE not in('MIN','MCR','MAD','MAC','MPA')
