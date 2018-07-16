create view AA_SYS_HOME_DEFAULTS_VIEW
/*
** Written:     30/01/04  
** Last Amended: 26/07/04, 30/07/04, 03/08/04, 11/11/04 SR, 03/03/05 ROBB
** Comments: Returns Home Defaults
*/
as

select 
	HOME_CURR_SYMBL
	,HOME_COUNTRY
	,HOME_TAXNAME
	,case when len(BASE2_CURR_SYMBOL) > 0 then 1 else 0 end as USINGSECONDBASE
	,BASE2_CURR_SYMBOL
	,SETT_DISCOUNT_VAT_CALC
	,case when CO_EC_FLAG = 1 then 1 else 0 end as EUSTATEMEMBER
	,case POST_RND_DIF_METHOD 
			when 'R' then 1 --Rounding Difference
			when 'B' then 2 --Batch Rounding Difference
			else 0 end --No Rounding Difference
			as POST_RND_DIF_METHOD
	,CURREC_DESCRIPTION as HOME_CURR_DESCRIPTION
	,CURREC_NOM_COST_OF_GOODS as NOM_COST_OF_GOODS
	,n1.NNAME as NOM_COST_OF_GOODS_NAME
	,CURREC_NOM_GOODS_RCVD_NOT_INV as NOM_GOODS_RCVD_NOT_INV
	,n2.NNAME as NOM_GOODS_RCVD_NOT_INV_NAME
	,VAT_CODE as DEFAULT_TAX_CODE
	,VAT_RATE as DEFAULT_TAX_RATE
	,case coalesce(EC_TYPE,'')
		when '' then 0
		when 'G' then 1
		when 'S' then 2
		when 'A' then 3
		when 'R' then 4
		when 'T' then 5
		when 'U' then 6
	end
	as DEFAULT_TAX_TYPE 
	,VAT_NAME as DEFAULT_TAX_NAME
	,CURREC_NOM_STOCK_CONTROL as NOM_STOCK_CONTROL
	,n3.NNAME as NOM_STOCK_CONTROL_NAME

from 
	SYS_DATAINFO
	inner join SYS_COUNTRY ON HOME_COUNTRY = CO_CODE
	inner join SYS_DATAINFO2 ON SYS_PRIMARY_2=1
	left outer join SYS_CURRENCY_REC on CURREC_SYMBOL = HOME_CURR_SYMBL
	left outer join NL_ACCOUNTS n1 on n1.NCODE = CURREC_NOM_COST_OF_GOODS
	left outer join NL_ACCOUNTS n2 on n2.NCODE = CURREC_NOM_GOODS_RCVD_NOT_INV
	left outer join NL_ACCOUNTS n3 on n3.NCODE = CURREC_NOM_STOCK_CONTROL
	left outer join SYS_VATCONTROL on VAT_CODE='1'	--TODO: update this code check