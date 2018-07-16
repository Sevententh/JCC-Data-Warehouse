﻿CREATE TABLE [dbo].[PL_ACCOUNTS2] (
    [SU_PRIMARY_2]               FLOAT (53)      NOT NULL,
    [SU_CHAR1]                   VARCHAR (20)    NULL,
    [SU_CHAR2]                   VARCHAR (20)    NULL,
    [SU_CHAR3]                   VARCHAR (100)   NULL,
    [SU_CHAR4]                   VARCHAR (100)   NULL,
    [SU_FLAG1]                   TINYINT         DEFAULT ((0)) NULL,
    [SU_FLAG2]                   TINYINT         DEFAULT ((0)) NULL,
    [SU_DATE1]                   DATETIME        NULL,
    [SU_DATE2]                   DATETIME        NULL,
    [SU_NUM1]                    FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_NUM2]                    FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_USRCHAR1]                VARCHAR (20)    NULL,
    [SU_USRCHAR2]                VARCHAR (20)    NULL,
    [SU_USRCHAR3]                VARCHAR (100)   NULL,
    [SU_USRCHAR4]                VARCHAR (100)   NULL,
    [SU_USRFLAG1]                TINYINT         DEFAULT ((0)) NULL,
    [SU_USRFLAG2]                TINYINT         DEFAULT ((0)) NULL,
    [SU_USRDATE1]                DATETIME        NULL,
    [SU_USRDATE2]                DATETIME        NULL,
    [SU_USRNUM1]                 FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_USRNUM2]                 FLOAT (53)      DEFAULT ((0)) NULL,
    [SUCODE2]                    VARCHAR (10)    NULL,
    [SU_EDI_ANA]                 VARCHAR (13)    NULL,
    [SU_EDI_SUPPIDN]             VARCHAR (13)    NULL,
    [SU_EDI_FLAG]                TINYINT         DEFAULT ((0)) NULL,
    [SU_EDI_TEMPLATE]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_EDI_FLGN]                FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_LANG_CODE]               VARCHAR (10)    NULL,
    [SU_CONTACT_TITLE]           VARCHAR (5)     NULL,
    [SU_CONTACT_INITIALS]        VARCHAR (15)    NULL,
    [SU_CONTACT_SURNAME]         VARCHAR (30)    NULL,
    [SU_CONTACT_JOB]             VARCHAR (35)    NULL,
    [SU_CONTACT_COMPTYPE]        TINYINT         DEFAULT ((0)) NULL,
    [SU_CONTACT_FIRSTNAME]       VARCHAR (20)    NULL,
    [SU_ISDN_NUMBER]             VARCHAR (20)    NULL,
    [SU_WEBSITE_ADDRESS]         VARCHAR (116)   NULL,
    [SU_MOBILE_NUMBER]           VARCHAR (20)    NULL,
    [SU_USRCHAR5]                VARCHAR (20)    NULL,
    [SU_USRCHAR6]                VARCHAR (30)    NULL,
    [SU_USRFLAG3]                TINYINT         DEFAULT ((0)) NULL,
    [SU_USRDATE3]                DATETIME        NULL,
    [SU_USRNUM3]                 FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_USRCHAR7]                VARCHAR (30)    NULL,
    [SU_USRCHAR8]                VARCHAR (30)    NULL,
    [SU_LEVEL]                   INT             DEFAULT ((0)) NULL,
    [SU_GROUP]                   VARCHAR (10)    NULL,
    [SU_IR_APPROVER1]            VARCHAR (4)     NULL,
    [SU_IR_APPROVER2]            VARCHAR (4)     NULL,
    [SU_IR_APPROVER3]            VARCHAR (4)     NULL,
    [SU_CLOSING_DAYS]            TINYINT         DEFAULT ((0)) NULL,
    [SU_DUE_DAYS_AFTER]          TINYINT         DEFAULT ((0)) NULL,
    [SU_TAX_NOTIFY_TIME]         VARCHAR (1)     NULL,
    [SU_TAX_ROUNDING]            TINYINT         DEFAULT ((0)) NULL,
    [SU_VALUEBORDER1]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_VALUEBORDER2]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_VALUEBORDER3]            FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_NOTEDATE1]               INT             DEFAULT ((0)) NULL,
    [SU_NOTEDATE2]               INT             DEFAULT ((0)) NULL,
    [SU_NOTEDATE3]               INT             DEFAULT ((0)) NULL,
    [SU_NOTERATE1]               TINYINT         DEFAULT ((0)) NULL,
    [SU_NOTERATE2]               TINYINT         DEFAULT ((0)) NULL,
    [SU_NOTERATE3]               TINYINT         DEFAULT ((0)) NULL,
    [SU_PAYTYPE]                 TINYINT         DEFAULT ((0)) NULL,
    [SU_BANK_TRNSFR_TYPE]        TINYINT         DEFAULT ((0)) NULL,
    [SU_BANK_COMISSN_PAYER]      TINYINT         DEFAULT ((0)) NULL,
    [SU_BANK_BRANCH]             VARCHAR (20)    NULL,
    [SU_BANK_AC_TYPE]            TINYINT         DEFAULT ((0)) NULL,
    [SU_BANK_COMISSN_FEE1]       FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_BANK_COMISSN_FEE2]       FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_BANK_COMISSN_FEE3]       FLOAT (53)      DEFAULT ((0)) NULL,
    [SU_XML_ORDER_FORMAT]        VARCHAR (20)    NULL,
    [SU_EMAIL_SUBJECT]           VARCHAR (100)   NULL,
    [SU_EMAIL_MESSAGE]           TEXT            NULL,
    [SU_OUR_ACCOUNT_CODE]        VARCHAR (20)    NULL,
    [SU_IBAN_NO]                 VARCHAR (34)    NULL,
    [SU_IR_APPROVER_GROUP1_LINK] INT             NULL,
    [SU_IR_APPROVER_GROUP2_LINK] INT             NULL,
    [SU_IR_APPROVER_GROUP3_LINK] INT             NULL,
    [SU_IR_TOLERANCE_VAL]        FLOAT (53)      DEFAULT ((0)) NOT NULL,
    [SU_IR_TOLERANCE_P]          DECIMAL (24, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [SU_PRIMARY_2_PK] PRIMARY KEY CLUSTERED ([SU_PRIMARY_2] ASC),
    CONSTRAINT [SU_IR_APPROVERS_CK] CHECK ((isnull([SU_IR_APPROVER1],'')='' OR [SU_IR_APPROVER_GROUP1_LINK] IS NULL) AND (isnull([SU_IR_APPROVER2],'')='' OR [SU_IR_APPROVER_GROUP2_LINK] IS NULL) AND (isnull([SU_IR_APPROVER3],'')='' OR [SU_IR_APPROVER_GROUP3_LINK] IS NULL))
);

