﻿CREATE VIEW AA_NET_STK_COSTPRICE_VIEW
/*
** Stored procedure for retieving all the necessary values for the .NET XML Schema
**
** Written:14/01/2003 SRB
** Last Amended: 15/01/03 NC
**
*/
as

select 

STKCODE2,
STKNAME,
'B' As
PRICETYPE,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE1) AS STK_COSTPRICE1,
STK_P_CURRCDE1,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST1) AS STK_P_CURRCST1,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST1) AS STK_P_BASE2CST1,
COALESCE(STK_PANALYSIS1,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS1,
COALESCE(PL_ANALYSIS1.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS1NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT1) AS STK_BUY_UNIT1,
COALESCE(STK_BUY_NAME1,'Each') AS STK_BUY_NAME1,
STK_COSTMETH1,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM1) AS STK_PQTY_FROM1,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO1) AS STK_PQTY_TO1,
dbo.AA_TWO_DPS_F(STK_P_PERCENT1) AS STK_P_PERCENT1,
STK_SUPPLIER1,
STK_SUPSTKCDE1,
dbo.AA_VALUE_DPS_F(STK_MIN_ORDER1) AS STK_MIN_ORDER1,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE2) AS STK_COSTPRICE2,
STK_P_CURRCDE2,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST2) AS STK_P_CURRCST2,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST2) AS STK_P_BASE2CST2,
COALESCE(STK_PANALYSIS2,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS2,
COALESCE(PL_ANALYSIS2.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS2NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT2) AS STK_BUY_UNIT2,
COALESCE(STK_BUY_NAME2,'Each') AS STK_BUY_NAME2,
STK_COSTMETH2,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM2) AS STK_PQTY_FROM2,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO2) AS STK_PQTY_TO2,
dbo.AA_TWO_DPS_F(STK_P_PERCENT2) AS STK_P_PERCENT2,
STK_SUPPLIER2,
STK_SUPSTKCDE2,
STK_MIN_ORDER2,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE3) AS STK_COSTPRICE3,
STK_P_CURRCDE3,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST3) AS STK_P_CURRCST3,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST3) AS STK_P_BASE2CST3,
COALESCE(STK_PANALYSIS3,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS3,
COALESCE(PL_ANALYSIS3.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS3NAME,
STK_BUY_UNIT3,
COALESCE(STK_BUY_NAME3,'Each') AS STK_BUY_NAME3,
STK_COSTMETH3,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM3) AS STK_PQTY_FROM3,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO3) AS STK_PQTY_TO3,
dbo.AA_TWO_DPS_F(STK_P_PERCENT3) AS STK_P_PERCENT3,
STK_SUPPLIER3,
STK_SUPSTKCDE3,
STK_MIN_ORDER3,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE4) AS STK_COSTPRICE4,
STK_P_CURRCDE4,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST4) AS STK_P_CURRCST4,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST4) AS STK_P_BASE2CST4,
COALESCE(STK_PANALYSIS4,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS4,
COALESCE(PL_ANALYSIS4.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS4NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT4) AS STK_BUY_UNIT4,
COALESCE(STK_BUY_NAME4,'Each') AS STK_BUY_NAME4,
STK_COSTMETH4,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM4) AS STK_PQTY_FROM4,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO4) AS STK_PQTY_TO4,
dbo.AA_TWO_DPS_F(STK_P_PERCENT4) AS STK_P_PERCENT4,
STK_SUPPLIER4,
STK_SUPSTKCDE4,
dbo.AA_QUANTITY_DPS_F(STK_MIN_ORDER4) AS STK_MIN_ORDER4,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE5) AS STK_COSTPRICE5,
STK_P_CURRCDE5,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST5) AS STK_P_CURRCST5,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST5) AS STK_P_BASE2CST5,
COALESCE(STK_PANALYSIS5,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS5,
COALESCE(PL_ANALYSIS5.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS5NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT5) AS STK_BUY_UNIT5,
COALESCE(STK_BUY_NAME5,'Each') AS STK_BUY_NAME5,
STK_COSTMETH5,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM5) AS STK_PQTY_FROM5,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO5) AS STK_PQTY_TO5,
dbo.AA_TWO_DPS_F(STK_P_PERCENT5) AS STK_P_PERCENT5,
STK_SUPPLIER5,
STK_SUPSTKCDE5,
STK_MIN_ORDER5,
dbo.AA_QUANTITY_DPS_F(STK_COSTPRICE6) AS STK_COSTPRICE6,
STK_P_CURRCDE6,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST6) AS STK_P_CURRCST6,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST6) AS STK_P_BASE2CST6,
COALESCE(STK_PANALYSIS6,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS6,
COALESCE(PL_ANALYSIS6.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS6NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT6) AS STK_BUY_UNIT6,
COALESCE(STK_BUY_NAME6,'Each') AS STK_BUY_NAME6,
STK_COSTMETH6,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM6) AS STK_PQTY_FROM6,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO6) AS STK_PQTY_TO6,
dbo.AA_TWO_DPS_F(STK_P_PERCENT6) AS STK_P_PERCENT6,
STK_SUPPLIER6,
STK_SUPSTKCDE6,
dbo.AA_QUANTITY_DPS_F(STK_MIN_ORDER6) AS STK_MIN_ORDER6,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE7) AS STK_COSTPRICE7,
STK_P_CURRCDE7,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST7) AS STK_P_CURRCST7,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST7) AS STK_P_BASE2CST7,
COALESCE(STK_PANALYSIS7,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS7,
COALESCE(PL_ANALYSIS7.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS7NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT7) AS STK_BUY_UNIT7,
COALESCE(STK_BUY_NAME7,'Each') AS STK_BUY_NAME7,
STK_COSTMETH7,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM7) AS STK_PQTY_FROM7,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO7) AS STK_PQTY_TO7,
dbo.AA_TWO_DPS_F(STK_P_PERCENT7) AS STK_P_PERCENT7,
STK_SUPPLIER7,
STK_SUPSTKCDE7,
dbo.AA_QUANTITY_DPS_F(STK_MIN_ORDER7) AS STK_MIN_ORDER7,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE8) AS STK_COSTPRICE8,
STK_P_CURRCDE8,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST8) AS STK_P_CURRCST8,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST8) AS STK_P_BASE2CST8,
COALESCE(STK_PANALYSIS8,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS8,
COALESCE(PL_ANALYSIS8.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS8NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT8) AS STK_BUY_UNIT8,
COALESCE(STK_BUY_NAME8,'Each') AS STK_BUY_NAME8,
STK_COSTMETH8,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM8) AS STK_PQTY_FROM8,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO8) AS STK_PQTY_TO8,
dbo.AA_TWO_DPS_F(STK_P_PERCENT8) AS STK_P_PERCENT8,
STK_SUPPLIER8,
STK_SUPSTKCDE8,
dbo.AA_QUANTITY_DPS_F(STK_MIN_ORDER8) AS STK_MIN_ORDER8,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE9) AS STK_COSTPRICE9,
STK_P_CURRCDE9,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST9) AS STK_P_CURRCST9,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST9) AS STK_P_BASE2CST9,
COALESCE(STK_PANALYSIS9,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS9,
COALESCE(PL_ANALYSIS9.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS9NAME,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT9) AS STK_BUY_UNIT9,
COALESCE(STK_BUY_NAME9,'Each') AS STK_BUY_NAME9,
STK_COSTMETH9,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM9) AS STK_PQTY_FROM9,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO9) AS STK_PQTY_TO9,
dbo.AA_TWO_DPS_F(STK_P_PERCENT9) AS STK_P_PERCENT9,
STK_SUPPLIER9,
STK_SUPSTKCDE9,
dbo.AA_QUANTITY_DPS_F(STK_MIN_ORDER9) AS STK_MIN_ORDER9,
dbo.AA_PRICE_DPS_F(STK_COSTPRICE10) AS STK_COSTPRICE10,
STK_P_CURRCDE10,
dbo.AA_PRICE_DPS_F(STK_P_CURRCST10) AS STK_P_CURRCST10,
dbo.AA_PRICE_DPS_F(STK_P_BASE2CST10) AS STK_P_BASE2CST10,
COALESCE(STK_PANALYSIS10,ANALYSISDEFAULT.PACODE) AS STK_PANALYSIS10,
COALESCE(PL_ANALYSIS10.PANAME,ANALYSISDEFAULT.PANAME) AS STK_PANALYSIS10NAME,
COALESCE(STK_BUY_NAME10,'Each') AS STK_BUY_NAME10,
dbo.AA_QUANTITY_DPS_F(STK_BUY_UNIT10) AS STK_BUY_UNIT10,
STK_COSTMETH10,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_FROM10) AS STK_PQTY_FROM10,
dbo.AA_QUANTITY_DPS_F(STK_PQTY_TO10) AS STK_PQTY_TO10,
dbo.AA_TWO_DPS_F(STK_P_PERCENT10) AS STK_P_PERCENT10,
STK_SUPPLIER10,
STK_SUPSTKCDE10,
dbo.AA_QUANTITY_DPS_F(STK_MIN_ORDER10) AS STK_MIN_ORDER10


from STK_STOCK_2
	inner join STK_STOCK
	on STK_PRIMARY_2 = STK_PRIMARY
	inner join STK_STOCK4
	on STK_PRIMARY_2 = STK_PRIMARY_4

	left join PL_ANALYSIS as PL_ANALYSIS1
	on STK_PANALYSIS1 = PL_ANALYSIS1.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS2
	on STK_PANALYSIS2 = PL_ANALYSIS2.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS3
	on STK_PANALYSIS3 = PL_ANALYSIS3.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS4
	on STK_PANALYSIS4 = PL_ANALYSIS4.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS5
	on STK_PANALYSIS5 = PL_ANALYSIS5.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS6
	on STK_PANALYSIS6 = PL_ANALYSIS6.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS7
	on STK_PANALYSIS7 = PL_ANALYSIS7.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS8
	on STK_PANALYSIS8 = PL_ANALYSIS8.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS9
	on STK_PANALYSIS9 = PL_ANALYSIS9.PACODE

	left join PL_ANALYSIS as PL_ANALYSIS10
	on STK_PANALYSIS10 = PL_ANALYSIS10.PACODE

	join PL_ANALYSIS AS ANALYSISDEFAULT
	
	on ANALYSISDEFAULT.PADEFAULT_PURCH='1'