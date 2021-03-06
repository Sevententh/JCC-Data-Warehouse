﻿CREATE TABLE [dbo].[CST_BUDGET_QUANTITY_DETAIL] (
    [CBD_REVISION_LINK]   INT        NOT NULL,
    [CBD_PERIOD_OR_WEEK]  TINYINT    NOT NULL,
    [CBD_INCOME_QUANTITY] FLOAT (53) NOT NULL,
    [CBD_COST_QUANTITY]   FLOAT (53) NOT NULL,
    [CBD_CENTRE_LINK]     INT        NOT NULL,
    CONSTRAINT [CBD_QUANTITY_PRIMARY_PK] PRIMARY KEY NONCLUSTERED ([CBD_REVISION_LINK] ASC, [CBD_CENTRE_LINK] ASC, [CBD_PERIOD_OR_WEEK] ASC)
);

