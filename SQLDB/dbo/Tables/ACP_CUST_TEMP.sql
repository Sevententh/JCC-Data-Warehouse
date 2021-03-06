﻿CREATE TABLE [dbo].[ACP_CUST_TEMP] (
    [ACP_CUST_TEMP_PRIMARY]     INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ACP_CUST_TEMP_CODE]        VARCHAR (10) NULL,
    [ACP_CUST_TEMP_USERID]      VARCHAR (4)  NULL,
    [ACP_CUST_TEMP_SEND_EMAIL]  BIT          NULL,
    [ACP_CUST_TEMP_UPLOAD_TYPE] TINYINT      NULL,
    CONSTRAINT [ACP_CUST_TEMP_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ACP_CUST_TEMP_PRIMARY] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [ACP_CUST_TEMP_CODE]
    ON [dbo].[ACP_CUST_TEMP]([ACP_CUST_TEMP_CODE] ASC) WITH (FILLFACTOR = 70);

