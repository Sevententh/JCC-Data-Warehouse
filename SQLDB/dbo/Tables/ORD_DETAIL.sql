CREATE TABLE [dbo].[ORD_DETAIL] (
    [OD_HEADER_REF]            VARCHAR (10)  NULL,
    [OD_ORDER_REF]             VARCHAR (20)  NULL,
    [OD_TYPE]                  VARCHAR (1)   NULL,
    [OD_STATUS]                TINYINT       DEFAULT ((0)) NULL,
    [OD_ENTRY_TYPE]            VARCHAR (1)   NULL,
    [OD_DATE]                  DATETIME      NULL,
    [OD_REQDATE]               DATETIME      NULL,
    [OD_WORK_STATUS]           VARCHAR (20)  NULL,
    [OD_WORK_NOTE]             TEXT          NULL,
    [OD_DETAIL]                VARCHAR (240) NULL,
    [OD_RTP_FLAG]              TINYINT       DEFAULT ((0)) NULL,
    [OD_RTP_POPNO]             VARCHAR (10)  NULL,
    [OD_QTYORD]                FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_QTYDELVD]              FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_QTYINVD]               FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_QTYUNIT]               FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_QTYRESERVED]           FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_QTYPRINTED]            FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_UNITCST]               FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_UNITCST_C]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_NETT]                  FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_NETT_C]                FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_VATCODE]               VARCHAR (4)   NULL,
    [OD_VATAMNT]               FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_TAX_C]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_GROSS]                 FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_GROSS_C]               FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_MATRIXCODE]            VARCHAR (20)  NULL,
    [OD_TABLECODE]             VARCHAR (3)   NULL,
    [OD_LINEDISC]              FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_L_DISCVAL]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_L_DISCVAL_C]           FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_T_DISCVAL]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_T_DISCVAL_C]           FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_COSTPRICE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_SERIALTRACK]           TINYINT       DEFAULT ((0)) NULL,
    [OD_SERIALNO]              VARCHAR (40)  NULL,
    [OD_LOCATN]                VARCHAR (25)  NULL,
    [OD_QUERY]                 TINYINT       DEFAULT ((0)) NULL,
    [OD_ARCHIVE]               TINYINT       DEFAULT ((0)) NULL,
    [OD_PERIOD]                TINYINT       DEFAULT ((0)) NULL,
    [OD_YEAR]                  VARCHAR (1)   NULL,
    [OD_BATCH_FLAG]            TINYINT       DEFAULT ((0)) NULL,
    [OD_BATCH_REF]             VARCHAR (10)  NULL,
    [OD_BATCH_POSTED]          TINYINT       DEFAULT ((0)) NULL,
    [OD_LEDGER]                VARCHAR (2)   NULL,
    [OD_LAST_ACTION]           VARCHAR (1)   NULL,
    [OD_USER_PUTIN]            VARCHAR (4)   NULL,
    [OD_DATE_PUTIN]            DATETIME      NULL,
    [OD_MU_STATUS]             VARCHAR (1)   NULL,
    [OD_ORDER_NUMBER]          FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_ACCOUNT]               VARCHAR (10)  NULL,
    [OD_ANALYSIS]              VARCHAR (25)  NULL,
    [OD_STOCK_CODE]            VARCHAR (25)  NULL,
    [OD_PRICE_CODE]            VARCHAR (16)  NULL,
    [OD_COSTHEADER]            VARCHAR (10)  NULL,
    [OD_COSTCENTRE]            VARCHAR (10)  NULL,
    [OD_PRIMARY]               FLOAT (53)    NOT NULL,
    [OD_EDI_ANA_NUMBER]        VARCHAR (13)  NULL,
    [OD_GROSS_MEMO]            FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_PODLINK]               INT           DEFAULT ((0)) NULL,
    [OD_WARRANTY_MATRIX]       VARCHAR (15)  NULL,
    [OD_WARRANTY_COST]         FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_WARRANTY_TEXT]         TINYINT       DEFAULT ((0)) NULL,
    [OD_DIMENSION1]            VARCHAR (20)  NULL,
    [OD_DIMENSION2]            VARCHAR (20)  NULL,
    [OD_DIMENSION3]            VARCHAR (20)  NULL,
    [OD_UNITCST_BASE2]         FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_NETT_BASE2]            FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_VAT_BASE2]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_GROSS_BASE2]           FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_L_DISC_BASE2]          FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_T_DISC_BASE2]          FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_COSTPRICE_BASE2]       FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_CARRIER_REF]           VARCHAR (50)  NULL,
    [OD_LINE_NUMBER]           FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_USE_COSTPRICE_CONREQ]  TINYINT       DEFAULT ((0)) NULL,
    [OD_STOCK_ANALYSIS]        VARCHAR (25)  NULL,
    [OD_DELIVERY_CHARGE_FLAG]  TINYINT       DEFAULT ((0)) NULL,
    [OD_WO_NUMBER]             INT           NULL,
    [OD_REVERSE_VAT]           FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_REVERSE_VAT_BASE2]     FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_CURR_RTEFLG]           BIT           DEFAULT ((0)) NULL,
    [OD_TRI_RATECHNG1]         BIT           DEFAULT ((0)) NULL,
    [OD_TRI_RATECHNG2]         BIT           DEFAULT ((0)) NULL,
    [OD_BASE2_RATECHNG]        BIT           DEFAULT ((0)) NULL,
    [OD_CURR_RATE]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_TRI_RATE1]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_TRI_RATE2]             FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_BASE2_RATE]            FLOAT (53)    DEFAULT ((0)) NULL,
    [OD_OD_LINK]               FLOAT (53)    NULL,
    [OD_YEAR_LINK]             SMALLINT      NULL,
    [OD_VAT_RATE]              FLOAT (53)    NULL,
    [OD_SERVICE]               BIT           DEFAULT ((0)) NOT NULL,
    [OD_APM_SPL_LIST_LINK]     FLOAT (53)    NULL,
    [OD_APM_SPL_LIST_DET_LINK] FLOAT (53)    NULL,
    [OD_APM_BGF_LINE]          INT           NULL,
    [OD_APM_BGF_BUY_FREE_LINE] VARCHAR (1)   DEFAULT ('') NOT NULL,
    [OD_APM_WOD_LIST_LINK]     FLOAT (53)    NULL,
    [OD_APM_WOD_LIST_DET_LINK] FLOAT (53)    NULL,
    [OD_CURRENCY_PRICE_ENTRY]  BIT           DEFAULT ((0)) NULL,
    [OD_APM_SPL_CUSTOM_PRICE]  BIT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [OD_PRIMARY_PK] PRIMARY KEY CLUSTERED ([OD_PRIMARY] ASC),
    CONSTRAINT [OD_APM_SPL_CUSTOM_PRICE_CK] CHECK ([OD_APM_SPL_CUSTOM_PRICE]=(1) AND [OD_APM_SPL_LIST_LINK] IS NULL OR [OD_APM_SPL_CUSTOM_PRICE]=(0)),
    CONSTRAINT [OD_YEAR_LINK_CK] CHECK ([OD_YEAR] IS NOT NULL AND (upper([OD_YEAR])='O' OR upper([OD_YEAR])='N' OR upper([OD_YEAR])='C' OR upper([OD_YEAR])='L') AND [OD_YEAR_LINK] IS NOT NULL OR ([OD_YEAR] IS NULL OR (upper([OD_YEAR])='O' OR upper([OD_YEAR])='')) AND [OD_YEAR_LINK] IS NULL),
    CONSTRAINT [OD_APM_SPL_LIST_DET_LINK_FK] FOREIGN KEY ([OD_APM_SPL_LIST_DET_LINK]) REFERENCES [dbo].[STK_PRICE_MATRIX_ADV] ([STP_PRIMARY]) ON DELETE SET NULL,
    CONSTRAINT [OD_APM_SPL_LIST_LINK_FK] FOREIGN KEY ([OD_APM_SPL_LIST_LINK]) REFERENCES [dbo].[STK_PRICE_LISTS] ([STH_PRIMARY]),
    CONSTRAINT [OD_APM_WOD_LIST_DET_LINK_FK] FOREIGN KEY ([OD_APM_WOD_LIST_DET_LINK]) REFERENCES [dbo].[STK_PRICE_MATRIX_WOD_DET] ([WODD_PRIMARY]) ON DELETE SET NULL,
    CONSTRAINT [OD_APM_WOD_LIST_LINK_FK] FOREIGN KEY ([OD_APM_WOD_LIST_LINK]) REFERENCES [dbo].[STK_PRICE_LISTS] ([STH_PRIMARY]),
    CONSTRAINT [OD_YEAR_LINK_FK] FOREIGN KEY ([OD_YEAR_LINK]) REFERENCES [dbo].[SYS_YEAR] ([YEAR_PRIMARY])
);


GO
CREATE NONCLUSTERED INDEX [OD_ANALYSIS]
    ON [dbo].[ORD_DETAIL]([OD_ANALYSIS] ASC);


GO
CREATE NONCLUSTERED INDEX [OD_COSTHEADER]
    ON [dbo].[ORD_DETAIL]([OD_COSTHEADER] ASC);


GO
CREATE NONCLUSTERED INDEX [OD_ORDER_NUMBER]
    ON [dbo].[ORD_DETAIL]([OD_ORDER_NUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [OD_PRICE_CODE]
    ON [dbo].[ORD_DETAIL]([OD_PRICE_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [OD_RTP_FLAG]
    ON [dbo].[ORD_DETAIL]([OD_RTP_FLAG] ASC);


GO
CREATE NONCLUSTERED INDEX [OD_STATUS]
    ON [dbo].[ORD_DETAIL]([OD_STATUS] ASC, [OD_ORDER_NUMBER] ASC)
    INCLUDE([OD_STOCK_CODE], [OD_QTYRESERVED], [OD_ENTRY_TYPE], [OD_PODLINK], [OD_QTYINVD], [OD_QTYDELVD]);


GO
CREATE NONCLUSTERED INDEX [OD_STOCK_CODE]
    ON [dbo].[ORD_DETAIL]([OD_STOCK_CODE] ASC, [OD_LOCATN] ASC);


GO
CREATE NONCLUSTERED INDEX [OD_WO_NUMBER]
    ON [dbo].[ORD_DETAIL]([OD_WO_NUMBER] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ORD_DETAIL_OD_STOCK_CODE]
    ON [dbo].[ORD_DETAIL]([OD_STOCK_CODE] ASC)
    INCLUDE([OD_ORDER_NUMBER]);


GO
CREATE NONCLUSTERED INDEX [JCC_MONTHLYSTOCKDEMANDIDEX2]
    ON [dbo].[ORD_DETAIL]([OD_DATE] ASC)
    INCLUDE([OD_TYPE], [OD_QTYORD], [OD_STOCK_CODE]);


GO
CREATE NONCLUSTERED INDEX [TOTALSUMINDEX]
    ON [dbo].[ORD_DETAIL]([OD_TYPE] ASC, [OD_ENTRY_TYPE] ASC, [OD_BATCH_FLAG] ASC, [OD_STATUS] ASC)
    INCLUDE([OD_QTYORD], [OD_QTYDELVD], [OD_QTYUNIT], [OD_QTYRESERVED], [OD_QTYPRINTED], [OD_ORDER_NUMBER], [OD_STOCK_CODE]);


GO
CREATE TRIGGER [dbo].[aa_ord_detail_dt]
    ON [dbo].[ORD_DETAIL]
    WITH ENCRYPTION
    AFTER DELETE
    AS 
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


GO


-- ****************************
-- Trigger - UDEF_TR_QUOTE_HISTORY_DETAIL
-- Customer - JCC Lighting Products
-- Project - Quote history data for report writing purposes by JCC 
-- Copyright Access UK
-- Last Modified - Ian Sorrell - 19/10/2012
-- Version 1.0
-- ****************************

CREATE TRIGGER [dbo].[UDEF_TR_QUOTE_HISTORY_DETAIL] ON [dbo].[ORD_DETAIL] FOR UPDATE,insert AS 
 
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
   @od_order_number int,
   @oh_account_order varchar(20),
   @oh_order_number int,
   @od_primary int,
   @oh_revision_no float,
   @oh_usrnum1 float,
   @oh_user_edited varchar(4),
   @oh_convert_date datetime,
   @od_line_number float,
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
   @Updated bit
   
   
      
    SELECT
    
    @od_stock_code= t1.od_stock_code,
   @od_stock_code = t1.od_stock_code,
   @od_qtyord = t1.od_qtyord,
   @od_unitcst = t1.od_unitcst,
   @od_unitcst_c = t1.od_unitcst_c,
   @od_nett = t1.od_nett,
   @od_nett_c = t1.od_nett_c,
   @od_linedisc = t1.od_linedisc,
   @od_reqdate = t1.od_reqdate,
   @od_rtp_flag = t1.od_rtp_flag,
   @od_order_number = t1.OD_ORDER_NUMBER,
   @od_line_number = t1.od_line_number,
   @od_primary = t1.od_primary,
   @updated = case when t2.OD_PRIMARY IS null then 0 else 1 end
   
    from inserted t1 
    left outer join deleted t2 on t1.OD_PRIMARY=t2.OD_PRIMARY
   
   
   select
    
   @oh_primary=OH_PRIMARY,
   @oh_priority = OH_PRIORITY,
   @oh_date=oh_date,
   @oh_probability = oh_probability,
   @oh_close_date = oh_estimate_drop_date,
   @oh_requireddate = oh_requireddate,
   @oh_currencycode = oh_currencycode,
   @oh_customer_mainsort = cusort,
   @oh_usersort1 = oh_user1,
   @oh_usersort2 = oh_user2,
   @oh_usersort3 = oh_user3,
   @oh_del_add = oh_del_add,
   @oh_no_of_lines = oh_no_of_lines,
   @oh_order_ref = oh_order_ref,
   @oh_description = oh_description,
   @oh_account_order = oh_account_order,
   @oh_order_number = oh_order_number,
   @oh_usrnum1 = oh_usrnum1,
   @oh_user_edited =oh_user_putin
    
   from ord_header 
   INNER JOIN dbo.SL_ACCOUNTS ON dbo.SL_ACCOUNTS.CUCODE = ORD_HEADER.OH_ACCOUNT_ORDER
   INNER JOIN dbo.ORD_HEADER2 ON dbo.ORD_HEADER2.OH_PRIMARY_2 = ORD_HEADER.OH_PRIMARY
   where oh_order_number =  @od_order_number
   
   		select @oh_usrnum1 = isnull(OH_USRNUM1,0) from ORD_HEADER2 where OH_PRIMARY_2 = @oh_primary
   		 if @updated=1
			begin
				set  @oh_revision_no = @oh_usrnum1+1
			end
		if @updated=0
			begin
				set  @oh_revision_no = @oh_usrnum1
			end
		
   select TOP 1 @sys_freestock_method = STK_FREE_METHOD FROM SYS_DATAINFO2
   
   select @stk_physical = stk_physical,
   @stk_order_in = stk_order_in,
   @STK_WO_FREE_WIP_QUANTITY = STK_WO_FREE_WIP_QUANTITY,
   @STK_WO_WIP_SOP_QUANTITY = STK_WO_WIP_SOP_QUANTITY,
   @STK_RESERVE_OUT = STK_RESERVE_OUT,
   @STK_WO_ALLOC_QUANTITY = STK_WO_ALLOC_QUANTITY,
   @STK_BACK_ORDER_QTY = STK_BACK_ORDER_QTY,
   @STK_WO_UNALLOC_QUANTITY = STK_WO_UNALLOC_QUANTITY,
   @STK_RESERVE_ASM = STK_RESERVE_ASM
   
   from STK_STOCK where STKCODE = @od_stock_code   
   
  --  @oh_convert_date,
  --  @od_freestock   

   IF @oh_priority = 4 and @oh_primary<>0
       	
      BEGIN
         Begin Tran
               --select @oh_revision_no = MAX(QTE_HIST_REVISION_NO) from UDEF_QUOTE_HISTORY where QTE_HIST_ORDER_NUMBER = @oh_order_number group by QTE_HIST_ORDER_NUMBER 
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
                  @oh_user_edited ,
                  @oh_convert_date )
                  
                
       
				if  @od_line_number = @oh_no_of_lines
					begin       
					  Update ORD_HEADER2 set OH_USRNUM1 = @oh_revision_no where OH_PRIMARY_2 = @oh_primary
					end
			
         Commit tran     
      END 



