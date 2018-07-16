create view AA_SYS_SECURITY_PROFILE_LEVELS_VIEW
/*
** Written     :  05/06/2006 SB
** Last Amended:  06/06/2006 SB, 19/09/2006 SB, 08/11/2006 SH, 31/01/2007 NC, 12/03/2007 JC, 20/06/2007 DB, 01/08/07 NC
*/
(
   [PRIMARY]
,  CODE
,  RECORD            -- Customer          0
                     -- Sales Analysis    1
                     -- Supplier          2
                     -- Purchase Analysis 3
                     -- Nominal Account   4
                     -- Project           5
                     -- Resource          6
                     -- Prospect          7
                     -- Contact Entry     8
                     -- Stock             9
                     -- Price Matrix      10
                     -- SubAnalysis       11
,  AMEND_LEVEL
,  WORK_WITH_LEVEL
,  EXACT_LEVEL
)
as
   select   --Customer
      UPG_PRIMARY
   ,  UP_CODE
   ,  0
   ,  UP_LEVEL_RECENTRY1
   ,  UP_LEVEL_RECVIEW1
   ,  UP_LEVEL_EXACT1
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'SL'
union all
   --Sales Analysis
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  1
   ,  UP_LEVEL_RECENTRY2
   ,  UP_LEVEL_RECVIEW2
   ,  UP_LEVEL_EXACT2
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'SL'
union all
   --Supplier
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  2
   ,  UP_LEVEL_RECENTRY1
   ,  UP_LEVEL_RECVIEW1
   ,  UP_LEVEL_EXACT1
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'PL'
union all
   --Purchase Analysis
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  3
   ,  UP_LEVEL_RECENTRY2
   ,  UP_LEVEL_RECVIEW2
   ,  UP_LEVEL_EXACT2
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'PL'
union all
   --Nominal Account
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  4
   ,  UP_LEVEL_RECENTRY1
   ,  UP_LEVEL_RECVIEW1
   ,  UP_LEVEL_EXACT1
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'NL'
union all
   --Project
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  5
   ,  UP_LEVEL_RECENTRY1
   ,  UP_LEVEL_RECVIEW1
   ,  UP_LEVEL_EXACT1
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'CST'
union all
   --Resource
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  6
   ,  UP_LEVEL_RECENTRY2
   ,  UP_LEVEL_RECVIEW2
   ,  UP_LEVEL_EXACT2
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'CST'
union all
   --Prospect
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  7
   ,  UP_LEVEL_RECENTRY1
   ,  UP_LEVEL_RECVIEW1
   ,  UP_LEVEL_EXACT1
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'CM'
union all
   --Contact Entry
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  8
   ,  UP_LEVEL_RECENTRY3
   ,  UP_LEVEL_RECVIEW3
   ,  UP_LEVEL_EXACT3
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'CM'
union all
   --Stock
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  9
   ,  UP_LEVEL_RECENTRY1
   ,  UP_LEVEL_RECVIEW1
   ,  UP_LEVEL_EXACT1
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'STK'
union all
   --Price Matrix
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  10
   ,  UP_LEVEL_RECENTRY4
   ,  UP_LEVEL_RECVIEW4
   ,  UP_LEVEL_EXACT4
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'STK'
union all
   --Subanalysis
   select
      UPG_PRIMARY
   ,  UP_CODE
   ,  11
   ,  UP_LEVEL_RECENTRY5
   ,  UP_LEVEL_RECVIEW5
   ,  UP_LEVEL_EXACT5
      from
         SYS_USER_PROFILE_GLOBAL with (nolock)
            inner join SYS_USER_PROFILE with (nolock) on UPG_CODE = UP_CODE
      where
         UP_MODULE = 'STK'