CREATE TABLE [dbo].[CO2_CONVERSIONS] (
    [CCNV_PRIMARY]           INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [CCNV_EFFECTIVE_DATE]    DATETIME        NOT NULL,
    [CCNV_CLASS_LINK]        INT             NOT NULL,
    [CCNV_UOM_LINK]          FLOAT (53)      NOT NULL,
    [CCNV_CONVERSION_FACTOR] FLOAT (53)      NOT NULL,
    [CCNV_UPLIFT]            DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [CCNV_USER_PUTIN]        VARCHAR (4)     NOT NULL,
    [CCNV_DATE_PUTIN]        DATETIME        DEFAULT (getdate()) NOT NULL,
    [CCNV_USER_EDITED]       VARCHAR (4)     NULL,
    [CCNV_DATE_EDITED]       DATETIME        NULL,
    [CCNV_SOURCE]            VARCHAR (1)     NULL,
    [CCNV_VERSION_LINK]      INT             DEFAULT ((2)) NOT NULL,
    CONSTRAINT [CCNV_PRIMARY_PK] PRIMARY KEY NONCLUSTERED ([CCNV_PRIMARY] ASC),
    CONSTRAINT [CCNV_EFFECTIVE_DATE_CK] CHECK ([CCNV_EFFECTIVE_DATE]=CONVERT([datetime],floor(CONVERT([float],[CCNV_EFFECTIVE_DATE],0)),0)),
    CONSTRAINT [CCNV_CLASS_LINK_FK] FOREIGN KEY ([CCNV_CLASS_LINK]) REFERENCES [dbo].[CO2_CLASSIFICATIONS] ([CCLS_PRIMARY]),
    CONSTRAINT [CCNV_UOM_LINK_FK] FOREIGN KEY ([CCNV_UOM_LINK]) REFERENCES [dbo].[SYS_LOOKUP_TEXT] ([TXT_PRIMARY])
);


GO
CREATE UNIQUE CLUSTERED INDEX [CCNV_EFFECTIVE_DATE_CCNV_CLASS_LINK_CCNV_UOM_LINK]
    ON [dbo].[CO2_CONVERSIONS]([CCNV_EFFECTIVE_DATE] ASC, [CCNV_CLASS_LINK] ASC, [CCNV_UOM_LINK] ASC);


GO
create trigger AA_CO2_CONVERSIONS_IOUT
/*
** Trigger to:
**    1) Validate link to row in SYS_LOOKUP_TEXT. Because SYS_LOOKUP_TEXT is a multi-purpose table it isn't
**       sufficient to check that the row exists in SYS_LOOKUP_TEXT - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as an Accounting for Carbon Emissions Unit of Measure which
**       is identified by the TXT_ORIGIN field. In order to implement this via a foriegn key would have required
**       a computed column on the CO2_CONVERSIONS table containing the constant "CO2UOM". It was decided in discussion
**       with NC & JS that an instead of trigger would be preferable.
**    2) To ensure the effective date is stored purely as a date. The datetime that is sent to the table for updating
**       is intercepted by this trigger and has it's time removed. This is achieved by converting the date to an
**       integer and back to a date again. As a numeric datetime fields store their times as fractions (values after
**       the decimal point)
**
** The trigger fires instead of the update so it must explicitly perform the update if the test is passed.
**
** Written     :  08/01/2008 DB
** Last Amended:  08/02/2008 DB
*/
on CO2_CONVERSIONS
instead of update

as
begin
   if exists   -- Check that the row linked to in SYS_LOOKUP_TEXT is an Accounting for Carbon Emissions Unit of Measure
      (
         select
            1
            from
               inserted
                  inner join SYS_LOOKUP_TEXT with(nolock)   on       TXT_PRIMARY = CCNV_UOM_LINK
                                                               and   TXT_ORIGIN <> 'CO2UOM'
      )
      begin
         raiserror('The Unit of Measure link doesn''t exists in SYS_LOOKUP_TEXT as a Unit of Measure',16,1)
         if @@trancount>0
            rollback tran
      end
   else
      update CO2_CONVERSIONS
         set
            CCNV_EFFECTIVE_DATE     = dbo.AA_STRIP_TIME_FROM_DATE_F(inserted.CCNV_EFFECTIVE_DATE) -- Remove the time from the effective date field
         ,  CCNV_CLASS_LINK         = inserted.CCNV_CLASS_LINK
         ,  CCNV_UOM_LINK           = inserted.CCNV_UOM_LINK
         ,  CCNV_CONVERSION_FACTOR  = inserted.CCNV_CONVERSION_FACTOR
         ,  CCNV_UPLIFT             = inserted.CCNV_UPLIFT
         ,  CCNV_USER_EDITED        = inserted.CCNV_USER_EDITED
         ,  CCNV_DATE_EDITED        = inserted.CCNV_DATE_EDITED
         -- Source and version deliberately excluded - they shouldn't be updated
         from
            inserted
               inner join CO2_CONVERSIONS CONV  on CONV.CCNV_PRIMARY = inserted.CCNV_PRIMARY
end
GO
create trigger AA_CO2_CONVERSIONS_IOIT
/*
** Trigger to:
**    1) Validate link to row in SYS_LOOKUP_TEXT. Because SYS_LOOKUP_TEXT is a multi-purpose table it isn't
**       sufficient to check that the row exists in SYS_LOOKUP_TEXT - which is enforced by the foreign key.
**       The link needs to be to a row that has been stored as an Accounting for Carbon Emissions Unit of Measure which
**       is identified by the TXT_ORIGIN field. In order to implement this via a foriegn key would have required
**       a computed column on the CO2_CONVERSIONS table containing the constant "CO2UOM". It was decided in discussion
**       with NC & JS that an instead of trigger would be preferable.
**    2) To ensure the effective date is stored purely as a date. The datetime that is sent to the table for inserting
**       is intercepted by this trigger and has it's time removed. This is achieved by converting the date to an
**       integer and back to a date again. As a numeric datetime fields store their times as fractions (values after
**       the decimal point)
**
** The trigger fires instead of the insert so it must explicitly perform the insert if the test is passed.
**
** Written     :  08/01/2008 DB
** Last Amended:  08/02/2008 DB, 28/06/2010 DB
*/
on CO2_CONVERSIONS
instead of insert

as
begin
   if exists   -- Check that the row linked to in SYS_LOOKUP_TEXT is an Accounting for Carbon Emissions Unit of Measure
      (
         select
            1
            from
               inserted
                  inner join SYS_LOOKUP_TEXT with(nolock)   on       TXT_PRIMARY = CCNV_UOM_LINK
                                                               and   TXT_ORIGIN <> 'CO2UOM'
      )
      begin
         raiserror('The Unit of Measure link doesn''t exists in SYS_LOOKUP_TEXT as a Unit of Measure',16,1)
         if @@trancount>0
            rollback tran
      end
   else
      insert into CO2_CONVERSIONS
      (
         CCNV_EFFECTIVE_DATE
      ,  CCNV_CLASS_LINK
      ,  CCNV_UOM_LINK
      ,  CCNV_CONVERSION_FACTOR
      ,  CCNV_UPLIFT
      ,  CCNV_USER_PUTIN
      ,  CCNV_DATE_PUTIN
      ,  CCNV_SOURCE
      ,  CCNV_VERSION_LINK
      )
      select
         dbo.AA_STRIP_TIME_FROM_DATE_F(CCNV_EFFECTIVE_DATE) -- Remove the time from the effective date field
      ,  CCNV_CLASS_LINK
      ,  CCNV_UOM_LINK
      ,  CCNV_CONVERSION_FACTOR
      ,  CCNV_UPLIFT
      ,  CCNV_USER_PUTIN
      ,  CCNV_DATE_PUTIN
      ,  CCNV_SOURCE
      ,  CCNV_VERSION_LINK
         from
            inserted
end