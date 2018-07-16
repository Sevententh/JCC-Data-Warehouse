CREATE TABLE [dbo].[ORD_HEADER2] (
    [OH_PRIMARY_2]     FLOAT (53)    NOT NULL,
    [OH_CHAR1]         VARCHAR (20)  NULL,
    [OH_CHAR2]         VARCHAR (20)  NULL,
    [OH_CHAR3]         VARCHAR (100) NULL,
    [OH_CHAR4]         VARCHAR (100) NULL,
    [OH_FLAG1]         TINYINT       DEFAULT ((0)) NULL,
    [OH_FLAG2]         TINYINT       DEFAULT ((0)) NULL,
    [OH_DATE1]         DATETIME      NULL,
    [OH_DATE2]         DATETIME      NULL,
    [OH_NUM1]          FLOAT (53)    DEFAULT ((0)) NULL,
    [OH_NUM2]          FLOAT (53)    DEFAULT ((0)) NULL,
    [OH_USRCHAR1]      VARCHAR (20)  NULL,
    [OH_USRCHAR2]      VARCHAR (20)  NULL,
    [OH_USRCHAR3]      VARCHAR (100) NULL,
    [OH_USRCHAR4]      VARCHAR (100) NULL,
    [OH_USRFLAG1]      TINYINT       DEFAULT ((0)) NULL,
    [OH_USRFLAG2]      TINYINT       DEFAULT ((0)) NULL,
    [OH_USRDATE1]      DATETIME      NULL,
    [OH_USRDATE2]      DATETIME      NULL,
    [OH_USRNUM1]       FLOAT (53)    DEFAULT ((0)) NULL,
    [OH_USRNUM2]       FLOAT (53)    DEFAULT ((0)) NULL,
    [OH_EDI_FLAG]      TINYINT       DEFAULT ((0)) NULL,
    [OH_EDI_POP_ORDNO] VARCHAR (10)  NULL,
    CONSTRAINT [OH_PRIMARY_2_PK] PRIMARY KEY CLUSTERED ([OH_PRIMARY_2] ASC)
);


GO

-- ****************************
-- Trigger - UDEF_TR_QUOTE_REVISION_INSERT
-- Customer - JCC Lighting Products
-- Project - Quote history data for report writing purposes by JCC 
-- Copyright Access UK
-- Last Modified - Ian Sorrell - 18/10/2012
-- Version 1.0
-- ****************************

create TRIGGER [dbo].[UDEF_TR_QUOTE_REVISION_INSERT] ON [dbo].[ORD_HEADER2] FOR INSERT AS 
 
  DECLARE   
   @oh_primary2 int,
   @oh_priority int
   --@oh_usrnum1 float

   
   
   select
    
   @oh_primary2=OH_PRIMARY_2

   
   from inserted 
   
   --select @oh_priority from ORD_HEADER where OH_PRIMARY = @oh_primary2 
   
   --IF @oh_priority = 4
     -- begin
          if @oh_primary2 <>0
            Begin
               Begin tran  
                           
                          Update ORD_HEADER2 set OH_USRNUM1 = 1 where OH_PRIMARY_2 = @oh_primary2
                    
               Commit tran
            End 
      --end
           

