CREATE TABLE [dbo].[WO_ORDERS] (
    [WO_ORDER_NUMBER]           INT          NOT NULL,
    [WO_PARENT_ORDER_NUMBER]    INT          NOT NULL,
    [WO_TOP_LEVEL_ORDER_NUMBER] INT          NOT NULL,
    [WO_LEVEL]                  INT          NOT NULL,
    [WO_STOCK_LINK]             FLOAT (53)   NOT NULL,
    [WO_ROUTE_LINK]             INT          NOT NULL,
    [WO_CURRENT_STAGE]          INT          NULL,
    [WO_QUANTITY]               FLOAT (53)   NOT NULL,
    [WO_QUANTITY_BUILT]         FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_QUANTITY_WRITTEN_OFF]   FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_QUANTITY_ISSUED]        FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_QUANTITY_UNBUILT]       FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_ASM_QUANTITY]           FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [WO_START_DATE]             DATETIME     NULL,
    [WO_END_DATE]               DATETIME     NULL,
    [WO_PRIORITY]               INT          DEFAULT ((0)) NULL,
    [WO_NOTES]                  TEXT         NULL,
    [WO_SORT_KEY]               VARCHAR (20) NULL,
    [WO_STATUS]                 INT          DEFAULT ((0)) NULL,
    [WO_MAT_ESTIMATED_COST]     FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_MAT_ACTUAL_COST]        FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_LAB_ESTIMATED_COST]     FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_LAB_ACTUAL_COST]        FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_REMAINING_COST]         FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_MU_LOCK]                TINYINT      NULL,
    [WO_USER_PUTIN]             VARCHAR (4)  NULL,
    [WO_DATE_PUTIN]             DATETIME     NULL,
    [WO_USER_EDITED]            VARCHAR (4)  NULL,
    [WO_DATE_EDITED]            DATETIME     NULL,
    [WO_MAT_UNISSUED_COST]      FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_LAB_UNISSUED_COST]      FLOAT (53)   DEFAULT ((0)) NULL,
    [WO_SUB_ANALYSIS_LINK]      INT          NULL,
    [WO_SOURCE]                 VARCHAR (1)  NULL,
    CONSTRAINT [WO_ORDER_NUMBER_PK] PRIMARY KEY CLUSTERED ([WO_ORDER_NUMBER] ASC),
    CONSTRAINT [WO_ORDERS_QUANTITY_CHECK] CHECK ([WO_QUANTITY]>(0)),
    CONSTRAINT [WO_ORDERS_CURRENT_STAGE_FK] FOREIGN KEY ([WO_CURRENT_STAGE]) REFERENCES [dbo].[WO_STAGES] ([WS_PRIMARY]),
    CONSTRAINT [WO_ORDERS_ROUTE_LINK_FK] FOREIGN KEY ([WO_ROUTE_LINK]) REFERENCES [dbo].[WO_ROUTES] ([WR_PRIMARY]),
    CONSTRAINT [WO_ORDERS_STOCK_LINK_FK] FOREIGN KEY ([WO_STOCK_LINK]) REFERENCES [dbo].[STK_STOCK] ([STK_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [WO_PARENT_ORDER_NUMBER]
    ON [dbo].[WO_ORDERS]([WO_PARENT_ORDER_NUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [WO_ROUTE_LINK]
    ON [dbo].[WO_ORDERS]([WO_ROUTE_LINK] ASC);


GO
CREATE NONCLUSTERED INDEX [WO_STOCK_LINK]
    ON [dbo].[WO_ORDERS]([WO_STOCK_LINK] ASC, [WO_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [WO_TOP_LEVEL_ORDER_NUMBER]
    ON [dbo].[WO_ORDERS]([WO_TOP_LEVEL_ORDER_NUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WO_ORDERS_WO_STATUS]
    ON [dbo].[WO_ORDERS]([WO_STATUS] ASC);


GO
create trigger SDK_WMS_WO_ORDER_COMPLETION_UT
   on WO_ORDERS
   for update
as
if update(WO_STATUS)
   begin
      if exists (select 1
         from inserted i
            join deleted d on d.WO_ORDER_NUMBER = i.WO_ORDER_NUMBER
         where d.WO_STATUS < 10 and i.WO_STATUS >= 10
                )
         begin
            if exists (select 1
               from inserted i
                  join deleted d on d.WO_ORDER_NUMBER = i.WO_ORDER_NUMBER
                  join WO_COMPONENTS on WC_ORDER_NUMBER = i.WO_ORDER_NUMBER
                  join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
               where d.WO_STATUS < 10 and i.WO_STATUS >= 10
                      )
                     
               delete SDK_WMS_STOCK_WO_RESERVATION
                  from inserted i
                     join deleted d on d.WO_ORDER_NUMBER = i.WO_ORDER_NUMBER
                     join WO_COMPONENTS on WC_ORDER_NUMBER = i.WO_ORDER_NUMBER
                     join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                  where d.WO_STATUS < 10 and i.WO_STATUS >= 10
         end
   end