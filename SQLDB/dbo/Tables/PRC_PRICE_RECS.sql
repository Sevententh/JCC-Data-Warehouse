CREATE TABLE [dbo].[PRC_PRICE_RECS] (
    [PRCODE]                 VARCHAR (16) NULL,
    [PRNAME]                 VARCHAR (40) NULL,
    [PR_TYPE]                VARCHAR (1)  NULL,
    [PR_TEXT]                TEXT         NULL,
    [PR_DEL_ITEM]            TINYINT      DEFAULT ((0)) NULL,
    [PR_PRICE]               FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_PRICE_C]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_BASE_COST]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVALUE]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVALUE]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_1]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_2]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_3]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_S_ANALYSIS]          VARCHAR (25) NULL,
    [PR_P_ANALYSIS]          VARCHAR (25) NULL,
    [PR_EMPLOYEE_CODE]       VARCHAR (10) NULL,
    [PR_PAYTYPE_LIST]        TINYINT      DEFAULT ((0)) NULL,
    [PR_CURRENCY]            VARCHAR (4)  NULL,
    [PR_SALEVAL_4]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_5]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_6]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_7]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_8]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_9]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_10]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_11]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_ARCHIVE]             TINYINT      DEFAULT ((0)) NULL,
    [PR_NOTES]               TEXT         NULL,
    [PR_SALEVAL_12]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_13]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_MATRIX_KEY]          VARCHAR (20) NULL,
    [PR_SORT_KEY]            VARCHAR (20) NULL,
    [PR_SORT_KEY1]           VARCHAR (20) NULL,
    [PR_SORT_KEY2]           VARCHAR (20) NULL,
    [PR_SORT_KEY3]           VARCHAR (20) NULL,
    [PR_SORT_KEY4]           VARCHAR (20) NULL,
    [PR_SORT_KEY5]           VARCHAR (20) NULL,
    [PR_SORT_KEY6]           VARCHAR (20) NULL,
    [PR_DATE_USER1]          DATETIME     NULL,
    [PR_DATE_USER2]          DATETIME     NULL,
    [PR_DATE_USER3]          DATETIME     NULL,
    [PR_EC_KILOS]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_EC_ORIGIN]           VARCHAR (3)  NULL,
    [PR_EC_COM_CODE]         VARCHAR (8)  NULL,
    [PR_EC_SUP_UNIT]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O1]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O3]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O4]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O5]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O6]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O7]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O8]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O9]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O10]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O11]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O12]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_O13]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L1]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L3]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L4]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L5]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L6]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L7]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L8]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L9]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L10]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L11]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L12]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_L13]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C1]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C3]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C4]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C5]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C6]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C7]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C8]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C9]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C10]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C11]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C12]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_C13]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_PTD]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_YTD]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER_LY]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TURNOVER]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_PTD]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_YTD]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_PTD]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SALEVAL_YTD]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_PTD]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_YTD]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_LY]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QUANTITY]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_INC_LIVE_PTD]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_INC_LIVE_YTD]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_INC_LIVE_TOT]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_1]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_INC_ESTM_TOT]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_2]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_3]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_4]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_5]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_6]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_7]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_8]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_9]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_10]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_11]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_12]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COSTVAL_13]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_1]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_2]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_3]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_4]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_5]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_6]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_7]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_8]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_9]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_10]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V1]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V2]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V3]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V4]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V5]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V6]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V7]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V8]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V9]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_V10]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P1]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P2]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P3]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P4]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P5]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P6]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P7]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P8]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P9]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_P10]          FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V1]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V3]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V4]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V5]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V6]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V7]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V8]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V9]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_UPLIFT_C_V10]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_CURR_1]              VARCHAR (6)  NULL,
    [PR_CURR_2]              VARCHAR (6)  NULL,
    [PR_CURR_3]              VARCHAR (6)  NULL,
    [PR_CURR_4]              VARCHAR (6)  NULL,
    [PR_CURR_5]              VARCHAR (6)  NULL,
    [PR_CURR_6]              VARCHAR (6)  NULL,
    [PR_CURR_7]              VARCHAR (6)  NULL,
    [PR_CURR_8]              VARCHAR (6)  NULL,
    [PR_CURR_9]              VARCHAR (6)  NULL,
    [PR_CURR_10]             VARCHAR (6)  NULL,
    [PR_COST_C_1]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_2]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_3]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_4]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_5]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_6]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_7]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_8]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_9]            FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_COST_C_10]           FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O1]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O2]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O3]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O4]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O5]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O6]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O7]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O8]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O9]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O10]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O11]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O12]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_O13]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L1]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L2]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L3]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L4]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L5]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L6]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L7]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L8]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L9]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L10]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L11]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L12]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_L13]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C1]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C2]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C3]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C4]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C5]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C6]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C7]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C8]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C9]              FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C10]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C11]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C12]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_QTY_C13]             FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_USER_EDITED]         VARCHAR (4)  NULL,
    [PR_USER_PUTIN]          VARCHAR (4)  NULL,
    [PR_DATE_PUTIN]          DATETIME     NULL,
    [PR_DATE_EDITED]         DATETIME     NULL,
    [PR_MU_STATUS]           VARCHAR (1)  NULL,
    [PR_USED]                TINYINT      DEFAULT ((0)) NULL,
    [PR_NO_TAX]              TINYINT      DEFAULT ((0)) NULL,
    [PR_PRIMARY]             FLOAT (53)   NOT NULL,
    [PR_RTP_FLAG]            TINYINT      DEFAULT ((0)) NULL,
    [PR_LEVEL]               INT          DEFAULT ((0)) NULL,
    [PR_GROUP]               VARCHAR (10) NULL,
    [PR_PRICE_BASE2]         FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_BASE_COST_BASE2]     FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_SOURCE]              VARCHAR (1)  NULL,
    [PR_NOMINAL]             VARCHAR (25) NULL,
    [PR_ISSUE_ANALYSIS]      VARCHAR (25) NULL,
    [PR_WRITE_OFF_ANALYSIS]  VARCHAR (25) NULL,
    [PR_PERSON_LINK]         INT          NULL,
    [PR_DO_NOT_USE]          BIT          DEFAULT ((0)) NULL,
    [PR_TARGET_HOURS]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TARGET_VALUE]        FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TIMESHEET_UNITS]     FLOAT (53)   DEFAULT ((0)) NULL,
    [PR_TIMESHEET_UNIT_TYPE] VARCHAR (1)  NULL,
    [PR_REVERSE_CHRGE_VAT]   TINYINT      DEFAULT ((0)) NULL,
    [PR_SERVICE]             BIT          DEFAULT ((0)) NOT NULL,
    [PR_EC_SUP_UNIT_TYPE]    VARCHAR (20) NULL,
    CONSTRAINT [PR_PRIMARY_PK] PRIMARY KEY CLUSTERED ([PR_PRIMARY] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRCODE]
    ON [dbo].[PRC_PRICE_RECS]([PRCODE] ASC)
    INCLUDE([PRNAME], [PR_SORT_KEY]) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [PRNAME]
    ON [dbo].[PRC_PRICE_RECS]([PRNAME] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_EMPLOYEE_CODE]
    ON [dbo].[PRC_PRICE_RECS]([PR_EMPLOYEE_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_MATRIX_KEY]
    ON [dbo].[PRC_PRICE_RECS]([PR_MATRIX_KEY] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_SORT_KEY]
    ON [dbo].[PRC_PRICE_RECS]([PR_SORT_KEY] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_SORT_KEY1]
    ON [dbo].[PRC_PRICE_RECS]([PR_SORT_KEY1] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_SORT_KEY2]
    ON [dbo].[PRC_PRICE_RECS]([PR_SORT_KEY2] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_SORT_KEY3]
    ON [dbo].[PRC_PRICE_RECS]([PR_SORT_KEY3] ASC);


GO
CREATE NONCLUSTERED INDEX [PR_TYPE]
    ON [dbo].[PRC_PRICE_RECS]([PR_TYPE] ASC);


GO
CREATE TRIGGER [dbo].[aa_prc_price_dt]
    ON [dbo].[PRC_PRICE_RECS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

