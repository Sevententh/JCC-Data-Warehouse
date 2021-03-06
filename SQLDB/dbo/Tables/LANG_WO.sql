﻿CREATE TABLE [dbo].[LANG_WO] (
    [LANGCODE_WO]                    VARCHAR (10)  NOT NULL,
    [WORKS_ORDERS]                   VARCHAR (15)  NULL,
    [MATERIAL_ISSUE_COST]            VARCHAR (25)  NULL,
    [ISSUE_STOCK]                    VARCHAR (25)  NULL,
    [WRITE_OFF_MATERIALS]            VARCHAR (25)  NULL,
    [RETURN_MATERIALS]               VARCHAR (20)  NULL,
    [SCRAP_FINISHED_GOODS]           VARCHAR (25)  NULL,
    [FINISHED_GOODS]                 VARCHAR (20)  NULL,
    [ISSUE_NON_STOCK]                VARCHAR (30)  NULL,
    [WRITE_OFF_NON_STOCK]            VARCHAR (35)  NULL,
    [WIP_ANALYSIS]                   VARCHAR (30)  NULL,
    [ISSUE_COMPONENT_TO_WIP]         VARCHAR (30)  NULL,
    [WRITE_OFF_COMPONENT]            VARCHAR (30)  NULL,
    [ISSUE_MATERIAL_TO_WIP]          VARCHAR (25)  NULL,
    [RETURN_MATERIALS_TO_STOCK]      VARCHAR (30)  NULL,
    [WO_ORDER]                       VARCHAR (25)  NULL,
    [WO_CODE]                        VARCHAR (10)  NULL,
    [WO_DESCRIPTION]                 VARCHAR (15)  NULL,
    [STAGES]                         VARCHAR (10)  NULL,
    [STAGE]                          VARCHAR (10)  NULL,
    [OUTBOUND_COMMITMENTS]           VARCHAR (25)  NULL,
    [SOP_DELIVERED_NOT_UPDATED]      VARCHAR (30)  NULL,
    [SOP_ALLOCATED]                  VARCHAR (20)  NULL,
    [SOP_UNALLOCATED]                VARCHAR (20)  NULL,
    [COMPONENT_ALLOCATED]            VARCHAR (25)  NULL,
    [COMPONENT_UNALLOCATED]          VARCHAR (25)  NULL,
    [INBOUND_COMMITMENTS]            VARCHAR (25)  NULL,
    [WIP_ASSOCIATED_TO_SOP]          VARCHAR (25)  NULL,
    [FREE_WIP]                       VARCHAR (15)  NULL,
    [PROJECTED_STOCK]                VARCHAR (20)  NULL,
    [WORKS_ORDER]                    VARCHAR (15)  NULL,
    [MERGE_TEXT]                     VARCHAR (10)  NULL,
    [REVERSE]                        VARCHAR (15)  NULL,
    [CHILD]                          VARCHAR (10)  NULL,
    [W_ORDERS]                       VARCHAR (10)  NULL,
    [WO]                             VARCHAR (10)  NULL,
    [ASS_WITH_EXISTING_WO]           VARCHAR (40)  NULL,
    [WO_NUMBER]                      VARCHAR (20)  NULL,
    [INC_WO_QTY_BY]                  VARCHAR (40)  NULL,
    [CREATE_NEW_WO_FOR]              VARCHAR (40)  NULL,
    [BATCH_QTY]                      VARCHAR (25)  NULL,
    [PROD_DUE_TO_START]              VARCHAR (40)  NULL,
    [MIN_BUILD]                      VARCHAR (20)  NULL,
    [ASSIGNED_TO_ROUTE]              VARCHAR (25)  NULL,
    [PROD_DUE_TO_BE_COMPLETED]       VARCHAR (40)  NULL,
    [ESTIMATED_FINISH_DATE]          VARCHAR (25)  NULL,
    [TOP_LEVEL_WO_NUMBER]            VARCHAR (25)  NULL,
    [ASSEMBLY_STOCK_CODE]            VARCHAR (25)  NULL,
    [COMPONENT_STOCK_CODE]           VARCHAR (25)  NULL,
    [ROUTE_CODE]                     VARCHAR (15)  NULL,
    [ON_WORKS_ORDER]                 VARCHAR (15)  NULL,
    [DEFAULT_WORKS_ORDER]            VARCHAR (25)  NULL,
    [ROUTE]                          VARCHAR (20)  NULL,
    [ROUTES]                         VARCHAR (10)  NULL,
    [WO_NO]                          VARCHAR (10)  NULL,
    [START_DATE_WO]                  VARCHAR (15)  NULL,
    [END_DATE]                       VARCHAR (15)  NULL,
    [COMPLETION_CERTIFICATE]         VARCHAR (25)  NULL,
    [BOM_NOTES]                      VARCHAR (12)  NULL,
    [WO_BATCH]                       VARCHAR (10)  NULL,
    [BOM_ACTION]                     VARCHAR (12)  NULL,
    [WORKS_ORDER_DOCKET]             VARCHAR (25)  NULL,
    [KITTING_LIST]                   VARCHAR (15)  NULL,
    [LATEST_STAGE]                   VARCHAR (20)  NULL,
    [NEXT_STAGE]                     VARCHAR (15)  NULL,
    [PURGE_WORKS_ORDERS_TEXT]        VARCHAR (55)  NULL,
    [MANUFACTURE]                    VARCHAR (15)  NULL,
    [COMPONENT]                      VARCHAR (15)  NULL,
    [COMPONENTS]                     VARCHAR (15)  NULL,
    [LABOUR]                         VARCHAR (10)  NULL,
    [PER_UNIT]                       VARCHAR (15)  NULL,
    [ASSOCIATED]                     VARCHAR (15)  NULL,
    [CANCELLATION_OF_WORKS_ORDERS]   VARCHAR (30)  NULL,
    [THE_FOLLOWING_CHILD_WO_TEXT]    VARCHAR (80)  NULL,
    [CANCELLING_THE_WO_TEXT]         VARCHAR (100) NULL,
    [ITEM_CODE_DESCRIPTION_TEXT]     VARCHAR (25)  NULL,
    [ISSUED]                         VARCHAR (10)  NULL,
    [IN_PRODUCTION]                  VARCHAR (15)  NULL,
    [WRITE_OFF]                      VARCHAR (10)  NULL,
    [RETURN_WRITE_OFF_DETAILS_TEXT]  VARCHAR (30)  NULL,
    [COST_ANALYSIS]                  VARCHAR (15)  NULL,
    [RAISE_REQUEST_TO_PURCHASE_TEXT] VARCHAR (40)  NULL,
    [ESTIMATED_COST]                 VARCHAR (18)  NULL,
    [ACTUAL_COST]                    VARCHAR (18)  NULL,
    [COST_TO_COMPLETE]               VARCHAR (18)  NULL,
    [RETURNED]                       VARCHAR (10)  NULL,
    [WO_SETTINGS]                    VARCHAR (15)  NULL,
    [CERTIFICATE]                    VARCHAR (15)  NULL,
    [PRODUCTION]                     VARCHAR (15)  NULL,
    [FINISH_DATE]                    VARCHAR (15)  NULL,
    [WO_CANCELLATION_MOVEMENT_TEXT]  VARCHAR (40)  NULL,
    [MERGED]                         VARCHAR (10)  NULL,
    [APPLY]                          VARCHAR (10)  NULL,
    [TO_ISSUE]                       VARCHAR (12)  NULL,
    [PARENT]                         VARCHAR (15)  NULL,
    [NOT_YET_STARTED]                VARCHAR (20)  NULL,
    [CREATION_WIZARD]                VARCHAR (20)  NULL,
    [SELECT_YOUR_METHOD]             VARCHAR (35)  NULL,
    [BUILD_BASED_UPON]               VARCHAR (40)  NULL,
    [REPLENISHMENT]                  VARCHAR (18)  NULL,
    [BUILDING_FOR_STOCK]             VARCHAR (25)  NULL,
    [WO_WIZ_TEXT]                    VARCHAR (160) NULL,
    [STOCK_REC_LEVELS]               VARCHAR (30)  NULL,
    [SUGGESTION_RULES]               VARCHAR (30)  NULL,
    [SUPPLEMENTARY_INFORMATION]      VARCHAR (30)  NULL,
    [SUGGESTED_QUANTITIES]           VARCHAR (30)  NULL,
    [SUGGESTED_WORKS_ORDERS]         VARCHAR (30)  NULL,
    [ACTION_REPORT]                  VARCHAR (30)  NULL,
    [WO_WIZ_H2_2_SOP]                VARCHAR (200) NULL,
    [WO_WIZ_H2_3]                    VARCHAR (200) NULL,
    [WO_WIZ_H2_4]                    VARCHAR (200) NULL,
    [WO_WIZ_H2_5_SOP]                VARCHAR (200) NULL,
    [WO_WIZ_H2_6]                    VARCHAR (200) NULL,
    [WO_WIZ_H2_7]                    VARCHAR (200) NULL,
    [WO_WIZ_H2_2_BUILD]              VARCHAR (200) NULL,
    [WO_WIZ_H2_2_REPLENISH]          VARCHAR (200) NULL,
    [WO_WIZ_H2_5]                    VARCHAR (200) NULL,
    [AUTO_ALLOC_COMP]                VARCHAR (50)  NULL,
    [ALWAYS_SELECT_DEFAULT]          VARCHAR (50)  NULL,
    [COMBINE_SOP_REQ]                VARCHAR (80)  NULL,
    [FINISH_DATE_TOLERANCE]          VARCHAR (25)  NULL,
    [CONSIDER_FREE_STOCK]            VARCHAR (60)  NULL,
    [CONSIDER_FREE_WIP]              VARCHAR (50)  NULL,
    [UPGRADE_SUGGESTION]             VARCHAR (30)  NULL,
    [STOCK_HOLDING_QTY]              VARCHAR (30)  NULL,
    [IGNORE]                         VARCHAR (10)  NULL,
    [BRING]                          VARCHAR (10)  NULL,
    [SET_PROD_PRI_AS]                VARCHAR (30)  NULL,
    [HIGHEST]                        VARCHAR (15)  NULL,
    [LOWEST]                         VARCHAR (15)  NULL,
    [STOCK_ALLOC_PRI]                VARCHAR (30)  NULL,
    [USE_SPECIFIC_ROUTE]             VARCHAR (25)  NULL,
    [INCLUDE_IN_WO_NOTES]            VARCHAR (40)  NULL,
    [NOTES_FROM_THE_BOM]             VARCHAR (25)  NULL,
    [ADDITIONAL]                     VARCHAR (15)  NULL,
    [SET_TEXT]                       VARCHAR (6)   NULL,
    [EARLIEST]                       VARCHAR (12)  NULL,
    [REQUIREMENT]                    VARCHAR (15)  NULL,
    [MIN_TEXT]                       VARCHAR (5)   NULL,
    [MAX_TEXT]                       VARCHAR (5)   NULL,
    [TOP_LEVEL]                      VARCHAR (15)  NULL,
    [ASSOCIATE]                      VARCHAR (12)  NULL,
    [MATERIALS]                      VARCHAR (15)  NULL,
    [TARGET_QTY]                     VARCHAR (15)  NULL,
    [ALREADY_BUILT]                  VARCHAR (15)  NULL,
    [AUTO_ISSUE]                     VARCHAR (70)  NULL,
    [BACKFLUSH]                      VARCHAR (12)  NULL,
    [NON_STOCK_ITEMS]                VARCHAR (20)  NULL,
    [DOCKET]                         VARCHAR (10)  NULL,
    [SO_ALLOC_REQ]                   VARCHAR (80)  NULL,
    [HAS_PRODUCED]                   VARCHAR (15)  NULL,
    [ALLOCATE_NOW]                   VARCHAR (15)  NULL,
    [BALANCE_RELEASED]               VARCHAR (35)  NULL,
    [FIN_GOODS_AVAILABLE]            VARCHAR (55)  NULL,
    [POSSIBLE]                       VARCHAR (12)  NULL,
    [EXCESS]                         VARCHAR (10)  NULL,
    [DOCKETS]                        VARCHAR (10)  NULL,
    [QUANTITY_TO_SCRAP]              VARCHAR (50)  NULL,
    [SCRAP]                          VARCHAR (10)  NULL,
    [COMPONENTS_PER_ASSEMBLY]        VARCHAR (50)  NULL,
    [SHOW_WO_ONLY_M]                 VARCHAR (30)  NULL,
    [A]                              VARCHAR (10)  NULL,
    [REMAINDER]                      VARCHAR (15)  NULL,
    CONSTRAINT [LANGCODE_WO_PK] PRIMARY KEY CLUSTERED ([LANGCODE_WO] ASC) WITH (FILLFACTOR = 70)
);

