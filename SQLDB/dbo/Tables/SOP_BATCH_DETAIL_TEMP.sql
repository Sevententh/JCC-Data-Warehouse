CREATE TABLE [dbo].[SOP_BATCH_DETAIL_TEMP] (
    [SOBD_ID]                    INT             NOT NULL,
    [SOBD_LINE_NO]               INT             NOT NULL,
    [SOBD_ORDER_LINK]            INT             NULL,
    [SOBD_STATUS]                TINYINT         NULL,
    [SOBD_DELIVERY_QUANTITY]     DECIMAL (24, 8) NULL,
    [SOBD_INVOICE_QUANTITY]      DECIMAL (24, 8) NULL,
    [SOBD_SUB_ANALYSIS]          VARCHAR (25)    NULL,
    [SOBD_SERIAL_NUMBER]         VARCHAR (40)    NULL,
    [SOBD_TIMESTAMP]             ROWVERSION      NOT NULL,
    [SOBD_MULTI_SUB_SERIAL_LINK] INT             NULL,
    CONSTRAINT [SOP_BATCH_DETAIL_TEMP_PK] PRIMARY KEY CLUSTERED ([SOBD_ID] ASC, [SOBD_LINE_NO] ASC)
);


GO
CREATE TRIGGER [dbo].[AA_SOP_BATCH_DET_TEMP_DEL_T]
    ON [dbo].[SOP_BATCH_DETAIL_TEMP]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END

