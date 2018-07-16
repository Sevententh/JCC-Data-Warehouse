CREATE TABLE [dbo].[CST_DETAIL] (
    [CT_NETT]                         FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_VAT]                          FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_VATCODE]                      VARCHAR (4)   NULL,
    [CT_GROSS]                        FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_QUANTITY]                     FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_PRICE]                        FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CENTRE_UPLV]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CENTRE_UPLP]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CC_UPLTYPE]                   TINYINT       DEFAULT ((0)) NULL,
    [CT_BATCH_POSTED]                 TINYINT       DEFAULT ((0)) NULL,
    [CT_BATCH_FLAG]                   TINYINT       DEFAULT ((0)) NULL,
    [CT_INVOICE_FLAG]                 TINYINT       DEFAULT ((0)) NULL,
    [CT_BATCH_REF]                    VARCHAR (10)  NULL,
    [CT_ARCHIVE_FLG]                  TINYINT       DEFAULT ((0)) NULL,
    [CT_UPDATE_USER1]                 TINYINT       DEFAULT ((0)) NULL,
    [CT_UPDATE_USER2]                 TINYINT       DEFAULT ((0)) NULL,
    [CT_TRANTYPE]                     VARCHAR (3)   NULL,
    [CT_STATUS]                       VARCHAR (1)   NULL,
    [CT_HEADER_REF]                   VARCHAR (25)  NULL,
    [CT_POSTTYPE]                     VARCHAR (1)   NULL,
    [CT_PUTIN_LEDGER]                 VARCHAR (3)   NULL,
    [CT_SORTTYPE]                     VARCHAR (6)   NULL,
    [CT_DATE]                         DATETIME      NULL,
    [CT_DETAIL]                       VARCHAR (240) NULL,
    [CT_DESCRIPTION]                  VARCHAR (20)  NULL,
    [CT_BANK_CONTRA]                  TINYINT       DEFAULT ((0)) NULL,
    [CT_CURR_CODE]                    VARCHAR (4)   NULL,
    [CT_CURR_RATE]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CURR_VALUE]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CURR_RTEFLG]                  TINYINT       DEFAULT ((0)) NULL,
    [CT_CURR_PRICE]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CURR_CNTUPLV]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_RES_UPLV]                     FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CURR_RESUPLV]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_RES_UPLP]                     FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_RESLINE]                      INT           DEFAULT ((0)) NULL,
    [CT_PERIODNUMBR]                  TINYINT       DEFAULT ((0)) NULL,
    [CT_YEAR]                         VARCHAR (1)   NULL,
    [CT_WEEK_NO]                      TINYINT       DEFAULT ((0)) NULL,
    [CT_USER_PUTIN]                   VARCHAR (4)   NULL,
    [CT_DATE_PUTIN]                   DATETIME      NULL,
    [CT_MU_STATUS]                    VARCHAR (1)   NULL,
    [CT_EMPCODE]                      VARCHAR (10)  NULL,
    [CT_PAYTYPE_CODE]                 VARCHAR (20)  NULL,
    [CT_PAYROLL_FLAG]                 TINYINT       DEFAULT ((0)) NULL,
    [CT_STOCKCODE]                    VARCHAR (25)  NULL,
    [CT_RESOURCE]                     VARCHAR (16)  NULL,
    [CT_NOMINAL]                      VARCHAR (25)  NULL,
    [CT_ACCOUNT]                      VARCHAR (10)  NULL,
    [CT_ANALYSIS]                     VARCHAR (25)  NULL,
    [CT_COSTHEADER]                   VARCHAR (10)  NULL,
    [CT_COSTCENTRE]                   VARCHAR (10)  NULL,
    [CT_TRANSACTION_LINK]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_PRIMARY]                      FLOAT (53)    NOT NULL,
    [CT_SOURCE]                       VARCHAR (1)   NULL,
    [CT_TRAN_OPTIONS]                 VARCHAR (30)  NULL,
    [CT_HEADER_LINK]                  VARCHAR (20)  NULL,
    [CT_INVOICE_ANALYSIS_LINK]        INT           NULL,
    [CT_TIMETABLE_ANALYSIS_LINK]      INT           NULL,
    [CT_COST_ANALYSIS_LINK]           INT           NULL,
    [CT_TRANSACTION_SUBTYPE_LINK]     INT           NULL,
    [CT_RESOURCE_MARGIN_PC]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_RESOURCE_MARGIN_VALUE]        FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CC_MARGIN_PC]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CC_MARGIN_VALUE]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_USER_KEY1]                    VARCHAR (20)  NULL,
    [CT_USER_KEY2]                    VARCHAR (20)  NULL,
    [CT_USER_KEY3]                    VARCHAR (20)  NULL,
    [CT_ALLOCATED]                    BIT           DEFAULT ((0)) NOT NULL,
    [CT_UNRECOV_VALUE]                FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_EXTRA_WORK_VALUE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_VALUE_INVOICED]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_TIME_UNITS]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_TIME_UNIT_TYPE]               VARCHAR (1)   NULL,
    [CT_ORDER_DETAIL_LINK]            INT           NULL,
    [CT_UNRECOV_QUANTITY]             FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_EXTRA_WORK_QUANTITY]          FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_QUANTITY_INVOICED]            FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_UNRECOV_VALUE_C]              FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_EXTRA_WORK_VALUE_C]           FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_CURR_CC_MARGIN_VALUE]         FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CURR_RESOURCE_MARGIN_VALUE]   FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_FLAT_RATE]                    BIT           DEFAULT ((0)) NULL,
    [CT_SALES_PRICE]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CURR_SALES_PRICE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_TIME_UNIT_QUANTITY]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CT_CC_MARGIN_TYPE]               TINYINT       DEFAULT ((0)) NULL,
    [CT_CURR_CC_UPLIFT_UNIT_VAL]      FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_INVOICEABLE_VALUE_CALC_OPT]   BIT           DEFAULT ((1)) NOT NULL,
    [CT_CURR_CC_MARGIN_UNIT_VAL]      FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CT_YEAR_LINK]                    SMALLINT      NULL,
    [CT_WFF_APPROVAL_STATUS]          SMALLINT      DEFAULT ((0)) NULL,
    [CT_UPLIFTED_UNIT_COST]           AS            (([dbo].[AA_PRICE_DPS_F]([CT_PRICE])+[dbo].[AA_PRICE_DPS_F]([CT_RES_UPLV]))+[dbo].[AA_PRICE_DPS_F](case [CT_CC_UPLTYPE] when (0) then ([dbo].[AA_PRICE_DPS_F]([CT_PRICE])*[dbo].[AA_TWO_DPS_F]([CT_CENTRE_UPLP]))/(100) else [CT_CENTRE_UPLP] end)),
    [CT_UPLIFTED_UNIT_COST_C]         AS            (([dbo].[AA_VALUE_DPS_F]([CT_CURR_PRICE])+[dbo].[AA_PRICE_DPS_F]([CT_CURR_RESUPLV]))+[dbo].[AA_PRICE_DPS_F](case [CT_CC_UPLTYPE] when (0) then ([dbo].[AA_PRICE_DPS_F]([CT_CURR_PRICE])*[dbo].[AA_TWO_DPS_F]([CT_CENTRE_UPLP]))/(100) else [CT_CURR_CC_UPLIFT_UNIT_VAL] end)),
    [CT_UPLIFTED_COST]                AS            (([dbo].[AA_VALUE_DPS_F]([CT_NETT])+[dbo].[AA_VALUE_DPS_F]([CT_CENTRE_UPLV]))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_RES_UPLV])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end))),
    [CT_UPLIFTED_COST_C]              AS            (([dbo].[AA_VALUE_DPS_F]([CT_CURR_VALUE])+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CNTUPLV]))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_CURR_RESUPLV])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end))),
    [CT_ORIGINAL_INVOICEABLE_VALUE]   AS            (case [CT_PUTIN_LEDGER] when 'CST' then case [CT_TRANTYPE] when 'TIM' then case [CT_FLAT_RATE] when (1) then [dbo].[AA_PRICE_DPS_F]([CT_SALES_PRICE]) else case [CT_INVOICEABLE_VALUE_CALC_OPT] when (0) then ([dbo].[AA_VALUE_DPS_F]([CT_NETT])+[dbo].[AA_VALUE_DPS_F]([CT_CC_MARGIN_VALUE]))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_RESOURCE_MARGIN_VALUE])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end)) else ((([dbo].[AA_VALUE_DPS_F]([CT_NETT])+[dbo].[AA_VALUE_DPS_F]([CT_CC_MARGIN_VALUE]))+[dbo].[AA_VALUE_DPS_F]([CT_CENTRE_UPLV]))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_RESOURCE_MARGIN_VALUE])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end)))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_RES_UPLV])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end)) end end else case [CT_INVOICEABLE_VALUE_CALC_OPT] when (0) then [dbo].[AA_VALUE_DPS_F]([CT_NETT])+[dbo].[AA_VALUE_DPS_F]([CT_CC_MARGIN_VALUE]) else ([dbo].[AA_VALUE_DPS_F]([CT_NETT])+[dbo].[AA_VALUE_DPS_F]([CT_CC_MARGIN_VALUE]))+[dbo].[AA_VALUE_DPS_F]([CT_CENTRE_UPLV]) end end else [dbo].[AA_VALUE_DPS_F]([CT_NETT])+[dbo].[AA_VALUE_DPS_F]([CT_CENTRE_UPLV]) end),
    [CT_ORIGINAL_INVOICEABLE_VALUE_C] AS            (case [CT_PUTIN_LEDGER] when 'CST' then case [CT_TRANTYPE] when 'TIM' then case [CT_FLAT_RATE] when (1) then [dbo].[AA_PRICE_DPS_F]([CT_CURR_SALES_PRICE]) else case [CT_INVOICEABLE_VALUE_CALC_OPT] when (0) then ([dbo].[AA_VALUE_DPS_F]([CT_CURR_VALUE])+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CC_MARGIN_VALUE]))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_CURR_RESOURCE_MARGIN_VALUE])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end)) else ((([dbo].[AA_VALUE_DPS_F]([CT_CURR_VALUE])+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CC_MARGIN_VALUE]))+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CNTUPLV]))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_CURR_RESOURCE_MARGIN_VALUE])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end)))+[dbo].[AA_VALUE_DPS_F]([dbo].[AA_PRICE_DPS_F]([CT_CURR_RESUPLV])*[dbo].[AA_QUANTITY_DPS_F](case when isnull([CT_QUANTITY],(0))=(0) then (1) else [CT_QUANTITY] end)) end end else case [CT_INVOICEABLE_VALUE_CALC_OPT] when (0) then [dbo].[AA_VALUE_DPS_F]([CT_CURR_VALUE])+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CC_MARGIN_VALUE]) else ([dbo].[AA_VALUE_DPS_F]([CT_CURR_VALUE])+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CC_MARGIN_VALUE]))+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CNTUPLV]) end end else [dbo].[AA_VALUE_DPS_F]([CT_CURR_VALUE])+[dbo].[AA_VALUE_DPS_F]([CT_CURR_CNTUPLV]) end),
    CONSTRAINT [CT_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CT_PRIMARY] ASC),
    CONSTRAINT [CT_YEAR_LINK_CK] CHECK ([CT_YEAR] IS NOT NULL AND (upper([CT_YEAR])='O' OR upper([CT_YEAR])='N' OR upper([CT_YEAR])='C' OR upper([CT_YEAR])='L') AND [CT_YEAR_LINK] IS NOT NULL OR ([CT_YEAR] IS NULL OR (upper([CT_YEAR])='O' OR upper([CT_YEAR])='')) AND [CT_YEAR_LINK] IS NULL),
    CONSTRAINT [CST_DETAIL_TRANSACTION_SUBTYPE_LINK_FK] FOREIGN KEY ([CT_TRANSACTION_SUBTYPE_LINK]) REFERENCES [dbo].[CST_TRANSACTION_SUBTYPE] ([CTT_PRIMARY]),
    CONSTRAINT [CT_YEAR_LINK_FK] FOREIGN KEY ([CT_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [CT_BATCH_FLAG]
    ON [dbo].[CST_DETAIL]([CT_BATCH_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_BATCH_POSTED]
    ON [dbo].[CST_DETAIL]([CT_BATCH_POSTED] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_COSTCENTRE]
    ON [dbo].[CST_DETAIL]([CT_COSTCENTRE] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_COSTHEADER]
    ON [dbo].[CST_DETAIL]([CT_COSTHEADER] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_INVOICE_FLAG]
    ON [dbo].[CST_DETAIL]([CT_INVOICE_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_PAYROLL_FLAG]
    ON [dbo].[CST_DETAIL]([CT_PAYROLL_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_RESLINE]
    ON [dbo].[CST_DETAIL]([CT_RESLINE] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_RESOURCE]
    ON [dbo].[CST_DETAIL]([CT_RESOURCE] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_SORTTYPE]
    ON [dbo].[CST_DETAIL]([CT_SORTTYPE] ASC);


GO
CREATE NONCLUSTERED INDEX [CT_HEADER_LINK]
    ON [dbo].[CST_DETAIL]([CT_HEADER_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CT_TRANSACTION_LINK]
    ON [dbo].[CST_DETAIL]([CT_TRANSACTION_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE TRIGGER [dbo].[aa_cst_tran_dt_t]
    ON [dbo].[CST_DETAIL]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

