CREATE TABLE [dbo].[SL_TERMS] (
    [SLT_PRIMARY]              INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SLT_CODE]                 VARCHAR (10) NOT NULL,
    [SLT_DESCRIPTION]          VARCHAR (40) NULL,
    [SLT_CREDIT_CONTROLLER]    VARCHAR (4)  NULL,
    [SLT_TOTAL_DISC]           FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_LINE_DISC]            FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_CREDIT_LIMIT]         FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_SETT_DISC_1]          FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_SETT_DAYS_1]          INT          DEFAULT ((0)) NOT NULL,
    [SLT_SETT_DISC_2]          FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_SETT_DAYS_2]          INT          DEFAULT ((0)) NOT NULL,
    [SLT_DELIVERY_CHARGE]      FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_DELIVERY_CHARGE_PCNT] FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_MIN_ORDER]            FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [SLT_TERMS]                VARCHAR (40) NULL,
    [SLT_DUEDATE_TYPE]         TINYINT      DEFAULT ((0)) NOT NULL,
    [SLT_DUE_DAYS]             INT          DEFAULT ((0)) NOT NULL,
    [SLT_DELIVERY_METHOD]      VARCHAR (20) NULL,
    [SLT_NORMAL_DAYS]          TINYINT      DEFAULT ((0)) NOT NULL,
    [SLT_URGENT_DAYS]          TINYINT      DEFAULT ((0)) NOT NULL,
    [SLT_USER_PUTIN]           VARCHAR (4)  NULL,
    [SLT_DATE_PUTIN]           DATETIME     NULL,
    [SLT_USER_EDITED]          VARCHAR (4)  NULL,
    [SLT_DATE_EDITED]          DATETIME     NULL,
    [SLT_DEFAULT_TERMS]        BIT          DEFAULT ((0)) NOT NULL,
    [SLT_SOURCE]               VARCHAR (1)  NULL,
    CONSTRAINT [SLT_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SLT_PRIMARY] ASC)
);


GO
CREATE TRIGGER [dbo].[aa_sl_terms_dt]
    ON [dbo].[SL_TERMS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

