CREATE TABLE [dbo].[CB_AUTOBANKREC_OPTIONS] (
    [ABRO_PRIMARY]               INT        DEFAULT ((1)) NOT NULL,
    [ABRO_TOLERANCE]             FLOAT (53) DEFAULT ((0)) NOT NULL,
    [ABRO_REFERENCE_MATCH]       BIT        DEFAULT ((0)) NOT NULL,
    [ABRO_LOAD_ALL_UNRECONCILED] BIT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ABRO_PRIMARY_PK] PRIMARY KEY CLUSTERED ([ABRO_PRIMARY] ASC),
    CONSTRAINT [ABRO_PRIMARY_CK] CHECK ([ABRO_PRIMARY]=(1))
);


GO
create trigger AA_CB_AUTOBANKREC_OPTIONS_IODT
/*
** Trigger to ensure that Automatic Bank Remittance Options are not deleted
**
** Written     :  18/03/2009 SM
** Last Amended:  
*/
on CB_AUTOBANKREC_OPTIONS
instead of delete

as
begin
   if @@trancount > 0
   	rollback transaction
	raiserror('Data in this Access Options Table cannot be deleted.',16,1)
end
GO
create trigger AA_CB_AUTOBANKREC_OPTIONS_IOIT
/*
** Trigger to ensure that only one record exists in the cash book auto bank rec options table
**
** The trigger fires instead of the insert so it must explicitly perform the insert if the test is passed.
**
** Written     :  13/03/2009 SM
** Last Amended:  
*/
on CB_AUTOBANKREC_OPTIONS
instead of insert

as
begin
   if exists   -- Check that the row linked to in SYS_LOOKUP_TEXT is an Accounting for Carbon Emissions Unit of Measure
      (
         select
            1
            from
               CB_AUTOBANKREC_OPTIONS
      )
      begin
         raiserror('It is only possible to have one row in the table CB_AUTOBANKREC_OPTIONS',16,1)
         if @@trancount>0
            rollback tran
      end
   else
      insert into CB_AUTOBANKREC_OPTIONS
      (
         ABRO_TOLERANCE            
      ,  ABRO_REFERENCE_MATCH      
      ,  ABRO_LOAD_ALL_UNRECONCILED
      )
      select
         ABRO_TOLERANCE            
      ,  ABRO_REFERENCE_MATCH      
      ,  ABRO_LOAD_ALL_UNRECONCILED
         from
            inserted
end