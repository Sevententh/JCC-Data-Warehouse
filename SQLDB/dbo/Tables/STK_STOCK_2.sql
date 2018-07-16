﻿CREATE TABLE [dbo].[STK_STOCK_2] (
    [STKCODE2]        VARCHAR (25) NULL,
    [STK_BUY_UNIT1]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT2]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT3]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT4]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT5]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT6]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT7]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT8]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT9]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_UNIT10]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BUY_NAME1]   VARCHAR (20) NULL,
    [STK_BUY_NAME2]   VARCHAR (20) NULL,
    [STK_BUY_NAME3]   VARCHAR (20) NULL,
    [STK_BUY_NAME4]   VARCHAR (20) NULL,
    [STK_BUY_NAME5]   VARCHAR (20) NULL,
    [STK_BUY_NAME6]   VARCHAR (20) NULL,
    [STK_BUY_NAME7]   VARCHAR (20) NULL,
    [STK_BUY_NAME8]   VARCHAR (20) NULL,
    [STK_BUY_NAME9]   VARCHAR (20) NULL,
    [STK_BUY_NAME10]  VARCHAR (20) NULL,
    [STK_COSTMETH1]   VARCHAR (2)  NULL,
    [STK_COSTMETH2]   VARCHAR (2)  NULL,
    [STK_COSTMETH3]   VARCHAR (2)  NULL,
    [STK_COSTMETH4]   VARCHAR (2)  NULL,
    [STK_COSTMETH5]   VARCHAR (2)  NULL,
    [STK_COSTMETH6]   VARCHAR (2)  NULL,
    [STK_COSTMETH7]   VARCHAR (2)  NULL,
    [STK_COSTMETH8]   VARCHAR (2)  NULL,
    [STK_COSTMETH9]   VARCHAR (2)  NULL,
    [STK_COSTMETH10]  VARCHAR (2)  NULL,
    [STK_P_PERCENT1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_PERCENT10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCDE1]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE2]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE3]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE4]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE5]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE6]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE7]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE8]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE9]  VARCHAR (4)  NULL,
    [STK_P_CURRCDE10] VARCHAR (4)  NULL,
    [STK_P_CURRCST1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_CURRCST10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MIN_ORDER10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PANALYSIS1]  VARCHAR (25) NULL,
    [STK_PANALYSIS2]  VARCHAR (25) NULL,
    [STK_PANALYSIS3]  VARCHAR (25) NULL,
    [STK_PANALYSIS4]  VARCHAR (25) NULL,
    [STK_PANALYSIS5]  VARCHAR (25) NULL,
    [STK_PANALYSIS6]  VARCHAR (25) NULL,
    [STK_PANALYSIS7]  VARCHAR (25) NULL,
    [STK_PANALYSIS8]  VARCHAR (25) NULL,
    [STK_PANALYSIS9]  VARCHAR (25) NULL,
    [STK_PANALYSIS10] VARCHAR (25) NULL,
    [STK_PQTY_FROM1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_FROM10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO1]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO2]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO3]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO4]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO5]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO6]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO7]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO8]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO9]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PQTY_TO10]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SUPPLIER1]   VARCHAR (10) NULL,
    [STK_SUPPLIER2]   VARCHAR (10) NULL,
    [STK_SUPPLIER3]   VARCHAR (10) NULL,
    [STK_SUPPLIER4]   VARCHAR (10) NULL,
    [STK_SUPPLIER5]   VARCHAR (10) NULL,
    [STK_SUPPLIER6]   VARCHAR (10) NULL,
    [STK_SUPPLIER7]   VARCHAR (10) NULL,
    [STK_SUPPLIER8]   VARCHAR (10) NULL,
    [STK_SUPPLIER9]   VARCHAR (10) NULL,
    [STK_SUPPLIER10]  VARCHAR (10) NULL,
    [STK_SUPSTKCDE1]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE2]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE3]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE4]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE5]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE6]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE7]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE8]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE9]  VARCHAR (25) NULL,
    [STK_SUPSTKCDE10] VARCHAR (25) NULL,
    [STK_SELL_UNIT1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_UNIT10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELL_NAME1]  VARCHAR (20) NULL,
    [STK_SELL_NAME2]  VARCHAR (20) NULL,
    [STK_SELL_NAME3]  VARCHAR (20) NULL,
    [STK_SELL_NAME4]  VARCHAR (20) NULL,
    [STK_SELL_NAME5]  VARCHAR (20) NULL,
    [STK_SELL_NAME6]  VARCHAR (20) NULL,
    [STK_SELL_NAME7]  VARCHAR (20) NULL,
    [STK_SELL_NAME8]  VARCHAR (20) NULL,
    [STK_SELL_NAME9]  VARCHAR (20) NULL,
    [STK_SELL_NAME10] VARCHAR (20) NULL,
    [STK_PRICEMETH1]  VARCHAR (3)  NULL,
    [STK_PRICEMETH2]  VARCHAR (3)  NULL,
    [STK_PRICEMETH3]  VARCHAR (3)  NULL,
    [STK_PRICEMETH4]  VARCHAR (3)  NULL,
    [STK_PRICEMETH5]  VARCHAR (3)  NULL,
    [STK_PRICEMETH6]  VARCHAR (3)  NULL,
    [STK_PRICEMETH7]  VARCHAR (3)  NULL,
    [STK_PRICEMETH8]  VARCHAR (3)  NULL,
    [STK_PRICEMETH9]  VARCHAR (3)  NULL,
    [STK_PRICEMETH10] VARCHAR (3)  NULL,
    [STK_S_PERCENT1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_PERCENT10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SELLPRICE10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRCDE1]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE2]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE3]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE4]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE5]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE6]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE7]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE8]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE9]  VARCHAR (4)  NULL,
    [STK_S_CURRCDE10] VARCHAR (4)  NULL,
    [STK_S_CURRPRC1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_CURRPRC10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SANALYSIS1]  VARCHAR (25) NULL,
    [STK_SANALYSIS2]  VARCHAR (25) NULL,
    [STK_SANALYSIS3]  VARCHAR (25) NULL,
    [STK_SANALYSIS4]  VARCHAR (25) NULL,
    [STK_SANALYSIS5]  VARCHAR (25) NULL,
    [STK_SANALYSIS6]  VARCHAR (25) NULL,
    [STK_SANALYSIS7]  VARCHAR (25) NULL,
    [STK_SANALYSIS8]  VARCHAR (25) NULL,
    [STK_SANALYSIS9]  VARCHAR (25) NULL,
    [STK_SANALYSIS10] VARCHAR (25) NULL,
    [STK_SQTY_FROM1]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM2]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM3]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM4]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM5]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM6]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM7]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM8]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM9]  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_FROM10] FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO1]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO2]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO3]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO4]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO5]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO6]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO7]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO8]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO9]    FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SQTY_TO10]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PRIMARY_2]   FLOAT (53)   NOT NULL,
    CONSTRAINT [STK_PRIMARY_2_PK] PRIMARY KEY CLUSTERED ([STK_PRIMARY_2] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [STKCODE2]
    ON [dbo].[STK_STOCK_2]([STKCODE2] ASC);
