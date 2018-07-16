CREATE TABLE [dbo].[STK_STOCK] (
    [STKCODE]                      VARCHAR (25) NULL,
    [STKNAME]                      VARCHAR (80) NULL,
    [STK_OLDCODE]                  VARCHAR (25) NULL,
    [STK_NOTES]                    TEXT         NULL,
    [STK_CURRENCY]                 VARCHAR (4)  NULL,
    [STK_MIN_QTY]                  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MAX_QTY]                  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_PHYSICAL]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_RESERVE_OUT]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_ORDER_IN]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_QTYPRINTED]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BASEPRICE]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BASEPRICE_C]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTPRICE_C]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVALUE]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVALUE]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_AV_VALU]                  FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_AV_VALU_C]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_FIFO_VALU]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_FIFO_VALU_C]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_VALUEMETHOD]              VARCHAR (1)  NULL,
    [STK_AN_DEL_QTY]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_AN_DEL_DATE]              DATETIME     NULL,
    [STK_RESERVE_ASM]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SERIALTRACK]              TINYINT      DEFAULT ((0)) NULL,
    [STK_MULTILOCATN]              TINYINT      DEFAULT ((0)) NULL,
    [STK_ASSEMBLY]                 VARCHAR (1)  NULL,
    [STK_PRICEMETHOD]              VARCHAR (1)  NULL,
    [STK_ARCHIVE]                  TINYINT      DEFAULT ((0)) NULL,
    [STK_STNDRD_COST]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_FIFO_POINTR]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_FIFO_QTY]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MATRIX_KEY]               VARCHAR (20) NULL,
    [STK_SORT_KEY]                 VARCHAR (20) NULL,
    [STK_SORT_KEY2]                VARCHAR (20) NULL,
    [STK_SORT_KEY3]                VARCHAR (20) NULL,
    [STK_SORT_KEY1]                VARCHAR (20) NULL,
    [STK_S_WEIGHT]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_P_WEIGHT]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_S_WGHT_NAME]              VARCHAR (20) NULL,
    [STK_P_WGHT_NAME]              VARCHAR (20) NULL,
    [STK_EC_KILOS]                 FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_EC_ORIGIN]                VARCHAR (3)  NULL,
    [STK_EC_COM_CODE]              VARCHAR (8)  NULL,
    [STK_EC_SUP_UNIT]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_O13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O1]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O2]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O3]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O4]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O5]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O6]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O7]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O8]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O9]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O10]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O11]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O12]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_O13]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_L13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L1]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L2]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L3]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L4]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L5]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L6]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L7]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L8]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L9]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L10]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L11]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L12]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_L13]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_C13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C1]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C2]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C3]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C4]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C5]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C6]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C7]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C8]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C9]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C10]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C11]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C12]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_C13]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_PTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_YTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_PTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_YTD]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_COSTVAL_13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_SALEVAL_13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_WAPU_QUANTITY]            FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_WAPU_VALUE]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BARCODE]                  VARCHAR (20) NULL,
    [STK_ISSUE_ANALYSIS]           VARCHAR (25) NULL,
    [STK_WRITE_OFF_ANALYSIS]       VARCHAR (25) NULL,
    [STK_SCRAP_ANALYSIS]           VARCHAR (25) NULL,
    [STK_FINISHED_ANALYSIS]        VARCHAR (25) NULL,
    [STK_WO_ALLOC_QUANTITY]        FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_WO_UNALLOC_QUANTITY]      FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_WO_WIP_SOP_QUANTITY]      FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_WO_FREE_WIP_QUANTITY]     FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BOM_DEFAULT_ACTION]       VARCHAR (1)  NULL,
    [STK_BOM_MIN_BUILD_QUANTITY]   FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BOM_BATCH_QUANTITY]       FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BOM_ROUTE_LINK]           INT          NULL,
    [STK_BOM_DURATION]             FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_BOM_NOTES]                TEXT         NULL,
    [STK_BOM_COMPLETION_CERT]      VARCHAR (30) NULL,
    [STK_USER_EDITED]              VARCHAR (4)  NULL,
    [STK_USER_PUTIN]               VARCHAR (4)  NULL,
    [STK_DATE_PUTIN]               DATETIME     NULL,
    [STK_DATE_EDITED]              DATETIME     NULL,
    [STK_MU_STATUS]                VARCHAR (1)  NULL,
    [STK_WWW_PUBLISH]              TINYINT      DEFAULT ((0)) NULL,
    [STK_SPECIAL_PRICE_DATE]       DATETIME     NULL,
    [STK_USED]                     TINYINT      DEFAULT ((0)) NULL,
    [STK_NO_TAX]                   TINYINT      DEFAULT ((0)) NULL,
    [STK_PRIMARY]                  FLOAT (53)   NOT NULL,
    [STK_RTP_FLAG]                 TINYINT      DEFAULT ((0)) NULL,
    [STK_LINK_FLAG]                TINYINT      DEFAULT ((0)) NULL,
    [STK_ALTERNATIVE_FLAG]         TINYINT      DEFAULT ((0)) NULL,
    [STK_LEVEL]                    INT          DEFAULT ((0)) NULL,
    [STK_GROUP]                    VARCHAR (15) NULL,
    [STK_WARRANTY]                 TINYINT      DEFAULT ((0)) NULL,
    [STK_WARRANTY_TYPE]            VARCHAR (15) NULL,
    [STK_BIN_NUMBER]               VARCHAR (15) NULL,
    [STK_TEMPLATE]                 TINYINT      DEFAULT ((0)) NULL,
    [STK_SOURCE]                   VARCHAR (1)  NULL,
    [STK_BACK_ORDER_QTY]           FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_POP_ANALYSIS]             VARCHAR (25) NULL,
    [STK_ANALYSIS_OUT]             VARCHAR (25) NULL,
    [STK_ANALYSIS_IN]              VARCHAR (25) NULL,
    [STK_SOP_ANALYSIS]             VARCHAR (25) NULL,
    [STK_MOVEIN_N1]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N2]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N3]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N4]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N5]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N6]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N7]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N8]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N9]                FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N10]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N11]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N12]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEIN_N13]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N1]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N2]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N3]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N4]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N5]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N6]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N7]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N8]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N9]               FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N10]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N11]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N12]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_MOVEOUT_N13]              FLOAT (53)   DEFAULT ((0)) NULL,
    [STK_FIXED_WEIGHTED]           TINYINT      DEFAULT ((0)) NOT NULL,
    [STK_REVERSE_CHRGE_VAT]        TINYINT      DEFAULT ((0)) NULL,
    [STK_DO_NOT_USE]               TINYINT      DEFAULT ((0)) NOT NULL,
    [STK_ZERO_PHYSICAL]            TINYINT      DEFAULT ((0)) NOT NULL,
    [STK_SERVICE]                  BIT          DEFAULT ((0)) NOT NULL,
    [STK_EC_SUP_UNIT_TYPE]         VARCHAR (20) NULL,
    [STK_FACET_TEMPLATE_FLAG]      BIT          DEFAULT ((0)) NOT NULL,
    [STK_FACET_PRODUCT_GROUP_LINK] INT          NULL,
    [STK_FACET_TEMPLATE_LINK]      FLOAT (53)   NULL,
    CONSTRAINT [STK_PRIMARY_PK] PRIMARY KEY CLUSTERED ([STK_PRIMARY] ASC),
    CONSTRAINT [STK_FACET_PRODUCT_GROUP_LINK_FK] FOREIGN KEY ([STK_FACET_PRODUCT_GROUP_LINK]) REFERENCES [dbo].[STK_FACET_PRODUCT_GROUP] ([SFPG_PRIMARY]),
    CONSTRAINT [STK_FACET_TEMPLATE_LINK_FK] FOREIGN KEY ([STK_FACET_TEMPLATE_LINK]) REFERENCES [dbo].[STK_STOCK] ([STK_PRIMARY]),
    CONSTRAINT [STK_STOCK_BOM_ROUTE_LINK_FK] FOREIGN KEY ([STK_BOM_ROUTE_LINK]) REFERENCES [dbo].[WO_ROUTES] ([WR_PRIMARY])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [STKCODE]
    ON [dbo].[STK_STOCK]([STKCODE] ASC)
    INCLUDE([STKNAME], [STK_MULTILOCATN], [STK_SORT_KEY], [STK_SORT_KEY1], [STK_SORT_KEY2], [STK_SORT_KEY3]) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [STKNAME]
    ON [dbo].[STK_STOCK]([STKNAME] ASC);


GO
CREATE NONCLUSTERED INDEX [STK_SORT_KEY]
    ON [dbo].[STK_STOCK]([STK_SORT_KEY] ASC);


GO
CREATE NONCLUSTERED INDEX [STK_SORT_KEY1]
    ON [dbo].[STK_STOCK]([STK_SORT_KEY1] ASC);


GO
CREATE NONCLUSTERED INDEX [STK_SORT_KEY2]
    ON [dbo].[STK_STOCK]([STK_SORT_KEY2] ASC);


GO
CREATE NONCLUSTERED INDEX [STK_SORT_KEY3]
    ON [dbo].[STK_STOCK]([STK_SORT_KEY3] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_STK_STOCK_STK_DO_NOT_USE_STKCODE]
    ON [dbo].[STK_STOCK]([STK_DO_NOT_USE] ASC, [STKCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [STK_FACET_PRODUCT_GROUP_LINK]
    ON [dbo].[STK_STOCK]([STK_FACET_PRODUCT_GROUP_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [STK_FACET_TEMPLATE_LINK]
    ON [dbo].[STK_STOCK]([STK_FACET_TEMPLATE_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE TRIGGER [dbo].[AA_STK_RECORD_DELETE_T]
    ON [dbo].[STK_STOCK]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
CREATE TRIGGER [dbo].[AA_STK_STKCODE_UPD_T]
    ON [dbo].[STK_STOCK]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger [dbo].delta_integration_Stock_TR
ON [dbo].STK_STOCK
AFTER INSERT,UPDATE
AS
BEGIN
if not(update(STK_DATE_EDITED))
return
DECLARE @body XML (document delta_integration_XMLSchema)
DECLARE @i_id int;
DECLARE @d_id int;
DECLARE @i_date datetime;
DECLARE @d_date datetime;
DECLARE working_cursor CURSOR FORWARD_ONLY FOR SELECT
i.STK_PRIMARY,d.STK_PRIMARY,i.STK_DATE_EDITED,d.STK_DATE_EDITED
from inserted i LEFT JOIN deleted d ON i.STK_PRIMARY=d.STK_PRIMARY;
OPEN working_cursor
FETCH NEXT FROM working_cursor INTO @i_id,@d_id,@i_date,@d_date
WHILE @@FETCH_STATUS=0
BEGIN
IF (@d_date IS NULL or @i_date <> @d_date)
BEGIN
SELECT @body=(
SELECT (
SELECT
CONVERT(int,@i_id) AS "@WMSI_ID",
'STK' AS "@WMSI_TYPE"
FOR XML PATH ('delta_integration'),TYPE
) FOR XML PATH ('Root'), TYPE
);
EXEC [dbo].delta_integration_Send @body
END;
FETCH NEXT FROM working_cursor INTO @i_id,@d_id,@i_date,@d_date
END;
CLOSE working_cursor;
DEALLOCATE working_cursor;
END;
