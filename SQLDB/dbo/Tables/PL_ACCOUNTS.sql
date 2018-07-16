CREATE TABLE [dbo].[PL_ACCOUNTS] (
    [SUCODE]                     VARCHAR (10)  NULL,
    [SUNAME]                     VARCHAR (40)  NULL,
    [SUADDRESS]                  VARCHAR (160) NULL,
    [SUPOSTCODE]                 VARCHAR (12)  NULL,
    [SUPHONE]                    VARCHAR (20)  NULL,
    [SUPHONE2]                   VARCHAR (20)  NULL,
    [SUFAX]                      VARCHAR (20)  NULL,
    [SUCONTACT]                  VARCHAR (30)  NULL,
    [SUSALUTE]                   VARCHAR (20)  NULL,
    [SU_MULTI_CURR]              TINYINT       DEFAULT ((0)) NULL,
    [SU_IMPORT_CODE]             VARCHAR (1)   NULL,
    [SU_COUNTRY_CODE]            VARCHAR (4)   NULL,
    [SU_VAT_REG_NO]              VARCHAR (15)  NULL,
    [SU_EC_DELIVERY]             VARCHAR (3)   NULL,
    [SU_EC_T_NATURE]             VARCHAR (2)   NULL,
    [SU_EC_T_MODE]               VARCHAR (1)   NULL,
    [SUBALANCE]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [SUBALANCE_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [SUAGED_1]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [SUAGED_2]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [SUAGED_3]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [SUAGED_4]                   FLOAT (53)    DEFAULT ((0)) NULL,
    [SUAGED_UNALLOC]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUSORT]                     VARCHAR (20)  NULL,
    [SUUSER1]                    VARCHAR (20)  NULL,
    [SUUSER2]                    VARCHAR (20)  NULL,
    [SUUSER3]                    VARCHAR (20)  NULL,
    [SUUSED]                     TINYINT       DEFAULT ((0)) NULL,
    [SU_US1099]                  TINYINT       DEFAULT ((0)) NULL,
    [SUTURNOVERPTD]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L3]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L4]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L5]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L6]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L7]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L8]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L9]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L10]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L11]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L12]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L13]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C3]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C4]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C5]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C6]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C7]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C8]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C9]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C10]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C11]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C12]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C13]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O1]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O2]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O3]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O4]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O5]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O6]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O7]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O8]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O9]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O10]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O11]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O12]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O13]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVERYTD]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SUCURRENCYCODE]             VARCHAR (6)   NULL,
    [SUTURNOVR_L1_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L2_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L3_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L4_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L5_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L6_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L7_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L8_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L9_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L10_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L11_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L12_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_L13_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C1_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C2_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C3_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C4_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C5_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C6_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C7_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C8_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C9_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C10_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C11_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C12_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_C13_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O1_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O2_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O3_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O4_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O5_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O6_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O7_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O8_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O9_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O10_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O11_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O12_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_O13_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_YTD_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SUTURNOVR_PTD_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_NOTES]                   TEXT          NULL,
    [SU_BANK_SORT]               VARCHAR (10)  NULL,
    [SU_BANK_AC_NO]              VARCHAR (18)  NULL,
    [SU_BANK_AC_NAME]            VARCHAR (30)  NULL,
    [SU_BANK_BACSREF]            VARCHAR (18)  NULL,
    [SU_BANK_BANKNAME]           VARCHAR (25)  NULL,
    [SU_REM_ADD_CDE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_INV_ADD_CDE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_DEL_ADD_CDE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_ST_ADD_CODE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_DATE_INV]                DATETIME      NULL,
    [SU_DATE_PAY]                DATETIME      NULL,
    [SU_USER_PUTIN]              VARCHAR (4)   NULL,
    [SU_DATE_PUTIN]              DATETIME      NULL,
    [SU_DATE_EDITED]             DATETIME      NULL,
    [SU_USER_EDITED]             VARCHAR (4)   NULL,
    [SU_MU_STATUS]               VARCHAR (1)   NULL,
    [SU_LINE_DISC]               FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_TOT_DISC]                FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_SETT_DISC1]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_SETT_DISC2]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_SETT_DAYS1]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_SETT_DAYS2]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_ON_STOP]                 TINYINT       DEFAULT ((0)) NULL,
    [SU_CREDIT_LIMIT]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_TERMS]                   VARCHAR (40)  NULL,
    [SU_DEL_CHARGE]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_DEL_CHARGE_C]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_MIN_ORDR]                FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_MIN_ORDR_C]              FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_DUE_DAYS]                FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_A_P_DAYS]                FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_DEL_CHG_PCNT]            FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_DUEDATE_TYPE]            TINYINT       DEFAULT ((0)) NULL,
    [SU_PRICE_KEY]               TINYINT       DEFAULT ((0)) NULL,
    [SU_ANALYSIS]                VARCHAR (25)  NULL,
    [SU_TAX_CODE]                VARCHAR (4)   NULL,
    [SU_BANK_ANALYS]             VARCHAR (25)  NULL,
    [SU_ADDRESS_USER1]           VARCHAR (30)  NULL,
    [SU_ADDRESS_USER2]           VARCHAR (30)  NULL,
    [SU_EMAIL]                   VARCHAR (64)  NULL,
    [SU_PRIMARY]                 FLOAT (53)    NOT NULL,
    [SU_CURRENCY_CHANGED]        TINYINT       DEFAULT ((0)) NULL,
    [SU_SOURCE]                  VARCHAR (1)   NULL,
    [SU_DOC_DESTINATION]         VARCHAR (10)  NULL,
    [SU_COUNTRY]                 VARCHAR (35)  NULL,
    [SU_DO_NOT_USE]              BIT           DEFAULT ((0)) NOT NULL,
    [SU_LEAD_TIME]               INT           DEFAULT ((0)) NULL,
    [SU_CIS]                     TINYINT       DEFAULT ((0)) NULL,
    [SU_CIS_TAX_STATUS]          TINYINT       DEFAULT ((0)) NULL,
    [SU_CIS_UTR]                 VARCHAR (10)  NULL,
    [SU_CIS_INACTIVE]            TINYINT       DEFAULT ((0)) NULL,
    [SU_CIS_BUSINESS_TYPE]       TINYINT       DEFAULT ((0)) NULL,
    [SU_CIS_NI_NUMBER]           VARCHAR (9)   NULL,
    [SU_CIS_COMPANY_REG_NO]      VARCHAR (8)   NULL,
    [SU_CIS300_NAME]             VARCHAR (56)  NULL,
    [SU_VERIFICATION_NUMBER]     VARCHAR (13)  NULL,
    [SU_DATE_MATCHED]            DATETIME      NULL,
    [SU_PARTNERSHIP_LINK]        VARCHAR (10)  NULL,
    [SU_CONTRACT_AGREED]         TINYINT       DEFAULT ((0)) NULL,
    [SU_CIS_TITLE]               VARCHAR (4)   NULL,
    [SU_CIS_FORENAME1]           VARCHAR (35)  NULL,
    [SU_CIS_FORENAME2]           VARCHAR (35)  NULL,
    [SU_CIS_SURNAME]             VARCHAR (35)  NULL,
    [SU_INSURANCE_COMPANY]       VARCHAR (40)  NULL,
    [SU_INSURANCE_POLICY_NO]     VARCHAR (25)  NULL,
    [SU_INSURANCE_EXPIRY_DATE]   DATETIME      NULL,
    [SU_INSURANCE_CHECKED]       TINYINT       DEFAULT ((0)) NULL,
    [SU_CITB_LEVY]               TINYINT       DEFAULT ((0)) NULL,
    [SU_MATCH_IN_PROGRESS]       TINYINT       DEFAULT ((0)) NULL,
    [SU_CURR_CREDIT_LIMIT]       FLOAT (53)    DEFAULT ((0)) NULL,
    [SU_ANT_DAYS_FROM_DATES_OPT] TINYINT       DEFAULT ((0)) NULL,
    [SU_COMPANY_REG_NUMBER]      VARCHAR (20)  NULL,
    [SU_SWIFT_CODE]              VARCHAR (11)  NULL,
    [SU_METHOD_OF_PAYMENT]       VARCHAR (20)  NULL,
    CONSTRAINT [SU_PRIMARY_PK] PRIMARY KEY CLUSTERED ([SU_PRIMARY] ASC),
    CONSTRAINT [SU_SWIFT_CODE_CK] CHECK (len(isnull([SU_SWIFT_CODE],''))=(11) OR len(isnull([SU_SWIFT_CODE],''))=(8) OR len(isnull([SU_SWIFT_CODE],''))=(0))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SUCODE]
    ON [dbo].[PL_ACCOUNTS]([SUCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [SUCONTACT]
    ON [dbo].[PL_ACCOUNTS]([SUCONTACT] ASC);


GO
CREATE NONCLUSTERED INDEX [SUNAME]
    ON [dbo].[PL_ACCOUNTS]([SUNAME] ASC);


GO
CREATE NONCLUSTERED INDEX [SUPHONE]
    ON [dbo].[PL_ACCOUNTS]([SUPHONE] ASC);


GO
CREATE NONCLUSTERED INDEX [SUPOSTCODE]
    ON [dbo].[PL_ACCOUNTS]([SUPOSTCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [SUSORT]
    ON [dbo].[PL_ACCOUNTS]([SUSORT] ASC);


GO
CREATE NONCLUSTERED INDEX [SUUSER1]
    ON [dbo].[PL_ACCOUNTS]([SUUSER1] ASC);


GO
CREATE NONCLUSTERED INDEX [SUUSER2]
    ON [dbo].[PL_ACCOUNTS]([SUUSER2] ASC);


GO
CREATE NONCLUSTERED INDEX [SUUSER3]
    ON [dbo].[PL_ACCOUNTS]([SUUSER3] ASC);


GO
CREATE NONCLUSTERED INDEX [SU_COUNTRY_CODE]
    ON [dbo].[PL_ACCOUNTS]([SU_COUNTRY_CODE] ASC);


GO
CREATE TRIGGER [dbo].[AA_EDIT_PL_SUPP_DEF_ADDRESSES_T]
    ON [dbo].[PL_ACCOUNTS]
    WITH ENCRYPTION
    AFTER INSERT, UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
CREATE TRIGGER [dbo].[aa_pl_acc_dt]
    ON [dbo].[PL_ACCOUNTS]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
CREATE TRIGGER [dbo].[AA_PL_SUCODE_UPD_T]
    ON [dbo].[PL_ACCOUNTS]
    WITH ENCRYPTION
    AFTER UPDATE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO
create trigger [dbo].delta_integration_Supplier_TR
ON [dbo].PL_ACCOUNTS
AFTER INSERT,UPDATE
AS
BEGIN
if not(update(SU_DATE_EDITED))
return
if (select top 1 WMSS_SYNC_SUPPLIER_DETAILS from SDK_WMS_SETTINGS) = 0
return
DECLARE @body XML (document delta_integration_XMLSchema)
DECLARE @i_id int;
DECLARE @d_id int;
DECLARE @i_date datetime;
DECLARE @d_date datetime;
DECLARE working_cursor CURSOR FORWARD_ONLY FOR SELECT
i.SU_PRIMARY,d.SU_PRIMARY,i.SU_DATE_EDITED,d.SU_DATE_EDITED
from inserted i LEFT JOIN deleted d ON i.SU_PRIMARY=d.SU_PRIMARY;
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
'SUP' AS "@WMSI_TYPE"
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
