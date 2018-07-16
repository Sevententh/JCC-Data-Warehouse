CREATE TABLE [dbo].[POP_ORDER_STATUS] (
    [POS_PRIMARY]        INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [POS_DESCRIPTION]    VARCHAR (20) NOT NULL,
    [POS_SORT_ORDER]     SMALLINT     NOT NULL,
    [POS_RECEIVE]        BIT          DEFAULT ((0)) NOT NULL,
    [POS_INVOICE]        BIT          DEFAULT ((0)) NOT NULL,
    [POS_LEVEL]          TINYINT      NOT NULL,
    [POS_USER_PUTIN]     VARCHAR (4)  NOT NULL,
    [POS_DATE_PUTIN]     DATETIME     DEFAULT (getdate()) NOT NULL,
    [POS_USER_EDITED]    VARCHAR (4)  NULL,
    [POS_DATE_EDITED]    DATETIME     NULL,
    [POS_SYSTEM_DEFAULT] BIT          DEFAULT ((0)) NOT NULL,
    [POS_TYPE]           AS           ([POS_RECEIVE]|power((2),(1))*[POS_INVOICE]),
    CONSTRAINT [POS_PRIMARY_PK] PRIMARY KEY CLUSTERED ([POS_PRIMARY] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [POS_LEVEL_CK] CHECK ([POS_LEVEL]>=(1) AND [POS_LEVEL]<=(99))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POS_DESCRIPTION]
    ON [dbo].[POP_ORDER_STATUS]([POS_DESCRIPTION] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POS_SORT_ORDER]
    ON [dbo].[POP_ORDER_STATUS]([POS_SORT_ORDER] ASC) WITH (FILLFACTOR = 70);


GO
create trigger AA_POP_ORDER_STATUS_IOUT
/*
** Trigger to restrict changes to system default rows.
**
** Written     :  20/07/2010 DB
** Last Amended:
*/
on POP_ORDER_STATUS
instead of update

as

if exists
   (
      select
         1
         from
            inserted  ins
               inner join POP_ORDER_STATUS  POS on POS.POS_PRIMARY = ins.POS_PRIMARY
         where
            ins.POS_RECEIVE         <> POS.POS_RECEIVE
            or
            ins.POS_INVOICE         <> POS.POS_INVOICE
            or
            ins.POS_LEVEL           <> POS.POS_LEVEL
            or
            ins.POS_SYSTEM_DEFAULT  <> POS.POS_SYSTEM_DEFAULT
   )
   raiserror('System defaults can only have their description or sort order changed.',0,1)   -- Just a warning, don't stop. Update will ignore invalid
                                                                                             -- changes.

update POP_ORDER_STATUS
   set
      POS_DESCRIPTION   =  ins.POS_DESCRIPTION
   ,  POS_SORT_ORDER    =  ins.POS_SORT_ORDER
   ,  POS_RECEIVE       =  case POS.POS_SYSTEM_DEFAULT
                              when 0 then ins.POS_RECEIVE
                              else
                                 POS.POS_RECEIVE
                           end
   ,  POS_INVOICE       =  case POS.POS_SYSTEM_DEFAULT
                              when 0 then ins.POS_INVOICE
                              else
                                 POS.POS_INVOICE
                           end
   ,  POS_LEVEL         =  case POS.POS_SYSTEM_DEFAULT
                              when 0 then ins.POS_LEVEL
                              else
                                 POS.POS_LEVEL
                           end
   ,  POS_SYSTEM_DEFAULT=  case POS.POS_SYSTEM_DEFAULT
                              when 0 then ins.POS_SYSTEM_DEFAULT
                              else
                                 POS.POS_SYSTEM_DEFAULT
                           end
   ,  POS_USER_EDITED   =  ins.POS_USER_EDITED
   ,  POS_DATE_EDITED   =  getdate()
   from
      POP_ORDER_STATUS  POS
         inner join inserted  ins on ins.POS_PRIMARY = POS.POS_PRIMARY
GO
create trigger AA_POP_ORDER_STATUS_IODT
/*
** Trigger to prevent deletion of rows.
**
** Written     :  20/07/2010 DB
** Last Amended:
*/
on POP_ORDER_STATUS
instead of delete

as

if exists
   (
      select
         1
         from
            deleted
         where
            POS_SYSTEM_DEFAULT = 1
   )
   raiserror('Purchase order statuses which are system defaults cannot be deleted.',16,1)

delete from POP_ORDER_STATUS
   from
      deleted del
         inner join POP_ORDER_STATUS POS on POS.POS_PRIMARY = del.POS_PRIMARY
   where
      POS.POS_SYSTEM_DEFAULT <> 1