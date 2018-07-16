﻿CREATE TABLE [dbo].[STK_MOVEMENTS] (
    [SM_REFERENCE]                 VARCHAR (10)  NULL,
    [SM_DETAIL]                    VARCHAR (240) NULL,
    [SM_TYPE]                      VARCHAR (1)   NULL,
    [SM_VARIANCE]                  TINYINT       DEFAULT ((0)) NULL,
    [SM_DESCRIPTION]               VARCHAR (30)  NULL,
    [SM_LOCATION]                  VARCHAR (25)  NULL,
    [SM_QUANTITY]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_PRICECODE]                 VARCHAR (3)   NULL,
    [SM_DATE]                      DATETIME      NULL,
    [SM_VALUE]                     FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_VALUE_C]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_ORDER_REF]                 VARCHAR (10)  NULL,
    [SM_ACCOUNT]                   VARCHAR (10)  NULL,
    [SM_PERIODNUM]                 TINYINT       DEFAULT ((0)) NULL,
    [SM_YEAR]                      VARCHAR (1)   NULL,
    [SM_CURRENCY]                  VARCHAR (4)   NULL,
    [SM_QTYUNIT]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_WEIGHT]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_COSTPRICE]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_PRICECODEOUT]              VARCHAR (3)   NULL,
    [SM_DATE_OUT]                  DATETIME      NULL,
    [SM_VALUE_OUT]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_VALUE_OUT_C]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_OUT_REF]                   VARCHAR (10)  NULL,
    [SM_ACCOUNT_OUT]               VARCHAR (10)  NULL,
    [SM_PERIODNUM_SL]              TINYINT       DEFAULT ((0)) NULL,
    [SM_YEAR_SL]                   VARCHAR (1)   NULL,
    [SM_DETAIL_OUT]                VARCHAR (240) NULL,
    [SM_CURRENCY_OUT]              VARCHAR (4)   NULL,
    [SM_TYPE_OUT]                  VARCHAR (1)   NULL,
    [SM_REFERENCEOUT]              VARCHAR (10)  NULL,
    [SM_RESERVEDOUT]               TINYINT       DEFAULT ((0)) NULL,
    [SM_SNO_NOTES]                 VARCHAR (240) NULL,
    [SM_SNO_DATE1]                 DATETIME      NULL,
    [SM_SNO_DATE2]                 DATETIME      NULL,
    [SM_SNO_DATE3]                 DATETIME      NULL,
    [SM_SERIALTRACK]               TINYINT       DEFAULT ((0)) NULL,
    [SM_SERIALNUMBER]              VARCHAR (40)  NULL,
    [SM_LOT_NUMBER]                VARCHAR (20)  NULL,
    [SM_RENEW_DATE]                DATETIME      NULL,
    [SM_SERIAL_VALUE]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_SERIAL_SORT]               VARCHAR (20)  NULL,
    [SM_STK_PERIOD]                TINYINT       DEFAULT ((0)) NULL,
    [SM_STK_YEAR]                  VARCHAR (1)   NULL,
    [SM_LC_LINE]                   TINYINT       DEFAULT ((0)) NULL,
    [SM_UPDATE_LC]                 TINYINT       DEFAULT ((0)) NULL,
    [SM_UPDATE_LC_OUT]             TINYINT       DEFAULT ((0)) NULL,
    [SM_LC_OUT]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_LC_OUT_BASE2]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_CONCAT_SNO]                VARCHAR (46)  NULL,
    [SM_CONCAT_STAT]               VARCHAR (26)  NULL,
    [SM_STATUS]                    VARCHAR (1)   NULL,
    [SM_FIFO_QTY]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_ASSEMBLY]                  TINYINT       DEFAULT ((0)) NULL,
    [SM_ORIGIN]                    VARCHAR (1)   NULL,
    [SM_ARCHIVE]                   TINYINT       DEFAULT ((0)) NULL,
    [SM_BATCH_FLAG]                TINYINT       DEFAULT ((0)) NULL,
    [SM_BATCH_REF]                 VARCHAR (10)  NULL,
    [SM_BATCH_POSTED]              TINYINT       DEFAULT ((0)) NULL,
    [SM_USER_PUTIN]                VARCHAR (4)   NULL,
    [SM_DATE_PUTIN]                DATETIME      NULL,
    [SM_MU_STATUS]                 VARCHAR (1)   NULL,
    [SM_COSTHEADER]                VARCHAR (10)  NULL,
    [SM_COSTCENTRE]                VARCHAR (10)  NULL,
    [SM_STOCK_CODE]                VARCHAR (25)  NULL,
    [SM_PRIMARY]                   FLOAT (53)    NOT NULL,
    [SM_REQUIRED_DATE]             DATETIME      NULL,
    [SM_ORIGIN_OUT]                VARCHAR (1)   NULL,
    [STK_SPCL_TRANTYPE]            VARCHAR (20)  NULL,
    [SM_ORDER_LINK]                INT           NULL,
    [SM_VALUE_BASE2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_VALUE_OUT_BASE2]           FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_COSTPRICE_BASE2]           FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_CARRIER_REF]               VARCHAR (50)  NULL,
    [SM_COMPONENT_LINK]            INT           NULL,
    [SM_PROFIT_COST_TYPE]          VARCHAR (2)   NULL,
    [SM_COSTPRICE_OUT]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_COSTPRICE_BASE2_OUT]       FLOAT (53)    DEFAULT ((0)) NULL,
    [SM_SOURCE]                    VARCHAR (1)   NULL,
    [SM_TRAN_OPTIONS]              VARCHAR (30)  NULL,
    [SM_EXCLUDE_FROM_WEIGHTED_VAL] TINYINT       DEFAULT ((0)) NULL,
    [SM_ANALYSIS]                  VARCHAR (25)  NULL,
    [SM_FIFO_ALLOCATED]            TINYINT       DEFAULT ((0)) NULL,
    [SM_WO_NUMBER]                 INT           NULL,
    [SM_REVERSE_LINK]              INT           NULL,
    [SM_WO_MAT_VALUE]              FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [SM_WO_LAB_VALUE]              FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [SM_QUANTITY_WRITTEN_OFF]      FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [SM_YEAR_LINK]                 SMALLINT      NULL,
    [SM_WFF_APPROVAL_STATUS]       SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [SM_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SM_PRIMARY] ASC),
    CONSTRAINT [SM_YEAR_LINK_CK] CHECK ([SM_YEAR] IS NOT NULL AND (upper([SM_YEAR])='O' OR upper([SM_YEAR])='N' OR upper([SM_YEAR])='C' OR upper([SM_YEAR])='L') AND [SM_YEAR_LINK] IS NOT NULL OR ([SM_YEAR] IS NULL OR (upper([SM_YEAR])='O' OR upper([SM_YEAR])='')) AND [SM_YEAR_LINK] IS NULL),
    CONSTRAINT [SM_YEAR_LINK_FK] FOREIGN KEY ([SM_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY]),
    CONSTRAINT [STK_MOVEMENT_COMPONENT_LINK_FK] FOREIGN KEY ([SM_WO_NUMBER], [SM_COMPONENT_LINK]) REFERENCES [dbo].[WO_COMPONENTS] ([WC_ORDER_NUMBER], [WC_PRIMARY]),
    CONSTRAINT [STK_MOVEMENT_WO_ORDER_LINK_FK] FOREIGN KEY ([SM_WO_NUMBER]) REFERENCES [dbo].[WO_ORDERS] ([WO_ORDER_NUMBER])
);


GO
CREATE NONCLUSTERED INDEX [SM_BATCH_FLAG]
    ON [dbo].[STK_MOVEMENTS]([SM_BATCH_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_BATCH_POSTED]
    ON [dbo].[STK_MOVEMENTS]([SM_BATCH_POSTED] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_CONCAT_STAT]
    ON [dbo].[STK_MOVEMENTS]([SM_CONCAT_STAT] ASC, [SM_FIFO_ALLOCATED] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_COSTHEADER]
    ON [dbo].[STK_MOVEMENTS]([SM_COSTHEADER] ASC, [SM_COSTCENTRE] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_DESCRIPTION]
    ON [dbo].[STK_MOVEMENTS]([SM_DESCRIPTION] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_EXCLUDE_FROM_WEIGHTED_VAL]
    ON [dbo].[STK_MOVEMENTS]([SM_EXCLUDE_FROM_WEIGHTED_VAL] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_LOCATION]
    ON [dbo].[STK_MOVEMENTS]([SM_LOCATION] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_ORDER_LINK]
    ON [dbo].[STK_MOVEMENTS]([SM_ORDER_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_STATUS]
    ON [dbo].[STK_MOVEMENTS]([SM_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_STOCK_CODE]
    ON [dbo].[STK_MOVEMENTS]([SM_STOCK_CODE] ASC, [SM_SERIALNUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [SM_WO_NUMBER]
    ON [dbo].[STK_MOVEMENTS]([SM_WO_NUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_STK_MOVEMENTS_SM_LOCATION_SM_STOCK_CODE]
    ON [dbo].[STK_MOVEMENTS]([SM_LOCATION] ASC, [SM_STOCK_CODE] ASC)
    INCLUDE([SM_PRIMARY]);


GO
CREATE NONCLUSTERED INDEX [IX_STK_MOVEMENTS_SM_STOCK_CODE]
    ON [dbo].[STK_MOVEMENTS]([SM_STOCK_CODE] ASC)
    INCLUDE([SM_REFERENCE], [SM_DETAIL], [SM_TYPE], [SM_VARIANCE], [SM_LOCATION], [SM_QUANTITY], [SM_DATE], [SM_VALUE], [SM_ORDER_REF], [SM_ACCOUNT], [SM_PERIODNUM], [SM_YEAR], [SM_QTYUNIT], [SM_COSTPRICE], [SM_SERIALTRACK], [SM_SERIALNUMBER], [SM_STATUS], [SM_ASSEMBLY], [SM_ORIGIN], [SM_COSTHEADER], [SM_COSTCENTRE], [SM_PRIMARY], [SM_ORDER_LINK], [SM_EXCLUDE_FROM_WEIGHTED_VAL], [SM_ANALYSIS]);


GO
CREATE NONCLUSTERED INDEX [IX_STK_MOVEMENTS_SM_BATCH_FLAG]
    ON [dbo].[STK_MOVEMENTS]([SM_BATCH_FLAG] ASC)
    INCLUDE([SM_TYPE], [SM_QUANTITY], [SM_DATE], [SM_VALUE], [SM_QTYUNIT], [SM_COSTPRICE], [SM_DATE_OUT], [SM_SERIALTRACK], [SM_STATUS], [SM_STOCK_CODE], [SM_PRIMARY]);


GO
CREATE NONCLUSTERED INDEX [SM_YEAR_SM_PERIODNUM_SM_BATCH_FLAG]
    ON [dbo].[STK_MOVEMENTS]([SM_YEAR] ASC, [SM_PERIODNUM] ASC, [SM_BATCH_FLAG] ASC)
    INCLUDE([SM_LOCATION], [SM_QTYUNIT], [SM_QUANTITY], [SM_STATUS], [SM_STOCK_CODE]) WITH (FILLFACTOR = 70);


GO
CREATE TRIGGER [dbo].[aa_stk_mov_dt]
    ON [dbo].[STK_MOVEMENTS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END
