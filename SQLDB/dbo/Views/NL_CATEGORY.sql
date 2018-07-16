create view NL_CATEGORY
as
/*
**
** Written     :  15/09/2008 SM
** Last Amended:  22/10/2008 DB, 01/10/2012 SB, 03/10/2012 SB
**
*/

select
   cast (case NCAT_NUMBER when 1 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE1         -- Code for Category type 1 - 4 digit number (99999 if not type 1 to avoid auto-find problems)
,  NCAT_NAME                                                                  NL_CATEGORYNAME      -- Category Heading
,  NCAT_NUMBER                                                                NL_CATEGORYNO        -- 1, 2 or 3 (Level)
,  cast (0 as int)                                                            NL_CATEGORY_SEQ      -- Omnis record sequence number
,  cast (case NCAT_NUMBER when 2 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE2         -- Code for Category type 2 - 4 digit number (99999 if not type 2 to avoid auto-find problems)
,  cast (case NCAT_NUMBER when 3 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE3         -- Code for Category type 3 - 4 digit number (99999 if not type 3 to avoid auto-find problems)
,  cast (isnull(NCAT_USED,0) as bit)                                          NL_CAT_USED          -- Flag set if Category heading in use
,  cast (NCAT_NUMBER as varchar(1)) + NCAT_CODE                               NL_CAT_SORTCODE      -- Concatenation of Number & Code used for sorting reports
,  cast (case NCAT_NUMBER when 4 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE4         -- Code for Category type 4 - 4 digit number (99999 if not type 4 to avoid auto-find problems)
,  NCAT_DRCR_TYPE                                                             NL_CAT_DRCR_TYPE     -- CAT1 only.  DR=1 CR=2 type
,  NCAT_MAJOR_HEADING                                                         NL_CAT_MAJHED        -- CAT1 only.  MH to use on NL account
,  NCAT_TAXCODE_DR                                                            NL_CAT_TAXCODE_DR    -- CAT1 only.  DR tax code - show on NL
,  NCAT_TAXCODE_CR                                                            NL_CAT_TAXCODE_CR    -- CAT1 only.  CR tax code - show on NL
,  NCAT_PRIMARY                                                               NC_PRIMARY           -- Primary Key
,  NCAT_SHORTNAME                                                             NL_SHORTNAME         --
,  cast (case NCAT_NUMBER when 5 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE5         --
,  cast (case NCAT_NUMBER when 6 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE6         --
,  cast (case NCAT_NUMBER when 7 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE7         --
,  cast (case NCAT_NUMBER when 8 then NCAT_CODE else '~' end as varchar(6))   NL_CAT_CODE8         --
,  NCAT_LEVEL                                                                 NL_LEVEL             -- Profile Level
,  cast ('' as varchar(10))                                                   NL_GROUP             -- Profile Group
,  NCAT_REPORTING_CODE                                                        NL_REPORTING_CODE    -- Reporting Code (Detail level category only)
   from
      NL_CATEGORIES
GO
create trigger AA_NL_CATEGORY_IOUT
/*
** Trigger to trap updates on the NL_CATEGORY view and map them to the NL_CATEGORIES table
**
** Written     :  15/09/2008 SM
** Last Amended:  22/10/2008 DB
*/
on NL_CATEGORY
instead of update

as

declare
   @LT_Error   bit

begin
   set @LT_Error = 0

   if exists   -- Check that Code does not already exist for the specified number
      (
         select
            1
            from
               inserted
                  inner join NL_CATEGORIES with(nolock)  on       NL_CATEGORIES.NCAT_CODE    =  case NL_CATEGORYNO
                                                                                                   when 2 then NL_CAT_CODE2
                                                                                                   when 3 then NL_CAT_CODE3
                                                                                                   when 4 then NL_CAT_CODE4
                                                                                                   when 5 then NL_CAT_CODE5
                                                                                                   when 6 then NL_CAT_CODE6
                                                                                                   when 7 then NL_CAT_CODE7
                                                                                                   when 8 then NL_CAT_CODE8
                                                                                                   else
                                                                                                      NL_CAT_CODE1
                                                                                                end
                                                            and   NL_CATEGORIES.NCAT_NUMBER  =  inserted.NL_CATEGORYNO
                                                            and   NL_CATEGORIES.NCAT_PRIMARY <> NC_PRIMARY
      )
      begin
         set @LT_Error = 1
         raiserror('It is not possible to insert into NL_CATEGORIES as there is already a Category with the same Code',16,1)
      end

   if exists   -- Ensure number is between 1 and 8
      (
         select
            1
            from
               inserted
            where
                     NL_CATEGORYNO is not null
               and   NL_CATEGORYNO not between 1 and 8
      )
      begin
         set @LT_Error = 1
         raiserror('Category number must be between 1 and 8',16,1)
      end

   if @LT_Error = 0
      begin
         update NL_CATEGORIES
            set
               NCAT_CODE            =  case NL_CATEGORYNO
                                          when 2 then NL_CAT_CODE2
                                          when 3 then NL_CAT_CODE3
                                          when 4 then NL_CAT_CODE4
                                          when 5 then NL_CAT_CODE5
                                          when 6 then NL_CAT_CODE6
                                          when 7 then NL_CAT_CODE7
                                          when 8 then NL_CAT_CODE8
                                          else
                                             NL_CAT_CODE1
                                       end
            ,  NCAT_NAME            =  NL_CATEGORYNAME
            ,  NCAT_SHORTNAME       =  NL_SHORTNAME
            ,  NCAT_NUMBER          =  NL_CATEGORYNO
            ,  NCAT_USED            =  case isnull(NL_CAT_USED,0)
                                          when 0 then 0
                                          else
                                             1
                                       end
            ,  NCAT_DRCR_TYPE       =  NL_CAT_DRCR_TYPE
            ,  NCAT_MAJOR_HEADING   =  nullif(NL_CAT_MAJHED,0)
            ,  NCAT_TAXCODE_DR      =  NL_CAT_TAXCODE_DR
            ,  NCAT_TAXCODE_CR      =  NL_CAT_TAXCODE_CR
            ,  NCAT_LEVEL           =  NL_LEVEL
            from
               inserted
            where
               NCAT_PRIMARY = NC_PRIMARY
      end
   else
      if @@trancount > 0
         rollback tran
end
GO
create trigger AA_NL_CATEGORY_IOIT
/*
** Trigger to trap inserts on the NL_CATEGORY view and map them to the NL_CATEGORIES table
**
** Written     :  15/09/2008 SM
** Last Amended:  22/10/2008 DB
*/
on NL_CATEGORY
instead of insert

as

declare @LT_Error bit

begin
   select @LT_Error = 0

   if exists   -- Check that Code does not already exist for the specified number
      (
         select
            1
            from
               inserted
                  inner join NL_CATEGORIES with(nolock)  on       NL_CATEGORIES.NCAT_CODE    = case NL_CATEGORYNO when 1 then NL_CAT_CODE1
                                                                                                                  when 2 then NL_CAT_CODE2
                                                                                                                  when 3 then NL_CAT_CODE3
                                                                                                                  when 4 then NL_CAT_CODE4
                                                                                                                  when 5 then NL_CAT_CODE5
                                                                                                                  when 6 then NL_CAT_CODE6
                                                                                                                  when 7 then NL_CAT_CODE7
                                                                                                                  when 8 then NL_CAT_CODE8
                                                                                                                  else        NL_CAT_CODE1
                                                                                               end
                                                            and   NL_CATEGORIES.NCAT_NUMBER  = inserted.NL_CATEGORYNO
      )
      begin
         set @LT_Error = 1
         raiserror('It is not possible to insert into NL_CATEGORIES as there is already a Category with the same Code',16,1)
      end

   if exists   -- Ensure number is between 1 and 8
      (
         select
            1
            from
               inserted
            where
                     NL_CATEGORYNO is not null
               and   (
                        NL_CATEGORYNO > 8
                     or NL_CATEGORYNO < 1
                     )
      )
      begin
         set @LT_Error = 1
         raiserror('Category number must be between 1 and 8',16,1)
      end

   if exists   -- NC_PRIMARY must be specified
      (
         select
            1
            from
               inserted
            where
                  NC_PRIMARY is null
               or NC_PRIMARY = 0
      )
      begin
         set @LT_Error = 1
         raiserror('NC_PRIMARY must be specified',16,1)
      end

   if @LT_Error = 0
      begin
         insert into NL_CATEGORIES
         (
            NCAT_PRIMARY
         ,  NCAT_CODE
         ,  NCAT_NAME
         ,  NCAT_SHORTNAME
         ,  NCAT_NUMBER
         ,  NCAT_USED
         ,  NCAT_DRCR_TYPE
         ,  NCAT_MAJOR_HEADING
         ,  NCAT_TAXCODE_DR
         ,  NCAT_TAXCODE_CR
         ,  NCAT_LEVEL
         )
         select
            NC_PRIMARY
         ,  case NL_CATEGORYNO
               when 2 then NL_CAT_CODE2
               when 3 then NL_CAT_CODE3
               when 4 then NL_CAT_CODE4
               when 5 then NL_CAT_CODE5
               when 6 then NL_CAT_CODE6
               when 7 then NL_CAT_CODE7
               when 8 then NL_CAT_CODE8
               else
                  NL_CAT_CODE1
            end
         ,  NL_CATEGORYNAME
         ,  NL_SHORTNAME
         ,  NL_CATEGORYNO
         ,  case isnull(NL_CAT_USED,0)
               when 0 then 0
               else
                  1
            end
         ,  NL_CAT_DRCR_TYPE
         ,  nullif(NL_CAT_MAJHED,0)
         ,  NL_CAT_TAXCODE_DR
         ,  NL_CAT_TAXCODE_CR
         ,  NL_LEVEL
            from
               inserted
      end
   else
      if @@trancount > 0
         rollback tran
end
GO
create trigger AA_NL_CATEGORY_IODT
/*
** Trigger for enforcing Nominal Categories business rules.
** The trigger fires when an attempt is made to delete a Nominal
** category. The trigger enforces the business rule stipulating
** that Nominal categories cannot be deleted if in use by Nominal
** Accounts.
**
** Written     :  05/08/1998 ??
** Last Amended:  17/12/2001 RL, 06/10/2005 SH, 19/04/2006 SRB, 21/01/2008 DB, 07/06/2010 SM
*/
on NL_CATEGORY
instead of delete

as

declare
   @LT_NoGroups            bit
,  @LT_NoDivisions         bit
,  @LT_ACCOUNT_FOR_CARBON  bit
,  @LT_CategoryCode        varchar(10)
,  @LT_UsedFlag            tinyint

begin
   select top 1
      @LT_CategoryCode  =  NL_CATEGORY_CODE
   ,  @LT_UsedFlag      =  NL_USED_FLAG
      from
         (
            select
               case NL_CATEGORYNO
                        when 1 then NL_CAT_CODE1
                        when 2 then NL_CAT_CODE2
                        when 3 then NL_CAT_CODE3
                        when 4 then NL_CAT_CODE4
                        when 5 then NL_CAT_CODE5
                        when 6 then NL_CAT_CODE6
                        when 7 then NL_CAT_CODE7
                        when 8 then NL_CAT_CODE8
                        else
                           null
               end                                 NL_CATEGORY_CODE
            ,  dbo.AA_NL_CATEGORY_USED_F
               (
                  NC_PRIMARY
               ,  case NL_CATEGORYNO
                     when 1 then NL_CAT_CODE1
                     when 2 then NL_CAT_CODE2
                     when 3 then NL_CAT_CODE3
                     when 4 then NL_CAT_CODE4
                     when 5 then NL_CAT_CODE5
                     when 6 then NL_CAT_CODE6
                     when 7 then NL_CAT_CODE7
                     when 8 then NL_CAT_CODE8
                     else
                        null
                  end
               ,  NL_CATEGORYNO
               )                                   NL_USED_FLAG
               from
                  deleted
         ) USED_CATEGORIES
      where
         NL_USED_FLAG <> 0
   if       @@rowcount > 0
      and   isnull(@LT_UsedFlag,0) > 0
      begin
         if @@trancount>0
            rollback transaction
         raiserror('The Nominal Category ''%s'' cannot be deleted because it is in use',16,1,@LT_CategoryCode)
         return
      end

   delete from NL_CATEGORY
      from
         deleted
            inner join NL_CATEGORY NC on NC.NC_PRIMARY = deleted.NC_PRIMARY
end