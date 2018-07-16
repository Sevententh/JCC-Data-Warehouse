CREATE TABLE [dbo].[POP_HEADER] (
    [POH_TYPE]                      VARCHAR (1)   NULL,
    [POH_STATUS]                    TINYINT       DEFAULT ((0)) NULL,
    [POH_HEADER_REF]                VARCHAR (25)  NULL,
    [POH_ORDER_REF]                 VARCHAR (20)  NULL,
    [POH_INV_DATE]                  DATETIME      NULL,
    [POH_INV_PERIOD]                TINYINT       DEFAULT ((0)) NULL,
    [POH_INV_YEAR]                  VARCHAR (1)   NULL,
    [POH_DESCRIPTION]               VARCHAR (30)  NULL,
    [POH_YEAR]                      VARCHAR (1)   NULL,
    [POH_PERIOD]                    TINYINT       DEFAULT ((0)) NULL,
    [POH_DATE]                      DATETIME      NULL,
    [POH_REQUIRED]                  DATETIME      NULL,
    [POH_COMPLETED]                 DATETIME      NULL,
    [POH_NETT]                      FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_NETT_C]                    FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_VAT]                       FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_TAX_C]                     FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_ACQ_TAX]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_GROSS]                     FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_GROSS_C]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DISC_LINE_P]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_T_DISCVAL]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_T_DISCVAL_C]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DISC_TOT_P]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_SETT_DISC_1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_SETT_DISC_2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_SETT_DAYS_1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_SETT_DAYS_2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_L_DISCVAL]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_L_DISCVAL_C]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_CURR_RATE]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_CURR_CODE]                 VARCHAR (4)   NULL,
    [POH_CURR_RTCH]                 TINYINT       DEFAULT ((0)) NULL,
    [POH_IMPEXP_CODE]               VARCHAR (1)   NULL,
    [POH_EC_DEL_TERM]               VARCHAR (3)   NULL,
    [POH_EC_T_NATURE]               VARCHAR (2)   NULL,
    [POH_EC_T_MODE]                 VARCHAR (1)   NULL,
    [POH_DEL_CHARGE]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DEL_CHG_PCT]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DEL_METHOD]                VARCHAR (20)  NULL,
    [POH_GRN_NOTE_NO]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DEL_DATE]                  DATETIME      NULL,
    [POH_MIN_VAL]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DUE_DAYS]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_TERMS]                     VARCHAR (40)  NULL,
    [POH_A_P_DAYS]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_PRICE_KEY]                 TINYINT       DEFAULT ((0)) NULL,
    [POH_INV_ADD]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DEL_ADD]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_NO_OF_LINES]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_LINES_INVD]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_LINES_DELVD]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_OS_INVVAL]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_OS_DELVAL]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_OS_INVCVAL]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_OS_DELCVAL]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_ARCHIVE]                   TINYINT       DEFAULT ((0)) NULL,
    [POH_PRIORITY]                  TINYINT       DEFAULT ((0)) NULL,
    [POH_QUERY_FLAG]                TINYINT       DEFAULT ((0)) NULL,
    [POH_SUPP_DELNOTE_NO]           VARCHAR (15)  NULL,
    [POH_LAST_ACTION]               VARCHAR (1)   NULL,
    [POH_USER_PUTIN]                VARCHAR (4)   NULL,
    [POH_DATE_PUTIN]                DATETIME      NULL,
    [POH_MU_STATUS]                 VARCHAR (1)   NULL,
    [POH_SUSORT]                    VARCHAR (20)  NULL,
    [POH_USER1]                     VARCHAR (20)  NULL,
    [POH_USER2]                     VARCHAR (20)  NULL,
    [POH_USER3]                     VARCHAR (20)  NULL,
    [POH_ACC_STATUS]                VARCHAR (11)  NULL,
    [POH_BATCH_FLAG]                TINYINT       DEFAULT ((0)) NULL,
    [POH_BATCH_REF]                 VARCHAR (10)  NULL,
    [POH_BATCH_POSTD]               VARCHAR (1)   NULL,
    [POH_INVSTAT]                   TINYINT       DEFAULT ((0)) NULL,
    [POH_DELSTAT]                   TINYINT       DEFAULT ((0)) NULL,
    [POH_ORDUPDATED]                TINYINT       DEFAULT ((0)) NULL,
    [POH_EQ_STATUS]                 VARCHAR (1)   NULL,
    [POH_GRNUPDATED]                DATETIME      NULL,
    [POH_ORDER_NUMBR]               VARCHAR (10)  NULL,
    [POH_LEDGER]                    VARCHAR (2)   NULL,
    [POH_ACCOUNT]                   VARCHAR (10)  NULL,
    [POH_REBUILDNUM]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_PRIMARY]                   FLOAT (53)    NOT NULL,
    [POH_SUB_LEDGER]                VARCHAR (10)  NULL,
    [POH_DEL_ADD_POINT]             VARCHAR (2)   NULL,
    [POH_BUDGET_STATUS]             VARCHAR (4)   NULL,
    [POH_ORIGINAL_USER_PUTIN]       VARCHAR (4)   NULL,
    [POH_SOPFLAG]                   TINYINT       DEFAULT ((0)) NULL,
    [POH_NETT_BASE2]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_VAT_BASE2]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_GROSS_BASE2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_L_DISC_BASE2]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_T_DISC_BASE2]              FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_BASE2_RATE]                FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_TRI_RATE1]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_BASE2_RATECHNG]            TINYINT       DEFAULT ((0)) NULL,
    [POH_TRI_RATECHNG1]             TINYINT       DEFAULT ((0)) NULL,
    [POH_ACQUISTN_BASE2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_INV_VAL_BASE2]             FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_DEL_VAL_BASE2]             FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_CURR_TYPE]                 VARCHAR (1)   NULL,
    [POH_TRI_RATE2]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [POH_TRI_RATECHNG2]             TINYINT       DEFAULT ((0)) NULL,
    [POH_SPCL_TRANTYPE]             VARCHAR (20)  NULL,
    [POH_SRV_STATUS]                TINYINT       DEFAULT ((0)) NULL,
    [POH_SOURCE]                    VARCHAR (1)   NULL,
    [POH_TRAN_OPTIONS]              VARCHAR (30)  NULL,
    [POH_AUTHORISER_ID]             VARCHAR (4)   NULL,
    [POH_XML_SENT]                  TINYINT       DEFAULT ((0)) NULL,
    [POH_SURVEYOR]                  VARCHAR (30)  NULL,
    [POH_CIS_SENT_TO]               VARCHAR (30)  NULL,
    [POH_CIS_SENT_DATE]             DATETIME      NULL,
    [POH_CIS_AUTHORISED]            TINYINT       DEFAULT ((0)) NULL,
    [POH_CIS_AUTHORISED_DATE]       DATETIME      NULL,
    [POH_PARTNER]                   VARCHAR (10)  NULL,
    [POH_INTERNL_NOTE]              VARCHAR (512) NULL,
    [POH_REJECTER_ID]               VARCHAR (4)   NULL,
    [POH_NOM_CAT_LINK]              INT           NULL,
    [POH_YEAR_LINK]                 SMALLINT      NULL,
    [POH_REVERSE_SERVICE_VAT]       FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [POH_REVERSE_SERVICE_VAT_BASE2] FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [POH_USER_EDITED]               VARCHAR (4)   NULL,
    [POH_DATE_EDITED]               DATETIME      NULL,
    [POH_POP_ORDER_STATUS_LINK]     INT           NOT NULL,
    [POH_WFF_APPROVAL_STATUS]       SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [POH_PRIMARY_PK] PRIMARY KEY CLUSTERED ([POH_PRIMARY] ASC),
    CONSTRAINT [POH_YEAR_LINK_CK] CHECK ([POH_YEAR] IS NOT NULL AND (upper([POH_YEAR])='O' OR upper([POH_YEAR])='N' OR upper([POH_YEAR])='C' OR upper([POH_YEAR])='L') AND [POH_YEAR_LINK] IS NOT NULL OR ([POH_YEAR] IS NULL OR (upper([POH_YEAR])='O' OR upper([POH_YEAR])='')) AND [POH_YEAR_LINK] IS NULL),
    CONSTRAINT [POH_NOM_CAT_LINK_FK] FOREIGN KEY ([POH_NOM_CAT_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [POH_POP_ORDER_STATUS_LINK_FK] FOREIGN KEY ([POH_POP_ORDER_STATUS_LINK]) REFERENCES [dbo].[POP_ORDER_STATUS] ([POS_PRIMARY]),
    CONSTRAINT [POH_YEAR_LINK_FK] FOREIGN KEY ([POH_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [POH_ACCOUNT]
    ON [dbo].[POP_HEADER]([POH_ACCOUNT] ASC);


GO
CREATE NONCLUSTERED INDEX [POH_ACC_STATUS]
    ON [dbo].[POP_HEADER]([POH_ACC_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [POH_BATCH_FLAG]
    ON [dbo].[POP_HEADER]([POH_BATCH_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [POH_BATCH_REF]
    ON [dbo].[POP_HEADER]([POH_BATCH_REF] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POH_ORDER_NUMBR]
    ON [dbo].[POP_HEADER]([POH_ORDER_NUMBR] ASC);


GO
CREATE NONCLUSTERED INDEX [POH_PRIORITY]
    ON [dbo].[POP_HEADER]([POH_PRIORITY] ASC);


GO
CREATE NONCLUSTERED INDEX [POH_TYPE]
    ON [dbo].[POP_HEADER]([POH_TYPE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_POP_HEADER_POH_TYPE_POH_STATUS]
    ON [dbo].[POP_HEADER]([POH_TYPE] ASC, [POH_STATUS] ASC)
    INCLUDE([POH_ORDER_NUMBR]);


GO
CREATE NONCLUSTERED INDEX [POH_POP_ORDER_STATUS_LINK]
    ON [dbo].[POP_HEADER]([POH_POP_ORDER_STATUS_LINK] ASC) WITH (FILLFACTOR = 70);


GO
CREATE TRIGGER [dbo].[aa_pop_header_dt]
    ON [dbo].[POP_HEADER]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

