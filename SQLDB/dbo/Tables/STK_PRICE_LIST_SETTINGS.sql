CREATE TABLE [dbo].[STK_PRICE_LIST_SETTINGS] (
    [PRS_PRIMARY]                 INT           NOT NULL,
    [PRS_CUST_DEF]                VARCHAR (5)   NULL,
    [PRS_PROD_DEF]                VARCHAR (5)   NULL,
    [PRS_DIS_PRICE]               TINYINT       NULL,
    [PRS_DIS_PRICE_POP]           TINYINT       NULL,
    [PRS_DIS_LINE]                TINYINT       NULL,
    [PRS_DIS_TOTAL]               TINYINT       NULL,
    [PRS_PR_BY_CUST]              INT           NULL,
    [PRS_APPLY_TO_PL1]            INT           NULL,
    [PRS_SPL_REPORT]              VARCHAR (200) NULL,
    [PRS_WOD_REPORT]              VARCHAR (200) NULL,
    [PRS_BGF_REPORT]              VARCHAR (200) NULL,
    [PRS_AUTO_CUST_SRCH]          TINYINT       NULL,
    [PRS_AUTO_PROD_SRCH]          TINYINT       NULL,
    [PRS_INC_BOGOF]               TINYINT       NULL,
    [PRS_INC_SPL]                 TINYINT       NULL,
    [PRS_USE_ORD_KEYS]            TINYINT       DEFAULT ((0)) NULL,
    [PRS_ORD_KEYS_DEFAULT]        TINYINT       DEFAULT ((0)) NULL,
    [PRS_ORD_KEY_ORDER]           VARCHAR (5)   NULL,
    [PRS_WIZ_PROFILE]             VARCHAR (10)  DEFAULT ('') NULL,
    [PRS_REPLACE_USR_KEY]         VARCHAR (1)   NULL,
    [PRS_SPL_ATTRIB_TEMP_PRIMARY] TINYINT       NULL,
    [PRS_BGF_ATTRIB_TEMP_PRIMARY] TINYINT       NULL,
    [PRS_WOD_ATTRIB_TEMP_PRIMARY] TINYINT       NULL,
    [PRS_VERIFY_PRICE]            TINYINT       DEFAULT ((0)) NULL,
    [PRS_COST_PLUS_METHOD]        TINYINT       DEFAULT ((0)) NULL,
    [PRS_ALWAYS_ACTIVE]           TINYINT       DEFAULT ((0)) NULL,
    [PRS_LOCK_DOWN_CURRENCY]      TINYINT       NULL,
    [PRS_VERIFY_DATE]             TINYINT       DEFAULT ((0)) NULL,
    CONSTRAINT [PRS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([PRS_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE TRIGGER [dbo].[AA_STK_PRICE_LIST_SETTINGS_DT]
    ON [dbo].[STK_PRICE_LIST_SETTINGS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

