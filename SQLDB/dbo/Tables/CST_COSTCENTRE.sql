CREATE TABLE [dbo].[CST_COSTCENTRE] (
    [CC_CODE]                   VARCHAR (10)  NULL,
    [CC_NAME]                   VARCHAR (40)  NULL,
    [CC_DESCRIPTION]            VARCHAR (80)  NULL,
    [CC_USED]                   TINYINT       DEFAULT ((0)) NULL,
    [CC_STATUS]                 VARCHAR (1)   NULL,
    [CC_CHRG_RATE]              VARCHAR (1)   NULL,
    [CC_CHRG_VALUE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_CHRG_LINE]              INT           DEFAULT ((0)) NULL,
    [CC_ANALYSIS]               VARCHAR (25)  NULL,
    [CC_SORT]                   VARCHAR (20)  NULL,
    [CC_USER_SUBTOT]            VARCHAR (20)  NULL,
    [CC_LEVEL]                  TINYINT       DEFAULT ((0)) NULL,
    [CC_LEVELPOINTER]           VARCHAR (14)  NULL,
    [CC_LEVELSEQ]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_TIME_QTY_B]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_TIME_QTY_A]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_INVTD]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_PAYTD]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_OBUDG1]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_RBUDG2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_ACTUAL_COST]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COMITT_COST]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_USER_COST1]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_USER_COST2]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_RESUPV]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_UPLIFTP]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_CNTUPV]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_BUDGET_REVISED]         TINYINT       DEFAULT ((0)) NULL,
    [CC_SALE_OBUDG1]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_SALE_RBUDG2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_ACTUAL_SALES]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COMITT_SALES]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_USER_SALES1]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_USER_SALES2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_SALE_RESUPV]            FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_SALE_UPLIFTP]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_SALE_PAYTD]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_SALE_VAT]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_SALE_INVTD]             FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_CNT_OBDG_UPV]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_RES_OBDG_UPV]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_CNT_RBDG_UPV]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_RES_RBDG_UPV]           FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_DATE_REQ]               DATETIME      NULL,
    [CC_DATE_INV]               DATETIME      NULL,
    [CC_DATE_PAY]               DATETIME      NULL,
    [CC_DURATION]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_DUR_TYPE]               VARCHAR (1)   NULL,
    [CC_UPLIFT_TYPE]            TINYINT       DEFAULT ((0)) NULL,
    [CC_NOTES]                  VARCHAR (240) NULL,
    [CC_COST_O_1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_3]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_4]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_5]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_6]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_7]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_8]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_9]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_10]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_11]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_12]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_O_13]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_3]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_4]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_5]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_6]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_7]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_8]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_9]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_10]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_11]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_12]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_L_13]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_3]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_4]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_5]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_6]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_7]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_8]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_9]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_10]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_11]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_12]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_COST_C_13]              FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_BUDG_O_1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [CC_USER_EDITED]            VARCHAR (4)   NULL,
    [CC_DATE_EDITED]            DATETIME      NULL,
    [CC_USER_PUTIN]             VARCHAR (4)   NULL,
    [CC_DATE_PUTIN]             DATETIME      NULL,
    [CC_MU_STATUS]              VARCHAR (1)   NULL,
    [CC_CONCAT_CODES]           VARCHAR (20)  NULL,
    [CC_COPYHEADER]             VARCHAR (10)  NULL,
    [CC_PRIMARY]                FLOAT (53)    NOT NULL,
    [CC_SOURCE]                 VARCHAR (1)   NULL,
    [CC_PURCHASE_ANALYSIS_LINK] INT           NULL,
    [CC_CATEGORY]               VARCHAR (1)   NULL,
    [CC_TYPE]                   TINYINT       DEFAULT ((0)) NOT NULL,
    [CC_MARGIN_TYPE]            TINYINT       DEFAULT ((0)) NOT NULL,
    [CC_MARGIN_VALUE]           FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CC_MARGIN_PC]              FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CC_DO_NOT_USE]             BIT           DEFAULT ((0)) NULL,
    [CC_WIP]                    FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CC_SALES_WIP]              FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [CC_ALLOW_QTY_BUDGETS]      BIT           DEFAULT ((0)) NOT NULL,
    [CC_SECURITY_LEVEL]         INT           DEFAULT ((0)) NOT NULL,
    [CC_ACLOUD_SYNCED]          BIT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [CC_PRIMARY_PK] PRIMARY KEY CLUSTERED ([CC_PRIMARY] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_CODE]
    ON [dbo].[CST_COSTCENTRE]([CC_CODE] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CC_CONCAT_CODES]
    ON [dbo].[CST_COSTCENTRE]([CC_CONCAT_CODES] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CC_COPYHEADER]
    ON [dbo].[CST_COSTCENTRE]([CC_COPYHEADER] ASC, [CC_CODE] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [CC_STATUS]
    ON [dbo].[CST_COSTCENTRE]([CC_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [CC_USER_SUBTOT]
    ON [dbo].[CST_COSTCENTRE]([CC_USER_SUBTOT] ASC);


GO
CREATE TRIGGER [dbo].[aa_costcentre_dt]
    ON [dbo].[CST_COSTCENTRE]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
CREATE TRIGGER [dbo].[AA_CST_CC_CODE_UPD_T]
    ON [dbo].[CST_COSTCENTRE]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

