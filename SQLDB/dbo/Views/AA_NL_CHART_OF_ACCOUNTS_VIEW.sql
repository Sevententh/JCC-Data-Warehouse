create view AA_NL_CHART_OF_ACCOUNTS_VIEW
as
/*
**
** Written     :  23/09/2008 SM
** Last Amended:  23/10/2008 DB, 05/10/12 NC
**
*/

with cte as
(select
   NCOA_PRIMARY                                                                    
,  cast(NCOA_ORDER as int)                         NCOA_ORDER                      
,  cast(NCOA_PARENT_NODE as bit)                   NCOA_PARENT_NODE                
,  NCOA_CURR_SYMBOL                                                                
,  NCOA_NL_ACCOUNT_LINK                                                            
,  cast(isnull(NCOA_UPDATE_PROFILE_NL,0) as bit)             NCOA_UPDATE_PROFILE_NL          
,  cast(isnull(NCOA_UPDATE_PROFILE_SL,0) as bit)             NCOA_UPDATE_PROFILE_SL          
,  cast(isnull(NCOA_UPDATE_PROFILE_PL,0) as bit)             NCOA_UPDATE_PROFILE_PL          
,  cast(isnull(NCOA_PROFILE_WARN_BEFORE_POSTING,0) as bit)   NCOA_PROFILE_WARN_BEFORE_POSTING
,  (
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL1_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL2_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL3_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL4_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL5_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL6_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL7_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
      +
      cast
      (
         isnull
         (
            case ANL_CAT_LEVEL8_SETUP
               when 1 then NCOA_NOM_CAT1_CODE
               when 2 then NCOA_NOM_CAT2_CODE
               when 3 then NCOA_NOM_CAT3_CODE
               when 4 then NCOA_NOM_CAT4_CODE
               when 5 then NCOA_NOM_CAT5_CODE
               when 6 then NCOA_NOM_CAT6_CODE
               when 7 then NCOA_NOM_CAT7_CODE
               when 8 then NCOA_NOM_CAT8_CODE
            end
         ,  ''
         )
         as char(6)
      )
   ) NCOA_FULL_PATH
   , ANL_CAT_LEVEL1_SETUP
   , ANL_CAT_LEVEL2_SETUP
   , ANL_CAT_LEVEL3_SETUP
   , ANL_CAT_LEVEL4_SETUP
   , ANL_CAT_LEVEL5_SETUP
   , ANL_CAT_LEVEL6_SETUP
   , ANL_CAT_LEVEL7_SETUP
   , ANL_CAT_LEVEL8_SETUP
   from
      NL_CHART_OF_ACCOUNTS
         inner join SYS_DATAINFO with (nolock) on SYS_PRIMARY = 1
)
, cte2 as
(
select 
*
, cast (ceiling(len(NCOA_FULL_PATH)/convert(float,6)) as int) NCOA_LEVEL

from cte
)
, cte3 as
(
select 
* 
,rtrim(substring(NCOA_FULL_PATH,(NCOA_LEVEL*6)-5,6)) NCOA_CAT_CODE
,case when NCOA_LEVEL > 1 then rtrim(substring(NCOA_FULL_PATH,(NCOA_LEVEL*6)-11,6)) else '' end NCOA_PARENT
,NCOA_UPDATE_PROFILE_NL|NCOA_UPDATE_PROFILE_PL|NCOA_UPDATE_PROFILE_SL NCOA_PROFILED
, case NCOA_LEVEL
   when 1 then ANL_CAT_LEVEL1_SETUP
   when 2 then ANL_CAT_LEVEL2_SETUP
   when 3 then ANL_CAT_LEVEL3_SETUP
   when 4 then ANL_CAT_LEVEL4_SETUP
   when 5 then ANL_CAT_LEVEL5_SETUP
   when 6 then ANL_CAT_LEVEL6_SETUP
   when 7 then ANL_CAT_LEVEL7_SETUP
   when 8 then ANL_CAT_LEVEL8_SETUP
  end CategoryNo
from cte2
)
select
 cte3.NCOA_CAT_CODE
,c.NCAT_NAME
,cte3.NCOA_PARENT_NODE NCOA_PARENT_NODE
,cte3.NCOA_LEVEL
,cte3.NCOA_PARENT
,substring(cte3.NCOA_FULL_PATH,1,cte3.NCOA_LEVEL*6) as NCOA_FULL_PATH
,cte3.NCOA_CURR_SYMBOL
,cte3.NCOA_ORDER
,cte3.NCOA_UPDATE_PROFILE_NL
,cte3.NCOA_UPDATE_PROFILE_SL
,cte3.NCOA_UPDATE_PROFILE_PL
,cte3.NCOA_PROFILE_WARN_BEFORE_POSTING
,cte3.NCOA_PROFILED
,cte3.NCOA_PRIMARY
,isnull(cte3.NCOA_NL_ACCOUNT_LINK,0) NCOA_NL_ACCOUNT_LINK
,0 NCOA_PROFILE_CHANGED
,cte3.CategoryNo NCOA_LAST_SETUP_CAT_NO
from cte3 
left join NL_CATEGORIES  c on c.NCAT_NUMBER = cte3.CategoryNo and c.NCAT_CODE = cte3.NCOA_CAT_CODE
GO
create trigger AA_NL_CHART_OF_ACCOUNTS_VIEW_IOUT
/*
** Trigger to trap updates on the AA_NL_CHART_OF_ACCOUNTS_VIEW and map them to the NL_CHART_OF_ACCOUNTS table
**
** Written     :  23/09/2008 SM
** Last Amended:  23/10/2008 DB
*/
on AA_NL_CHART_OF_ACCOUNTS_VIEW
instead of update

as

declare
   @LT_Error   bit

begin
set @LT_Error = 0

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,1,6)),'') = ''
      )
      begin
         raiserror('No level 1 code specified',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,7,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,13,6)),'') <> ''
      )
      begin
         raiserror('Level 3 code specified without level 2 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,13,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,19,6)),'') <> ''
      )
      begin
         raiserror('Level 4 code specified without level 3 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,19,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,25,6)),'') <> ''
      )
      begin
         raiserror('Level 5 code specified without level 4 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,25,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,31,6)),'') <> ''
      )
      begin
         raiserror('Level 6 code specified without level 5 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,31,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,37,6)),'') <> ''
      )
      begin
         raiserror('Level 7 code specified without level 6 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,37,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,43,6)),'') <> ''
      )
      begin
         raiserror('Level 8 code specified without level 7 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  left join NL_ACCOUNTS with (nolock) on NCOA_NL_ACCOUNT_LINK = N_PRIMARY
            where
                     isnull(NCOA_NL_ACCOUNT_LINK,0) <> 0
               and   N_PRIMARY is null
      )
      begin
         raiserror('Nominal Account does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               NCOA_CURR_SYMBOL is null
      )
      begin
         raiserror('Currency must be specified',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               NCOA_ORDER is null
      )
      begin
         raiserror('Order must be specified',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  left join SYS_CURRENCY_REC with (nolock) on NCOA_CURR_SYMBOL = CURREC_SYMBOL
            where
                     NCOA_CURR_SYMBOL  is not null
               and   CURREC_PRIMARY    is null
      )
      begin
         raiserror('Currency does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 1
                                                                  or ANL_CAT_LEVEL2_SETUP = 1
                                                                  or ANL_CAT_LEVEL3_SETUP = 1
                                                                  or ANL_CAT_LEVEL4_SETUP = 1
                                                                  or ANL_CAT_LEVEL5_SETUP = 1
                                                                  or ANL_CAT_LEVEL6_SETUP = 1
                                                                  or ANL_CAT_LEVEL7_SETUP = 1
                                                                  or ANL_CAT_LEVEL8_SETUP = 1
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 1    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 1
            where
                     isnull(
                             case 1    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 1 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 2
                                                                  or ANL_CAT_LEVEL2_SETUP = 2
                                                                  or ANL_CAT_LEVEL3_SETUP = 2
                                                                  or ANL_CAT_LEVEL4_SETUP = 2
                                                                  or ANL_CAT_LEVEL5_SETUP = 2
                                                                  or ANL_CAT_LEVEL6_SETUP = 2
                                                                  or ANL_CAT_LEVEL7_SETUP = 2
                                                                  or ANL_CAT_LEVEL8_SETUP = 2
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 2    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 2
            where
                     isnull(
                             case 2    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 2 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 3
                                                                  or ANL_CAT_LEVEL2_SETUP = 3
                                                                  or ANL_CAT_LEVEL3_SETUP = 3
                                                                  or ANL_CAT_LEVEL4_SETUP = 3
                                                                  or ANL_CAT_LEVEL5_SETUP = 3
                                                                  or ANL_CAT_LEVEL6_SETUP = 3
                                                                  or ANL_CAT_LEVEL7_SETUP = 3
                                                                  or ANL_CAT_LEVEL8_SETUP = 3
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 3    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 3
            where
                     isnull(
                             case 3    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 3 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 4
                                                                  or ANL_CAT_LEVEL2_SETUP = 4
                                                                  or ANL_CAT_LEVEL3_SETUP = 4
                                                                  or ANL_CAT_LEVEL4_SETUP = 4
                                                                  or ANL_CAT_LEVEL5_SETUP = 4
                                                                  or ANL_CAT_LEVEL6_SETUP = 4
                                                                  or ANL_CAT_LEVEL7_SETUP = 4
                                                                  or ANL_CAT_LEVEL8_SETUP = 4
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 4    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 4
            where
                     isnull(
                             case 4    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 4 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 5
                                                                  or ANL_CAT_LEVEL2_SETUP = 5
                                                                  or ANL_CAT_LEVEL3_SETUP = 5
                                                                  or ANL_CAT_LEVEL4_SETUP = 5
                                                                  or ANL_CAT_LEVEL5_SETUP = 5
                                                                  or ANL_CAT_LEVEL6_SETUP = 5
                                                                  or ANL_CAT_LEVEL7_SETUP = 5
                                                                  or ANL_CAT_LEVEL8_SETUP = 5
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 5    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 5
            where
                     isnull(
                             case 5    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 5 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 6
                                                                  or ANL_CAT_LEVEL2_SETUP = 6
                                                                  or ANL_CAT_LEVEL3_SETUP = 6
                                                                  or ANL_CAT_LEVEL4_SETUP = 6
                                                                  or ANL_CAT_LEVEL5_SETUP = 6
                                                                  or ANL_CAT_LEVEL6_SETUP = 6
                                                                  or ANL_CAT_LEVEL7_SETUP = 6
                                                                  or ANL_CAT_LEVEL8_SETUP = 6
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 6    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 6
            where
                     isnull(
                             case 6    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 6 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 7
                                                                  or ANL_CAT_LEVEL2_SETUP = 7
                                                                  or ANL_CAT_LEVEL3_SETUP = 7
                                                                  or ANL_CAT_LEVEL4_SETUP = 7
                                                                  or ANL_CAT_LEVEL5_SETUP = 7
                                                                  or ANL_CAT_LEVEL6_SETUP = 7
                                                                  or ANL_CAT_LEVEL7_SETUP = 7
                                                                  or ANL_CAT_LEVEL8_SETUP = 7
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 7    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 7
            where
                     isnull(
                             case 7    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 7 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 8
                                                                  or ANL_CAT_LEVEL2_SETUP = 8
                                                                  or ANL_CAT_LEVEL3_SETUP = 8
                                                                  or ANL_CAT_LEVEL4_SETUP = 8
                                                                  or ANL_CAT_LEVEL5_SETUP = 8
                                                                  or ANL_CAT_LEVEL6_SETUP = 8
                                                                  or ANL_CAT_LEVEL7_SETUP = 8
                                                                  or ANL_CAT_LEVEL8_SETUP = 8
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 8    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 8
            where
                     isnull(
                             case 8    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 8 code does not exist',16,1)
         set @LT_Error = 1
      end

   -- Unique checks
   if exists
      (
         select
            1
            from
               inserted INS
                  inner join NL_CHART_OF_ACCOUNTS COA with (nolock) on        COA.NCOA_CURR_SYMBOL =  INS.NCOA_CURR_SYMBOL
                                                                        and   COA.NCOA_ORDER       =  INS.NCOA_ORDER
                                                                        and   COA.NCOA_PRIMARY     <> INS.NCOA_PRIMARY
      )
      begin
         raiserror('Cannot insert to Chart Of Accounts as this will cause duplicate on Currency and Order',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted INS
                  inner join AA_NL_CHART_OF_ACCOUNTS_VIEW COA with (nolock) on      COA.NCOA_CURR_SYMBOL       =  INS.NCOA_CURR_SYMBOL
                                                                              and   rtrim(COA.NCOA_FULL_PATH)  =  rtrim(INS.NCOA_FULL_PATH)
                                                                              and   COA.NCOA_PRIMARY           <> INS.NCOA_PRIMARY
      )
      begin
         raiserror('Cannot insert to Chart Of Accounts as this will cause duplicate on Currency and Category Codes',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted INS
                  inner join NL_CHART_OF_ACCOUNTS COA with (nolock) on        COA.NCOA_NL_ACCOUNT_LINK =  INS.NCOA_NL_ACCOUNT_LINK
                                                                        and   INS.NCOA_NL_ACCOUNT_LINK is not null
                                                                        and   COA.NCOA_PRIMARY         <> INS.NCOA_PRIMARY
      )
      begin
         raiserror('Cannot insert to Chart Of Accounts as this will cause duplicate on Nominal Account Link',16,1)
         set @LT_Error = 1
      end

   if @LT_Error = 0
      update NL_CHART_OF_ACCOUNTS
         set
            NL_CHART_OF_ACCOUNTS.NCOA_ORDER           =  inserted.NCOA_ORDER
         ,  NL_CHART_OF_ACCOUNTS.NCOA_PARENT_NODE     =  isnull(inserted.NCOA_PARENT_NODE,0)
         ,  NL_CHART_OF_ACCOUNTS.NCOA_CURR_SYMBOL     =  inserted.NCOA_CURR_SYMBOL
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT1_CODE   =  nullif
                                                         (  case 1   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT2_CODE   =  nullif
                                                         (  case 2   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT3_CODE   =  nullif
                                                         (  case 3   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT4_CODE   =  nullif
                                                         (  case 4   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT5_CODE   =  nullif
                                                         (  case 5   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT6_CODE   =  nullif
                                                         (  case 6   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT7_CODE   =  nullif
                                                         (  case 7   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NOM_CAT8_CODE   =  nullif
                                                         (  case 8   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,1,6))
                                                                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,7,6))
                                                                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,13,6))
                                                                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,19,6))
                                                                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,25,6))
                                                                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,31,6))
                                                                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,37,6))
                                                                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(inserted.NCOA_FULL_PATH,43,6))
                                                            end
                                                         ,'')
         ,  NL_CHART_OF_ACCOUNTS.NCOA_NL_ACCOUNT_LINK             =  inserted.NCOA_NL_ACCOUNT_LINK
         ,  NL_CHART_OF_ACCOUNTS.NCOA_UPDATE_PROFILE_NL           =  isnull(inserted.NCOA_UPDATE_PROFILE_NL,0)
         ,  NL_CHART_OF_ACCOUNTS.NCOA_UPDATE_PROFILE_SL           =  isnull(inserted.NCOA_UPDATE_PROFILE_SL,0)
         ,  NL_CHART_OF_ACCOUNTS.NCOA_UPDATE_PROFILE_PL           =  isnull(inserted.NCOA_UPDATE_PROFILE_PL,0)
         ,  NL_CHART_OF_ACCOUNTS.NCOA_PROFILE_WARN_BEFORE_POSTING =  isnull(inserted.NCOA_PROFILE_WARN_BEFORE_POSTING,0)

         from
            NL_CHART_OF_ACCOUNTS
               inner join inserted                    on NL_CHART_OF_ACCOUNTS.NCOA_PRIMARY =  inserted.NCOA_PRIMARY
               inner join SYS_DATAINFO with (nolock)  on SYS_PRIMARY = 1
end
GO
create trigger AA_NL_CHART_OF_ACCOUNTS_VIEW_IOIT
/*
** Trigger to trap inserts on the AA_NL_CHART_OF_ACCOUNTS_VIEW and map them to the NL_CHART_OF_ACCOUNTS table
**
** Written     :  23/09/2008 SM
** Last Amended:  23/10/2008 DB
*/
on AA_NL_CHART_OF_ACCOUNTS_VIEW
instead of insert

as

declare
   @LT_Error   bit

begin
set @LT_Error = 0

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,1,6)),'') = ''
      )
      begin
         raiserror('No level 1 code specified',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,7,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,13,6)),'') <> ''
      )
      begin
         raiserror('Level 3 code specified without level 2 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,13,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,19,6)),'') <> ''
      )
      begin
         raiserror('Level 4 code specified without level 3 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,19,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,25,6)),'') <> ''
      )
      begin
         raiserror('Level 5 code specified without level 4 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,25,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,31,6)),'') <> ''
      )
      begin
         raiserror('Level 6 code specified without level 5 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,31,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,37,6)),'') <> ''
      )
      begin
         raiserror('Level 7 code specified without level 6 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               isnull(rtrim(substring(NCOA_FULL_PATH,37,6)),'') = '' and isnull(rtrim(substring(NCOA_FULL_PATH,43,6)),'') <> ''
      )
      begin
         raiserror('Level 8 code specified without level 7 code',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  left join NL_ACCOUNTS with (nolock) on NCOA_NL_ACCOUNT_LINK = N_PRIMARY
            where
                     isnull(NCOA_NL_ACCOUNT_LINK,0) <> 0
               and   N_PRIMARY is null
      )
      begin
         raiserror('Nominal Account does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               NCOA_CURR_SYMBOL is null
      )
      begin
         raiserror('Currency must be specified',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
            where
               NCOA_ORDER is null
      )
      begin
         raiserror('Order must be specified',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  left join SYS_CURRENCY_REC with (nolock) on NCOA_CURR_SYMBOL = CURREC_SYMBOL
            where
                     NCOA_CURR_SYMBOL  is not null
               and   CURREC_PRIMARY    is null
      )
      begin
         raiserror('Currency does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 1
                                                                  or ANL_CAT_LEVEL2_SETUP = 1
                                                                  or ANL_CAT_LEVEL3_SETUP = 1
                                                                  or ANL_CAT_LEVEL4_SETUP = 1
                                                                  or ANL_CAT_LEVEL5_SETUP = 1
                                                                  or ANL_CAT_LEVEL6_SETUP = 1
                                                                  or ANL_CAT_LEVEL7_SETUP = 1
                                                                  or ANL_CAT_LEVEL8_SETUP = 1
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 1    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 1
            where
                     isnull(
                             case 1    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 1 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 2
                                                                  or ANL_CAT_LEVEL2_SETUP = 2
                                                                  or ANL_CAT_LEVEL3_SETUP = 2
                                                                  or ANL_CAT_LEVEL4_SETUP = 2
                                                                  or ANL_CAT_LEVEL5_SETUP = 2
                                                                  or ANL_CAT_LEVEL6_SETUP = 2
                                                                  or ANL_CAT_LEVEL7_SETUP = 2
                                                                  or ANL_CAT_LEVEL8_SETUP = 2
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 2    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 2
            where
                     isnull(
                             case 2    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 2 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 3
                                                                  or ANL_CAT_LEVEL2_SETUP = 3
                                                                  or ANL_CAT_LEVEL3_SETUP = 3
                                                                  or ANL_CAT_LEVEL4_SETUP = 3
                                                                  or ANL_CAT_LEVEL5_SETUP = 3
                                                                  or ANL_CAT_LEVEL6_SETUP = 3
                                                                  or ANL_CAT_LEVEL7_SETUP = 3
                                                                  or ANL_CAT_LEVEL8_SETUP = 3
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 3    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 3
            where
                     isnull(
                             case 3    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 3 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 4
                                                                  or ANL_CAT_LEVEL2_SETUP = 4
                                                                  or ANL_CAT_LEVEL3_SETUP = 4
                                                                  or ANL_CAT_LEVEL4_SETUP = 4
                                                                  or ANL_CAT_LEVEL5_SETUP = 4
                                                                  or ANL_CAT_LEVEL6_SETUP = 4
                                                                  or ANL_CAT_LEVEL7_SETUP = 4
                                                                  or ANL_CAT_LEVEL8_SETUP = 4
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 4    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 4
            where
                     isnull(
                             case 4    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 4 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 5
                                                                  or ANL_CAT_LEVEL2_SETUP = 5
                                                                  or ANL_CAT_LEVEL3_SETUP = 5
                                                                  or ANL_CAT_LEVEL4_SETUP = 5
                                                                  or ANL_CAT_LEVEL5_SETUP = 5
                                                                  or ANL_CAT_LEVEL6_SETUP = 5
                                                                  or ANL_CAT_LEVEL7_SETUP = 5
                                                                  or ANL_CAT_LEVEL8_SETUP = 5
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 5    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 5
            where
                     isnull(
                             case 5    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 5 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 6
                                                                  or ANL_CAT_LEVEL2_SETUP = 6
                                                                  or ANL_CAT_LEVEL3_SETUP = 6
                                                                  or ANL_CAT_LEVEL4_SETUP = 6
                                                                  or ANL_CAT_LEVEL5_SETUP = 6
                                                                  or ANL_CAT_LEVEL6_SETUP = 6
                                                                  or ANL_CAT_LEVEL7_SETUP = 6
                                                                  or ANL_CAT_LEVEL8_SETUP = 6
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 6    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 6
            where
                     isnull(
                             case 6    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 6 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 7
                                                                  or ANL_CAT_LEVEL2_SETUP = 7
                                                                  or ANL_CAT_LEVEL3_SETUP = 7
                                                                  or ANL_CAT_LEVEL4_SETUP = 7
                                                                  or ANL_CAT_LEVEL5_SETUP = 7
                                                                  or ANL_CAT_LEVEL6_SETUP = 7
                                                                  or ANL_CAT_LEVEL7_SETUP = 7
                                                                  or ANL_CAT_LEVEL8_SETUP = 7
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 7    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 7
            where
                     isnull(
                             case 7    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 7 code does not exist',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted
                  inner join SYS_DATAINFO with (nolock) on        SYS_PRIMARY = 1
                                                            and   (
                                                                     ANL_CAT_LEVEL1_SETUP = 8
                                                                  or ANL_CAT_LEVEL2_SETUP = 8
                                                                  or ANL_CAT_LEVEL3_SETUP = 8
                                                                  or ANL_CAT_LEVEL4_SETUP = 8
                                                                  or ANL_CAT_LEVEL5_SETUP = 8
                                                                  or ANL_CAT_LEVEL6_SETUP = 8
                                                                  or ANL_CAT_LEVEL7_SETUP = 8
                                                                  or ANL_CAT_LEVEL8_SETUP = 8
                                                                  )
                  left join NL_CATEGORIES with (nolock) on        NCAT_CODE   = case 8    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                                                                          when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                                                                          when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                                                                          when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                                                                          when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                                                                          when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                                                                          when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                                                                          when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                                                                                end
                                                            and   NCAT_NUMBER = 8
            where
                     isnull(
                             case 8    when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                                       when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                                       when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                                       when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                                       when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                                       when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                                       when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                                       when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
                             end
                           ,'') <> ''
               and   NCAT_PRIMARY is null
      )
      begin
         raiserror('Category 8 code does not exist',16,1)
         set @LT_Error = 1
      end

   -- Unique checks
   if exists
      (
         select
            1
            from
               inserted INS
                  inner join NL_CHART_OF_ACCOUNTS COA with (nolock) on        COA.NCOA_CURR_SYMBOL = INS.NCOA_CURR_SYMBOL
                                                                        and   COA.NCOA_ORDER       = INS.NCOA_ORDER
      )
      begin
         raiserror('Cannot insert to Chart Of Accounts as this will cause duplicate on Currency and Order',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted INS
                  inner join AA_NL_CHART_OF_ACCOUNTS_VIEW COA with (nolock) on      COA.NCOA_CURR_SYMBOL       = INS.NCOA_CURR_SYMBOL
                                                                              and   rtrim(COA.NCOA_FULL_PATH)  = rtrim(INS.NCOA_FULL_PATH)
      )
      begin
         raiserror('Cannot insert to Chart Of Accounts as this will cause duplicate on Currency and Category Codes',16,1)
         set @LT_Error = 1
      end

   if exists
      (
         select
            1
            from
               inserted INS
                  inner join NL_CHART_OF_ACCOUNTS COA with (nolock) on        COA.NCOA_NL_ACCOUNT_LINK = INS.NCOA_NL_ACCOUNT_LINK
                                                                        and   INS.NCOA_NL_ACCOUNT_LINK is not null
      )
      begin
         raiserror('Cannot insert to Chart Of Accounts as this will cause duplicate on Nominal Account Link',16,1)
         set @LT_Error = 1
      end

   if @LT_Error = 0
      insert into NL_CHART_OF_ACCOUNTS
      (
         NCOA_ORDER
      ,  NCOA_PARENT_NODE
      ,  NCOA_CURR_SYMBOL
      ,  NCOA_NOM_CAT1_CODE
      ,  NCOA_NOM_CAT2_CODE
      ,  NCOA_NOM_CAT3_CODE
      ,  NCOA_NOM_CAT4_CODE
      ,  NCOA_NOM_CAT5_CODE
      ,  NCOA_NOM_CAT6_CODE
      ,  NCOA_NOM_CAT7_CODE
      ,  NCOA_NOM_CAT8_CODE
      ,  NCOA_NL_ACCOUNT_LINK
      ,  NCOA_UPDATE_PROFILE_NL
      ,  NCOA_UPDATE_PROFILE_SL
      ,  NCOA_UPDATE_PROFILE_PL
      ,  NCOA_PROFILE_WARN_BEFORE_POSTING
      )
      select
         NCOA_ORDER
      ,  isnull(NCOA_PARENT_NODE,0)
      ,  NCOA_CURR_SYMBOL
      ,  nullif
         (  case 1   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
         (  case 2   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
            (  case 3   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
         (  case 4   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
         (  case 5   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
         (  case 6   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
         (  case 7   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  nullif
         (  case 8   when ANL_CAT_LEVEL1_SETUP then rtrim(substring(NCOA_FULL_PATH,1,6))
                     when ANL_CAT_LEVEL2_SETUP then rtrim(substring(NCOA_FULL_PATH,7,6))
                     when ANL_CAT_LEVEL3_SETUP then rtrim(substring(NCOA_FULL_PATH,13,6))
                     when ANL_CAT_LEVEL4_SETUP then rtrim(substring(NCOA_FULL_PATH,19,6))
                     when ANL_CAT_LEVEL5_SETUP then rtrim(substring(NCOA_FULL_PATH,25,6))
                     when ANL_CAT_LEVEL6_SETUP then rtrim(substring(NCOA_FULL_PATH,31,6))
                     when ANL_CAT_LEVEL7_SETUP then rtrim(substring(NCOA_FULL_PATH,37,6))
                     when ANL_CAT_LEVEL8_SETUP then rtrim(substring(NCOA_FULL_PATH,43,6))
            end
         ,'')
      ,  NCOA_NL_ACCOUNT_LINK
      ,  isnull(NCOA_UPDATE_PROFILE_NL,0)
      ,  isnull(NCOA_UPDATE_PROFILE_SL,0)
      ,  isnull(NCOA_UPDATE_PROFILE_PL,0)
      ,  isnull(NCOA_PROFILE_WARN_BEFORE_POSTING,0)
         from
            inserted
               inner join SYS_DATAINFO with (nolock) on SYS_PRIMARY = 1
end