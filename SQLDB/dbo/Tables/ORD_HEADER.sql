CREATE TABLE [dbo].[ORD_HEADER] (
    [OH_TYPE]                  VARCHAR (1)     NULL,
    [OH_STATUS]                TINYINT         DEFAULT ((0)) NULL,
    [OH_HEADER_REF]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_ORDER_REF]             VARCHAR (20)    NULL,
    [OH_INV_DATE]              DATETIME        NULL,
    [OH_INV_PERIOD]            TINYINT         DEFAULT ((0)) NULL,
    [OH_INV_YEAR]              VARCHAR (1)     NULL,
    [OH_ORIGIN]                VARCHAR (1)     NULL,
    [OH_DESCRIPTION]           VARCHAR (30)    NULL,
    [OH_YEAR]                  VARCHAR (1)     NULL,
    [OH_PERIOD]                TINYINT         DEFAULT ((0)) NULL,
    [OH_DATE]                  DATETIME        NULL,
    [OH_REQUIREDDATE]          DATETIME        NULL,
    [OH_COMPLETEDATE]          DATETIME        NULL,
    [OH_WORK_STATUS]           VARCHAR (20)    NULL,
    [OH_NETT]                  FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_NETT_C]                FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_VAT]                   FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_TAX_C]                 FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_GROSS]                 FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_GROSS_C]               FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DISC_LINE_P]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_T_DISCVAL]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_T_DISCVAL_C]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DISC_TOTAL_P]          FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_SETT_DISC_1]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_SETT_DISC_2]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_SETT_DAYS_1]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_SETT_DAYS_2]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_L_DISCVAL]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_L_DISCVAL_C]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_CURRENCYRATE]          FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_CURRENCYCODE]          VARCHAR (4)     NULL,
    [OH_CURRENCYRTCH]          TINYINT         DEFAULT ((0)) NULL,
    [OH_EXPORT_CODE]           VARCHAR (1)     NULL,
    [OH_EC_DEL_TERMS]          VARCHAR (3)     NULL,
    [OH_EC_T_NATURE]           VARCHAR (2)     NULL,
    [OH_EC_T_MODE]             VARCHAR (1)     NULL,
    [OH_DEL_NOTUSED]           VARCHAR (3)     NULL,
    [OH_DEL_CHARGE]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DEL_CHG_PCNT]          FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DEL_METHOD]            VARCHAR (20)    NULL,
    [OH_DEL_NOTE_NO]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DEL_DATE]              DATETIME        NULL,
    [OH_COPY_DEL_NO]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_MIN_VAL]               FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DUE_DAYS]              FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_TERMS]                 VARCHAR (40)    NULL,
    [OH_A_P_DAYS]              FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_PRICE_KEY]             TINYINT         DEFAULT ((0)) NULL,
    [OH_INV_ADD]               FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DEL_ADD]               FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_AUTHORISE]             VARCHAR (10)    NULL,
    [OH_CARD_EXPIRY]           VARCHAR (5)     NULL,
    [OH_BANK_ANLYSIS]          VARCHAR (25)    NULL,
    [OH_NORMAL_ORD]            TINYINT         DEFAULT ((0)) NULL,
    [OH_NO_OF_LINES]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_LINES_INVD]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_LINES_DELVD]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_NO_PARTDEL]            TINYINT         DEFAULT ((0)) NULL,
    [OH_INV_VALUE]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_DEL_VALUE]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_ARCHIVE]               TINYINT         DEFAULT ((0)) NULL,
    [OH_PRIORITY]              TINYINT         DEFAULT ((0)) NULL,
    [OH_QUERY_FLAG]            TINYINT         DEFAULT ((0)) NULL,
    [OH_INVDEL_NOTES]          TEXT            NULL,
    [OH_INTERNL_NOTE]          TEXT            NULL,
    [OH_LAST_ACTION]           VARCHAR (1)     NULL,
    [OH_USER_PUTIN]            VARCHAR (4)     NULL,
    [OH_DATE_PUTIN]            DATETIME        NULL,
    [OH_MU_USER]               VARCHAR (4)     NULL,
    [OH_MU_STATUS]             VARCHAR (1)     NULL,
    [OH_MU_LOCK]               TINYINT         DEFAULT ((0)) NULL,
    [OH_CUSORT]                VARCHAR (20)    NULL,
    [OH_USER1]                 VARCHAR (20)    NULL,
    [OH_USER2]                 VARCHAR (20)    NULL,
    [OH_USER3]                 VARCHAR (20)    NULL,
    [OH_ACC_STATUS]            VARCHAR (11)    NULL,
    [OH_BATCH_FLAG]            TINYINT         DEFAULT ((0)) NULL,
    [OH_BATCH_REF]             VARCHAR (10)    NULL,
    [OH_BATCH_POSTED]          VARCHAR (1)     NULL,
    [OH_PROBABILITY]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_INV_STATUS]            TINYINT         DEFAULT ((0)) NULL,
    [OH_DEL_STATUS]            TINYINT         DEFAULT ((0)) NULL,
    [OH_PROFORM_DATE]          DATETIME        NULL,
    [OH_CONFIRMED]             TINYINT         DEFAULT ((0)) NULL,
    [OH_EST_DATE]              DATETIME        NULL,
    [OH_QUOTE_DATE]            DATETIME        NULL,
    [OH_EQ_STATUS]             VARCHAR (1)     NULL,
    [OH_STAT_DATE]             DATETIME        NULL,
    [OH_ORDER_NUMBER]          FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_LEDGER]                VARCHAR (2)     NULL,
    [OH_ACCOUNT]               VARCHAR (10)    NULL,
    [OH_REBUILDNUM]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_PRIMARY]               FLOAT (53)      NOT NULL,
    [OH_SUB_LEDGER]            VARCHAR (10)    NULL,
    [OH_URGENT_FLAG]           TINYINT         DEFAULT ((0)) NULL,
    [OH_NETT_BASE2]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_VAT_BASE2]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_GROSS_BASE2]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_L_DISC_BASE2]          FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_T_DISC_BASE2]          FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_BASE2_RATE]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_TRI_RATE1]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_BASE2_RATECHNG]        TINYINT         DEFAULT ((0)) NULL,
    [OH_TRI_RATECHNG1]         TINYINT         DEFAULT ((0)) NULL,
    [OH_INV_VAL_BASE2]         FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_OS_INVCVAL]            FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_CURR_TYPE]             VARCHAR (1)     NULL,
    [OH_TRI_RATE2]             FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_TRI_RATECHNG2]         TINYINT         DEFAULT ((0)) NULL,
    [OH_SPCL_TRANTYPE]         VARCHAR (20)    NULL,
    [OH_SRV_STATUS]            TINYINT         DEFAULT ((0)) NULL,
    [OH_TRAN_OPTIONS]          VARCHAR (30)    NULL,
    [OH_SOURCE]                VARCHAR (1)     NULL,
    [OH_SWITCH_ISSUE_NO]       VARCHAR (2)     NULL,
    [OH_SWITCH_ISSUE_DATE]     VARCHAR (5)     NULL,
    [OH_CARD_TYPE]             VARCHAR (1)     NULL,
    [OH_XML_CNF_SENT]          TINYINT         DEFAULT ((0)) NULL,
    [OH_XML_INV_SENT]          INT             DEFAULT ((0)) NULL,
    [OH_ACCOUNT_ORDER]         VARCHAR (10)    NULL,
    [OH_ACCOUNT_DELIVERY]      VARCHAR (10)    NULL,
    [OH_CARDHOLDER_NAME]       VARCHAR (40)    NULL,
    [OH_ESTIMATE_DROP_DATE]    DATETIME        NULL,
    [OH_CAMPAIGN_LINK]         INT             NULL,
    [OH_REVERSE_VAT]           FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_REVERSE_VAT_BASE2]     FLOAT (53)      DEFAULT ((0)) NULL,
    [OH_CREDIT_CONTROLLER]     VARCHAR (4)     NULL,
    [OH_CARD_VISIBLE_DIGITS]   VARCHAR (4)     NULL,
    [OH_CARD_ENCRYPTED_DIGITS] VARBINARY (256) NULL,
    [OH_CARD_SECURITY_DIGITS]  VARBINARY (256) NULL,
    [OH_NOM_CAT_LINK]          INT             NULL,
    [OH_YEAR_LINK]             SMALLINT        NULL,
    [OH_USER_EDITED]           VARCHAR (4)     NULL,
    [OH_DATE_EDITED]           DATETIME        NULL,
    [OH_FORCED_STATUS]         TINYINT         NULL,
    [OH_WFF_APPROVAL_STATUS]   SMALLINT        DEFAULT ((0)) NULL,
    [OH_CREDIT_CARD]           AS              (case isnull([OH_CARD_VISIBLE_DIGITS],'') when '' then '' else 'XXXX XXXX XXXX '+[OH_CARD_VISIBLE_DIGITS] end),
    [OH_NATWEST_REF]           AS              (nullif('','')),
    CONSTRAINT [OH_PRIMARY_PK] PRIMARY KEY CLUSTERED ([OH_PRIMARY] ASC),
    CONSTRAINT [OH_CARD_ENCRYPTED_DIGITS_CK] CHECK (isnull([OH_CARD_VISIBLE_DIGITS],'')='' AND [OH_CARD_ENCRYPTED_DIGITS] IS NULL OR isnull([OH_CARD_VISIBLE_DIGITS],'')<>'' AND [OH_CARD_ENCRYPTED_DIGITS] IS NOT NULL AND datalength([OH_CARD_ENCRYPTED_DIGITS])=(256)),
    CONSTRAINT [OH_CARD_SECURITY_DIGITS_CK] CHECK ([OH_CARD_SECURITY_DIGITS] IS NULL OR datalength([OH_CARD_SECURITY_DIGITS])=(256)),
    CONSTRAINT [OH_CARD_VISIBLE_DIGITS_CK] CHECK ([OH_CARD_VISIBLE_DIGITS] IS NULL OR len([OH_CARD_VISIBLE_DIGITS])=(0) OR len([OH_CARD_VISIBLE_DIGITS])=(4) AND isnumeric([OH_CARD_VISIBLE_DIGITS])=(1)),
    CONSTRAINT [OH_YEAR_LINK_CK] CHECK ([OH_YEAR] IS NOT NULL AND (upper([OH_YEAR])='O' OR upper([OH_YEAR])='N' OR upper([OH_YEAR])='C' OR upper([OH_YEAR])='L') AND [OH_YEAR_LINK] IS NOT NULL OR ([OH_YEAR] IS NULL OR (upper([OH_YEAR])='O' OR upper([OH_YEAR])='')) AND [OH_YEAR_LINK] IS NULL),
    CONSTRAINT [OH_NOM_CAT_LINK_FK] FOREIGN KEY ([OH_NOM_CAT_LINK]) REFERENCES [dbo].[NL_CATEGORIES] ([NCAT_PRIMARY]),
    CONSTRAINT [OH_YEAR_LINK_FK] FOREIGN KEY ([OH_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [OH_ACCOUNT]
    ON [dbo].[ORD_HEADER]([OH_ACCOUNT] ASC);


GO
CREATE NONCLUSTERED INDEX [OH_ACC_STATUS]
    ON [dbo].[ORD_HEADER]([OH_ACC_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [OH_BATCH_FLAG]
    ON [dbo].[ORD_HEADER]([OH_BATCH_FLAG] ASC)
    INCLUDE([OH_ORDER_NUMBER]);


GO
CREATE NONCLUSTERED INDEX [OH_BATCH_REF]
    ON [dbo].[ORD_HEADER]([OH_BATCH_REF] ASC);


GO
CREATE NONCLUSTERED INDEX [OH_CAMPAIGN_LINK]
    ON [dbo].[ORD_HEADER]([OH_CAMPAIGN_LINK] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [OH_ORDER_NUMBER]
    ON [dbo].[ORD_HEADER]([OH_ORDER_NUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [OH_ORDER_REF]
    ON [dbo].[ORD_HEADER]([OH_ORDER_REF] ASC);


GO
CREATE NONCLUSTERED INDEX [OH_PRIORITY]
    ON [dbo].[ORD_HEADER]([OH_PRIORITY] ASC);


GO
CREATE NONCLUSTERED INDEX [OH_TYPE]
    ON [dbo].[ORD_HEADER]([OH_TYPE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ORD_HEADER_OH_ACCOUNT_ORDER_OH_STATUS]
    ON [dbo].[ORD_HEADER]([OH_ACCOUNT_ORDER] ASC, [OH_STATUS] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ORD_HEADER_OH_WORK_STATUS_OH_BATCH_FLAG_OH_PRIORITY]
    ON [dbo].[ORD_HEADER]([OH_WORK_STATUS] ASC, [OH_BATCH_FLAG] ASC, [OH_PRIORITY] ASC)
    INCLUDE([OH_MU_USER], [OH_MU_STATUS], [OH_MU_LOCK], [OH_ORDER_NUMBER]);


GO
CREATE NONCLUSTERED INDEX [IX_ORD_HEADER_OH_ACCOUNT_ORDER]
    ON [dbo].[ORD_HEADER]([OH_ACCOUNT_ORDER] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ORD_HEADER_OH_MU_USER_OH_BATCH_FLAG_OH_MU_STATUS]
    ON [dbo].[ORD_HEADER]([OH_MU_USER] ASC, [OH_BATCH_FLAG] ASC, [OH_MU_STATUS] ASC)
    INCLUDE([OH_PRIMARY]);


GO
CREATE TRIGGER [dbo].[aa_ord_header_dt]
    ON [dbo].[ORD_HEADER]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO


-- ****************************
-- Trigger - UDEF_TR_QUOTE_HISTORY_CONVERT
-- Customer - JCC Lighting Products
-- Project - Quote history data for report writing purposes by JCC 
-- Copyright Access UK
-- Last Modified - Ian Sorrell - 19/10/2012
-- Version 1.0
-- ****************************

CREATE TRIGGER [dbo].[UDEF_TR_QUOTE_HISTORY_CONVERT] ON [dbo].[ORD_HEADER] FOR update AS 
 
  DECLARE   
   @oh_primary int,
   @oh_priority int,
   @oh_date datetime,
   @oh_probability float,
   @oh_close_date datetime,
   @oh_requireddate datetime,
   @oh_currencycode varchar(4),
   @oh_customer_mainsort varchar(20),
   @oh_usersort1 varchar(20),
   @oh_usersort2 varchar(20),
   @oh_usersort3 varchar(20),
   @oh_del_add float,
   @oh_no_of_lines float,
   @oh_order_ref varchar(20),
   @oh_description varchar(30),
   @od_stock_code varchar(25),
   @od_qtyord float,
   @od_unitcst float,
   @od_unitcst_c float,
   @od_nett float,
   @od_nett_c float,
   @od_linedisc float,
   @od_reqdate datetime,
   @od_freestock float,
   @od_rtp_flag bit,
   @od_order_number varchar(20),
   @oh_account_order varchar(20),
   @oh_order_number varchar(20),
   @od_primary int,
   @oh_revision_no float,
   @oh_usrnum1 float,
   @oh_user_putin varchar(4),
   @oh_convert_date datetime,
   @sys_freestock_method varchar(1),
   @stk_physical float,
   @stk_order_in float,
   @STK_WO_FREE_WIP_QUANTITY float,
   @STK_WO_WIP_SOP_QUANTITY float,
   @STK_RESERVE_OUT float,
   @STK_WO_ALLOC_QUANTITY float,
   @STK_BACK_ORDER_QTY float,
   @STK_WO_UNALLOC_QUANTITY float,
   @STK_RESERVE_ASM float,
   @Prev_Priority int
   
   
   select
    
   @oh_primary=OH_PRIMARY,
   @oh_priority = OH_PRIORITY,
   @oh_date=oh_date,
   @oh_probability = oh_probability,
   @oh_close_date = oh_estimate_drop_date,
   @oh_requireddate = oh_requireddate,
   @oh_currencycode = oh_currencycode,
   @oh_usersort1 = oh_user1,
   @oh_usersort2 = oh_user2,
   @oh_usersort3 = oh_user3,
   @oh_del_add = oh_del_add,
   @oh_no_of_lines = oh_no_of_lines,
   @oh_order_ref = oh_order_ref,
   @oh_description = oh_description,
   @oh_account_order = oh_account_order,
   @oh_order_number = oh_order_number,
   @oh_user_putin =oh_user_putin
   
   
   from inserted
   
   select @Prev_Priority = oh_priority
   
   from deleted   
     
            
 if @Prev_Priority <> @oh_Priority
                        
   begin  
   
      IF @oh_priority = 0
         select TOP 1 @sys_freestock_method = STK_FREE_METHOD FROM SYS_DATAINFO2 
                     select @oh_usrnum1 = isnull(OH_USRNUM1,0) from ORD_HEADER2 where OH_PRIMARY_2 = @oh_primary
                     set @oh_revision_no = @oh_usrnum1+1     
         begin 
             
            
            declare csr_detail cursor for
            select 
                  od_stock_code,
                  od_stock_code,
                  od_unitcst,
                  od_unitcst_c,
                  od_nett,
                  od_nett_c,
                  od_linedisc,
                  od_reqdate,
                  od_rtp_flag,
                  OD_ORDER_NUMBER,
                  od_primary,
                  od_qtyord,
                  cusort,
                  stk_physical,
                  stk_order_in,
                  STK_WO_FREE_WIP_QUANTITY,
                  STK_WO_WIP_SOP_QUANTITY,
                  STK_RESERVE_OUT,
                  STK_WO_ALLOC_QUANTITY,
                  STK_BACK_ORDER_QTY,
                  STK_WO_UNALLOC_QUANTITY,
                  STK_RESERVE_ASM 
                  
             
               from dbo.ord_detail
             
               INNER JOIN dbo.SL_ACCOUNTS ON dbo.SL_ACCOUNTS.CUCODE = ORD_detail.OD_ACCOUNT
               INNER JOIN dbo.STK_STOCK ON dbo.STK_STOCK.STKCODE = ORD_detail.OD_STOCK_CODE
               
            
               where od_order_number =  @oh_order_number
            
            open csr_detail
            
            fetch next from csr_detail into @od_stock_code, @od_stock_code,@od_unitcst,@od_unitcst_c,@od_nett,@od_nett_c,@od_linedisc,@od_reqdate,@od_rtp_flag,@od_order_number,@od_primary,@od_qtyord,@oh_customer_mainsort,@stk_physical, @stk_order_in,@STK_WO_FREE_WIP_QUANTITY,@STK_WO_WIP_SOP_QUANTITY,@STK_RESERVE_OUT,@STK_WO_ALLOC_QUANTITY,@STK_BACK_ORDER_QTY,@STK_WO_UNALLOC_QUANTITY,@STK_RESERVE_ASM  
            
           --  @oh_convert_date,
           --  @od_freestock   

           
            while @@fetch_status = 0 
              	
               BEGIN

                  Begin tran  
                     
                       IF @sys_freestock_method = 'P'
                           Begin
                              select @od_freestock = @STK_PHYSICAL + @STK_ORDER_IN+@STK_WO_FREE_WIP_QUANTITY+@STK_WO_WIP_SOP_QUANTITY -((@STK_RESERVE_OUT+@STK_WO_ALLOC_QUANTITY) + (@STK_BACK_ORDER_QTY+@STK_WO_UNALLOC_QUANTITY) +@STK_RESERVE_ASM) 
                           End
                       IF @sys_freestock_method = 'F'
                           Begin
                              select @od_freestock = @STK_PHYSICAL -((@STK_RESERVE_OUT+@STK_WO_ALLOC_QUANTITY) + (@STK_BACK_ORDER_QTY+@STK_WO_UNALLOC_QUANTITY)+@STK_RESERVE_ASM)
                           End   
                       IF @sys_freestock_method = 'A'
                           Begin
                              select @od_freestock = @STK_PHYSICAL - ((@STK_RESERVE_OUT+@STK_WO_ALLOC_QUANTITY) +@STK_RESERVE_ASM)
                           End
                       IF @sys_freestock_method = 'O'
                           Begin
                              select @od_freestock = @STK_PHYSICAL + (@STK_ORDER_IN+@STK_WO_FREE_WIP_QUANTITY+@STK_WO_WIP_SOP_QUANTITY) +@STK_RESERVE_ASM	
                           End   
                      if ISNULL(@oh_revision_no,0)>0
                        begin      
                          insert into UDEF_QUOTE_HISTORY 
                          (QTE_HIST_OH_DATE
                          ,QTE_HIST_REV_DATE
                          ,QTE_HIST_PROBABILITY
                          ,QTE_HIST_CLOSE_DATE
                          ,QTE_HIST_OH_REQ_DATE
                          ,QTY_HIST_CURR_CODE
                          ,QTE_HIST_CUST_USER_SORT
                          ,QTE_HIST_OH_USER_SORT1
                          ,QTE_HIST_OH_USER_SORT2
                          ,QTE_HIST_OH_USER_SORT3
                          ,QTE_HIST__DEL_LINENO
                          ,QTE_HIST_NO_OF_LINES
                          ,QTE_HIST_CUST_REF
                          ,QTE_HIST_OH_DESCRIPTION
                          ,QTE_HIST_STOCK_CODE
                          ,QTE_HIST_QUANTITY
                          ,QTE_HIST_HOME_SELL_PRICE
                          ,QTE_HIST_CURR_SELL_PRICE
                          ,QTE_HIST_HOME_NETT_PRICE
                          ,QTE_HIST_CURR_NETT_PRICE
                          ,QTE_HIST_LINE_DISCOUNT
                          ,QTE_HIST_OD_REQ_DATE
                          ,QTE_HIST_FREE_STOCK
                          ,QTE_HIST_WO_FLAG
                          ,QTE_HIST_OH_PRIMARY
                          ,QTE_HIST_ACCOUNT_CODE
                          ,QTE_HIST_ORDER_NUMBER
                          ,QTE_HIST_OD_PRIMARY
                          ,QTE_HIST_REVISION_NO
                          ,QTE_HIST_USER_ID
                          ,QTE_HIST_CONVERT_DATE)
                       values
                           (@oh_date,
                           GETDATE(),
                           @oh_probability ,
                           @oh_close_date ,
                           @oh_requireddate ,
                           @oh_currencycode ,
                           @oh_customer_mainsort ,
                           @oh_usersort1 ,
                           @oh_usersort2 ,
                           @oh_usersort3 ,
                           @oh_del_add ,
                           @oh_no_of_lines ,
                           @oh_order_ref ,
                           @oh_description ,
                           @od_stock_code ,
                           @od_qtyord ,
                           @od_unitcst ,
                           @od_unitcst_c ,
                           @od_nett ,
                           @od_nett_c ,
                           @od_linedisc ,
                           @od_reqdate ,
                           @od_freestock ,
                           @od_rtp_flag ,
                           @oh_primary,
                           @oh_account_order ,
                           @od_order_number ,
                           @od_primary ,
                           @oh_revision_no ,
                           @oh_user_putin ,
                           GETDATE() )
                    end
                       
                       
                 
                 Commit tran

            fetch next from csr_detail into @od_stock_code, @od_stock_code,@od_unitcst,@od_unitcst_c,@od_nett,@od_nett_c,@od_linedisc,@od_reqdate,@od_rtp_flag,@od_order_number,@od_primary,@od_qtyord,@oh_customer_mainsort,@stk_physical, @stk_order_in,@STK_WO_FREE_WIP_QUANTITY,@STK_WO_WIP_SOP_QUANTITY,@STK_RESERVE_OUT,@STK_WO_ALLOC_QUANTITY,@STK_BACK_ORDER_QTY,@STK_WO_UNALLOC_QUANTITY,@STK_RESERVE_ASM  
           end 
           
         close csr_detail
         deallocate csr_detail
    end  
            
end
   
  



GO



-- ****************************
-- Trigger - UDEF_TR_QUOTE_HISTORY_HEADER
-- Customer - JCC Lighting Products
-- Project - Quote history data for report writing purposes by JCC 
-- Copyright Access UK
-- Last Modified - Ian Sorrell - 09/04/2013
-- Version 1.2
-- ****************************

CREATE TRIGGER [dbo].[UDEF_TR_QUOTE_HISTORY_HEADER] ON [dbo].[ORD_HEADER] FOR INSERT AS 
 
  DECLARE   
   @oh_primary int,
   @oh_priority int,
   @oh_date datetime,
   @oh_probability float,
   @oh_close_date datetime,
   @oh_requireddate datetime,
   @oh_currencycode varchar(4),
   @oh_customer_mainsort varchar(20),
   @oh_usersort1 varchar(20),
   @oh_usersort2 varchar(20),
   @oh_usersort3 varchar(20),
   @oh_del_add float,
   @oh_no_of_lines float,
   @oh_order_ref varchar(20),
   @oh_description varchar(30),
   @od_stock_code varchar(25),
   @od_qtyord float,
   @od_unitcst float,
   @od_unitcst_c float,
   @od_nett float,
   @od_nett_c float,
   @od_linedisc float,
   @od_reqdate datetime,
   @od_freestock float,
   @od_rtp_flag bit,
   @od_order_number varchar(20),
   @oh_account_order varchar(20),
--   @oh_order_number varchar(20),
   @oh_order_number int,
   @od_primary int,
   @oh_revision_no float,
   @oh_usrnum1 float,
   @oh_user_putin varchar(4),
   @oh_convert_date datetime,
   @sys_freestock_method varchar(1),
   @stk_physical float,
   @stk_order_in float,
   @STK_WO_FREE_WIP_QUANTITY float,
   @STK_WO_WIP_SOP_QUANTITY float,
   @STK_RESERVE_OUT float,
   @STK_WO_ALLOC_QUANTITY float,
   @STK_BACK_ORDER_QTY float,
   @STK_WO_UNALLOC_QUANTITY float,
   @STK_RESERVE_ASM float

   
   
   select
    
   @oh_primary=OH_PRIMARY,
   @oh_priority = OH_PRIORITY,
   @oh_date=oh_date,
   @oh_probability = oh_probability,
   @oh_close_date = oh_estimate_drop_date,
   @oh_requireddate = oh_requireddate,
   @oh_currencycode = oh_currencycode,
   @oh_usersort1 = oh_user1,
   @oh_usersort2 = oh_user2,
   @oh_usersort3 = oh_user3,
   @oh_del_add = oh_del_add,
   @oh_no_of_lines = oh_no_of_lines,
   @oh_order_ref = oh_order_ref,
   @oh_description = oh_description,
   @oh_account_order = oh_account_order,
   @oh_order_number = oh_order_number,
   @oh_user_putin =oh_user_putin
   
   from inserted
   

   select TOP 1 @sys_freestock_method = STK_FREE_METHOD FROM SYS_DATAINFO2 
   
   
   IF @oh_priority = 4
      
      --select @oh_usrnum1 = isnull(OH_USRNUM1,0) from ORD_HEADER2 where OH_PRIMARY_2 = @oh_primary
      --set @oh_revision_no = @oh_usrnum1+1
      begin 
           
         
         declare csr_detail cursor for
         select 
               od_stock_code,
               od_stock_code,
               od_unitcst,
               od_unitcst_c,
               od_nett,
               od_nett_c,
               od_linedisc,
               od_reqdate,
               od_rtp_flag,
               OD_ORDER_NUMBER,
               od_primary,
               od_qtyord,
               cusort,
               stk_physical,
               stk_order_in,
               STK_WO_FREE_WIP_QUANTITY,
               STK_WO_WIP_SOP_QUANTITY,
               STK_RESERVE_OUT,
               STK_WO_ALLOC_QUANTITY,
               STK_BACK_ORDER_QTY,
               STK_WO_UNALLOC_QUANTITY,
               STK_RESERVE_ASM 
               
          
            from dbo.ord_detail
          
            INNER JOIN dbo.SL_ACCOUNTS ON dbo.SL_ACCOUNTS.CUCODE = ORD_detail.OD_ACCOUNT
            INNER JOIN dbo.STK_STOCK ON dbo.STK_STOCK.STKCODE = ORD_detail.OD_STOCK_CODE
            
         
            where od_order_number =  @oh_order_number
         
         open csr_detail
         
         fetch next from csr_detail into @od_stock_code, @od_stock_code,@od_unitcst,@od_unitcst_c,@od_nett,@od_nett_c,@od_linedisc,@od_reqdate,@od_rtp_flag,@od_order_number,@od_primary,@od_qtyord,@oh_customer_mainsort,@stk_physical, @stk_order_in,@STK_WO_FREE_WIP_QUANTITY,@STK_WO_WIP_SOP_QUANTITY,@STK_RESERVE_OUT,@STK_WO_ALLOC_QUANTITY,@STK_BACK_ORDER_QTY,@STK_WO_UNALLOC_QUANTITY,@STK_RESERVE_ASM  
         
        --  @oh_convert_date,
        --  @od_freestock   

        
         while @@fetch_status = 0 
           	
            BEGIN

                 
                    
                    
                    IF @sys_freestock_method = 'P'
                        Begin
                           select @od_freestock = @STK_PHYSICAL + @STK_ORDER_IN+@STK_WO_FREE_WIP_QUANTITY+@STK_WO_WIP_SOP_QUANTITY -((@STK_RESERVE_OUT+@STK_WO_ALLOC_QUANTITY) + (@STK_BACK_ORDER_QTY+@STK_WO_UNALLOC_QUANTITY) +@STK_RESERVE_ASM) 
                        End
                    IF @sys_freestock_method = 'F'
                        Begin
                           select @od_freestock = @STK_PHYSICAL -((@STK_RESERVE_OUT+@STK_WO_ALLOC_QUANTITY) + (@STK_BACK_ORDER_QTY+@STK_WO_UNALLOC_QUANTITY)+@STK_RESERVE_ASM)
                        End   
                    IF @sys_freestock_method = 'A'
                        Begin
                           select @od_freestock = @STK_PHYSICAL - ((@STK_RESERVE_OUT+@STK_WO_ALLOC_QUANTITY) +@STK_RESERVE_ASM)
                        End
                    IF @sys_freestock_method = 'O'
                        Begin
                           select @od_freestock = @STK_PHYSICAL + (@STK_ORDER_IN+@STK_WO_FREE_WIP_QUANTITY+@STK_WO_WIP_SOP_QUANTITY) +@STK_RESERVE_ASM	
                        End
                           
                Begin tran
                         
                    insert into UDEF_QUOTE_HISTORY 
                    (QTE_HIST_OH_DATE
                    ,QTE_HIST_REV_DATE
                    ,QTE_HIST_PROBABILITY
                    ,QTE_HIST_CLOSE_DATE
                    ,QTE_HIST_OH_REQ_DATE
                    ,QTY_HIST_CURR_CODE
                    ,QTE_HIST_CUST_USER_SORT
                    ,QTE_HIST_OH_USER_SORT1
                    ,QTE_HIST_OH_USER_SORT2
                    ,QTE_HIST_OH_USER_SORT3
                    ,QTE_HIST__DEL_LINENO
                    ,QTE_HIST_NO_OF_LINES
                    ,QTE_HIST_CUST_REF
                    ,QTE_HIST_OH_DESCRIPTION
                    ,QTE_HIST_STOCK_CODE
                    ,QTE_HIST_QUANTITY
                    ,QTE_HIST_HOME_SELL_PRICE
                    ,QTE_HIST_CURR_SELL_PRICE
                    ,QTE_HIST_HOME_NETT_PRICE
                    ,QTE_HIST_CURR_NETT_PRICE
                    ,QTE_HIST_LINE_DISCOUNT
                    ,QTE_HIST_OD_REQ_DATE
                    ,QTE_HIST_FREE_STOCK
                    ,QTE_HIST_WO_FLAG
                    ,QTE_HIST_OH_PRIMARY
                    ,QTE_HIST_ACCOUNT_CODE
                    ,QTE_HIST_ORDER_NUMBER
                    ,QTE_HIST_OD_PRIMARY
                    ,QTE_HIST_REVISION_NO
                    ,QTE_HIST_USER_ID
                    ,QTE_HIST_CONVERT_DATE)
                 values
                     (@oh_date,
                     GETDATE(),
                     @oh_probability ,
                     @oh_close_date ,
                     @oh_requireddate ,
                     @oh_currencycode ,
                     @oh_customer_mainsort ,
                     @oh_usersort1 ,
                     @oh_usersort2 ,
                     @oh_usersort3 ,
                     @oh_del_add ,
                     @oh_no_of_lines ,
                     @oh_order_ref ,
                     @oh_description ,
                     @od_stock_code ,
                     @od_qtyord ,
                     @od_unitcst ,
                     @od_unitcst_c ,
                     @od_nett ,
                     @od_nett_c ,
                     @od_linedisc ,
                     @od_reqdate ,
                     @od_freestock ,
                     @od_rtp_flag ,
                     @oh_primary,
                     @oh_account_order ,
                     @oh_order_number ,
                     @od_primary ,
                     1 ,
                     @oh_user_putin ,
                     @oh_convert_date )
                 
                    
                    
              
              Commit tran

         fetch next from csr_detail into @od_stock_code, @od_stock_code,@od_unitcst,@od_unitcst_c,@od_nett,@od_nett_c,@od_linedisc,@od_reqdate,@od_rtp_flag,@od_order_number,@od_primary,@od_qtyord,@oh_customer_mainsort,@stk_physical, @stk_order_in,@STK_WO_FREE_WIP_QUANTITY,@STK_WO_WIP_SOP_QUANTITY,@STK_RESERVE_OUT,@STK_WO_ALLOC_QUANTITY,@STK_BACK_ORDER_QTY,@STK_WO_UNALLOC_QUANTITY,@STK_RESERVE_ASM  
        end 
        
      close csr_detail
      deallocate csr_detail
      
           
end
   
  




GO


CREATE TRIGGER [dbo].[checkDuplicateCustomerReference]
ON [dbo].[ORD_HEADER]
FOR insert, update AS

declare @oh_order_ref_deleted as varchar(20)
declare @oh_order_ref_inserted as varchar(20)
select @oh_order_ref_deleted = o.oh_order_ref from deleted o;
select @oh_order_ref_inserted = o.oh_order_ref from inserted o;

declare @oh_account_inserted as varchar(10)
select @oh_account_inserted = o.oh_account from inserted o;

if isnull(@oh_order_ref_deleted,'') <> isnull(@oh_order_ref_inserted,'')
begin
      if (select count(*) from ord_header where oh_order_ref = @oh_order_ref_inserted 
            and oh_account = @oh_account_inserted) >= 2 
      BEGIN
            --ROLLBACK;
            declare @message as varchar(200);
            set @message = 'Cannot update sales orders with duplicate customer references: ' + @oh_order_ref_inserted;
            RAISERROR(@message, 16, 1);
      END
end
