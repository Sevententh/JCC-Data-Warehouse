﻿CREATE TABLE [dbo].[LANG_CO2] (
    [LANGCODE_CO2]           VARCHAR (10) NOT NULL,
    [CO2_EMISSION_GROUP]     VARCHAR (20) NULL,
    [CO2_CLASSIFICATION]     VARCHAR (20) NULL,
    [CO2_CONSUMPTION_DATE]   VARCHAR (20) NULL,
    [CO2_MEASURE]            VARCHAR (20) NULL,
    [CO2_CONVERSIONS_TABLES] VARCHAR (20) NULL,
    [CO2_EFFECTIVE_FROM]     VARCHAR (15) NULL,
    [CO2_DESCRIPTION]        VARCHAR (15) NULL,
    [CO2_FACTOR]             VARCHAR (20) NULL,
    [CO2_UPLIFT]             VARCHAR (15) NULL,
    [CO2_KG_CO2]             VARCHAR (10) NULL,
    [CO2_CO2_KG]             VARCHAR (10) NULL,
    [CO2_PROFILE_PERCENTAGE] VARCHAR (20) NULL,
    [CARBON]                 VARCHAR (10) NULL,
    [CO2_CARBON_TRANSACTION] VARCHAR (25) NULL,
    [CO2_USAGE_CATEGORY]     VARCHAR (30) NULL,
    [CO2_INCREASE_FACTOR]    VARCHAR (20) NULL,
    [CO2_SCALE]              VARCHAR (10) NULL,
    [CO2_KG]                 VARCHAR (15) NULL,
    [CO2_TONNES]             VARCHAR (15) NULL,
    [ACCOUNT_FOR_CO2]        VARCHAR (20) NULL,
    [ACTUAL_EMISSIONS]       VARCHAR (20) NULL,
    [BUDGETED_EMISSIONS]     VARCHAR (25) NULL,
    [VARIANCE_PERCENT]       VARCHAR (15) NULL,
    [TOTAL_FOR_ALL_EM_GRPS]  VARCHAR (40) NULL,
    [CALC_YEAR_PERIOD_FROM]  VARCHAR (35) NULL,
    [TOTAL_FOR_YEAR]         VARCHAR (20) NULL,
    [PER_HEAD_ACTUAL]        VARCHAR (20) NULL,
    [PER_HEAD_BUDGET]        VARCHAR (20) NULL,
    [NUMBER_OF_STAFF]        VARCHAR (20) NULL,
    [CARBON_GHG_SCOPE]       VARCHAR (20) NULL,
    [GENERATE_NEW_BUDGET]    VARCHAR (30) NULL,
    [GENERATE_BUDGETS_FOR]   VARCHAR (30) NULL,
    [BASED_ON_THE]           VARCHAR (20) NULL,
    [AND_TEXT]               VARCHAR (10) NULL,
    [A_PERCENTAGE]           VARCHAR (15) NULL,
    [IMPORT_CONVERSIONS]     VARCHAR (40) NULL,
    CONSTRAINT [LANGCODE_CO2_PK] PRIMARY KEY CLUSTERED ([LANGCODE_CO2] ASC) WITH (FILLFACTOR = 70)
);

