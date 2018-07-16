create view AA_SOP_ORDER_CUSTOM_FIELDS_VIEW
/*
** View to combine custom fields tables into a single view
**
** Written     :  27/08/2010 SM
** Last Amended:  10/4/11 NC
*/
as

with ORDCHARS as
(
select
   OHC_HEADER_LINK            --OHCF_PRIMARY
,  [1]                        OHCF_USRCHAR1
,  [2]                        OHCF_USRCHAR2
,  [3]                        OHCF_USRCHAR3
,  [4]                        OHCF_USRCHAR4
,  [5]                        OHCF_USRCHAR5
,  [6]                        OHCF_USRCHAR6
,  [7]                        OHCF_USRCHAR7
,  [8]                        OHCF_USRCHAR8
,  [9]                        OHCF_USRCHAR9
,  [10]                       OHCF_USRCHAR10
,  [11]                       OHCF_USRCHAR11
,  [12]                       OHCF_USRCHAR12
,  [13]                       OHCF_USRCHAR13
,  [14]                       OHCF_USRCHAR14
,  [15]                       OHCF_USRCHAR15
,  [16]                       OHCF_USRCHAR16
,  [17]                       OHCF_USRCHAR17
,  [18]                       OHCF_USRCHAR18
,  [19]                       OHCF_USRCHAR19
,  [20]                       OHCF_USRCHAR20
   from
      (
         select
            OHC_HEADER_LINK
         ,  OHC_NUMBER
         ,  OHC_DATA
            from
               ORD_HEADER_CUSTOM_CHAR
      ) as SourceTable
      pivot
      (
         max(OHC_DATA)
         for
            OHC_NUMBER in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20])
      ) as PivotTable
)
,  ORDNUMBERS as
(
select
   OHN_HEADER_LINK            -- OHCF_PRIMARY
,  [1]                        OHCF_USRNUM1
,  [2]                        OHCF_USRNUM2
,  [3]                        OHCF_USRNUM3
,  [4]                        OHCF_USRNUM4
,  [5]                        OHCF_USRNUM5
,  [6]                        OHCF_USRNUM6
,  [7]                        OHCF_USRNUM7
,  [8]                        OHCF_USRNUM8
,  [9]                        OHCF_USRNUM9
,  [10]                       OHCF_USRNUM10
,  [11]                       OHCF_USRNUM11
,  [12]                       OHCF_USRNUM12
,  [13]                       OHCF_USRNUM13
,  [14]                       OHCF_USRNUM14
,  [15]                       OHCF_USRNUM15
,  [16]                       OHCF_USRNUM16
,  [17]                       OHCF_USRNUM17
,  [18]                       OHCF_USRNUM18
,  [19]                       OHCF_USRNUM19
,  [20]                       OHCF_USRNUM20
   from
      (
         select
            OHN_HEADER_LINK
         ,  OHN_NUMBER
         ,  OHN_DATA
            from
               ORD_HEADER_CUSTOM_NUMBER
      ) as SourceTable
      pivot
      (
         max(OHN_DATA)
         for
            OHN_NUMBER in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20])
      ) as PivotTable
)
,  ORDDATES as
(
select
   OHD_HEADER_LINK            -- OHCF_PRIMARY
,  [1]                        OHCF_USRDATE1
,  [2]                        OHCF_USRDATE2
,  [3]                        OHCF_USRDATE3
,  [4]                        OHCF_USRDATE4
,  [5]                        OHCF_USRDATE5
,  [6]                        OHCF_USRDATE6
,  [7]                        OHCF_USRDATE7
,  [8]                        OHCF_USRDATE8
,  [9]                        OHCF_USRDATE9
,  [10]                       OHCF_USRDATE10
   from
      (
         select
            OHD_HEADER_LINK
         ,  OHD_NUMBER
         ,  OHD_DATA
            from
               ORD_HEADER_CUSTOM_DATE
      ) as SourceTable
      pivot
      (
         max(OHD_DATA)
         for
            OHD_NUMBER in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10])
      ) as PivotTable
)
,  ORDFLAGS as
(
select
   OHF_HEADER_LINK            -- OHCF_PRIMARY
,  [1]                        OHCF_USRFLAG1
,  [2]                        OHCF_USRFLAG2
,  [3]                        OHCF_USRFLAG3
,  [4]                        OHCF_USRFLAG4
,  [5]                        OHCF_USRFLAG5
,  [6]                        OHCF_USRFLAG6
,  [7]                        OHCF_USRFLAG7
,  [8]                        OHCF_USRFLAG8
,  [9]                        OHCF_USRFLAG9
,  [10]                       OHCF_USRFLAG10
   from
      (
         select
            OHF_HEADER_LINK
         ,  OHF_NUMBER
         ,  cast(OHF_DATA as tinyint) OHF_DATA
            from
               ORD_HEADER_CUSTOM_FLAG
      ) as SourceTable
      pivot
      (
         max(OHF_DATA)
         for
            OHF_NUMBER in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10])
      ) as PivotTable)

select
      OH_PRIMARY as OHCF_PRIMARY
   ,  OHCF_USRCHAR1
   ,  OHCF_USRCHAR2
   ,  OHCF_USRCHAR3
   ,  OHCF_USRCHAR4
   ,  OHCF_USRCHAR5
   ,  OHCF_USRCHAR6
   ,  OHCF_USRCHAR7
   ,  OHCF_USRCHAR8
   ,  OHCF_USRCHAR9
   ,  OHCF_USRCHAR10
   ,  OHCF_USRCHAR11
   ,  OHCF_USRCHAR12
   ,  OHCF_USRCHAR13
   ,  OHCF_USRCHAR14
   ,  OHCF_USRCHAR15
   ,  OHCF_USRCHAR16
   ,  OHCF_USRCHAR17
   ,  OHCF_USRCHAR18
   ,  OHCF_USRCHAR19
   ,  OHCF_USRCHAR20
   ,  OHCF_USRNUM1
   ,  OHCF_USRNUM2
   ,  OHCF_USRNUM3
   ,  OHCF_USRNUM4
   ,  OHCF_USRNUM5
   ,  OHCF_USRNUM6
   ,  OHCF_USRNUM7
   ,  OHCF_USRNUM8
   ,  OHCF_USRNUM9
   ,  OHCF_USRNUM10
   ,  OHCF_USRNUM11
   ,  OHCF_USRNUM12
   ,  OHCF_USRNUM13
   ,  OHCF_USRNUM14
   ,  OHCF_USRNUM15
   ,  OHCF_USRNUM16
   ,  OHCF_USRNUM17
   ,  OHCF_USRNUM18
   ,  OHCF_USRNUM19
   ,  OHCF_USRNUM20
   ,  OHCF_USRDATE1
   ,  OHCF_USRDATE2
   ,  OHCF_USRDATE3
   ,  OHCF_USRDATE4
   ,  OHCF_USRDATE5
   ,  OHCF_USRDATE6
   ,  OHCF_USRDATE7
   ,  OHCF_USRDATE8
   ,  OHCF_USRDATE9
   ,  OHCF_USRDATE10
   ,  OHCF_USRFLAG1
   ,  OHCF_USRFLAG2
   ,  OHCF_USRFLAG3
   ,  OHCF_USRFLAG4
   ,  OHCF_USRFLAG5
   ,  OHCF_USRFLAG6
   ,  OHCF_USRFLAG7
   ,  OHCF_USRFLAG8
   ,  OHCF_USRFLAG9
   ,  OHCF_USRFLAG10
   from
      ORD_HEADER
         left join ORDCHARS   on OH_PRIMARY = OHC_HEADER_LINK
         left join ORDNUMBERS on OH_PRIMARY = OHN_HEADER_LINK
         left join ORDFLAGS   on OH_PRIMARY = OHF_HEADER_LINK
         left join ORDDATES   on OH_PRIMARY = OHD_HEADER_LINK
   where
      coalesce(OHC_HEADER_LINK,OHN_HEADER_LINK,OHF_HEADER_LINK,OHD_HEADER_LINK) > 0

GO
create trigger AA_SOP_ORDER_CUSTOM_FIELDS_VIEW_IOUT
/*
** This trigger translates update on the view to the custom field talbes
**
** Written     :  27/08/2010 SM
** Last Amended:  03/09/2010 DB, 06/09/2010 DB
*/
on AA_SOP_ORDER_CUSTOM_FIELDS_VIEW
instead of update

as

declare
   @LT_EndOfTime  datetime -- This is required as a substitute for null dates as unpivoting doesn't return a row for null values

set @LT_EndOfTime = cast(2958463 as datetime)

-- Char fields
delete from ORD_HEADER_CUSTOM_CHAR
   from
      (
         select
            OHC_HEADER_LINK
         ,  cast(replace(OHC_NUMBER,'OHCF_USRCHAR','') as tinyint)   OHC_NUMBER
         ,  OHC_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHC_HEADER_LINK
               ,  OHCF_USRCHAR1
               ,  OHCF_USRCHAR2
               ,  OHCF_USRCHAR3
               ,  OHCF_USRCHAR4
               ,  OHCF_USRCHAR5
               ,  OHCF_USRCHAR6
               ,  OHCF_USRCHAR7
               ,  OHCF_USRCHAR8
               ,  OHCF_USRCHAR9
               ,  OHCF_USRCHAR10
               ,  OHCF_USRCHAR11
               ,  OHCF_USRCHAR12
               ,  OHCF_USRCHAR13
               ,  OHCF_USRCHAR14
               ,  OHCF_USRCHAR15
               ,  OHCF_USRCHAR16
               ,  OHCF_USRCHAR17
               ,  OHCF_USRCHAR18
               ,  OHCF_USRCHAR19
               ,  OHCF_USRCHAR20
                  from
                     inserted
            ) original
            unpivot
            (
               OHC_DATA
                  for OHC_NUMBER in
                  (
                     OHCF_USRCHAR1
                  ,  OHCF_USRCHAR2
                  ,  OHCF_USRCHAR3
                  ,  OHCF_USRCHAR4
                  ,  OHCF_USRCHAR5
                  ,  OHCF_USRCHAR6
                  ,  OHCF_USRCHAR7
                  ,  OHCF_USRCHAR8
                  ,  OHCF_USRCHAR9
                  ,  OHCF_USRCHAR10
                  ,  OHCF_USRCHAR11
                  ,  OHCF_USRCHAR12
                  ,  OHCF_USRCHAR13
                  ,  OHCF_USRCHAR14
                  ,  OHCF_USRCHAR15
                  ,  OHCF_USRCHAR16
                  ,  OHCF_USRCHAR17
                  ,  OHCF_USRCHAR18
                  ,  OHCF_USRCHAR19
                  ,  OHCF_USRCHAR20
                  )
            ) as unpivoted
         where
            OHC_DATA = ''       -- Don't store empty strings to save on rows. View will translate missing row to empty string.
      ) to_be_deleted
      inner join ORD_HEADER_CUSTOM_CHAR OHCC on       OHCC.OHC_HEADER_LINK = to_be_deleted.OHC_HEADER_LINK
                                                and   OHCC.OHC_NUMBER      = to_be_deleted.OHC_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to delete from table ORD_HEADER_CUSTOM_CHAR',16,1)
      return
   end

update OHCC
   set
      OHCC.OHC_DATA = to_be_updated.OHC_DATA
   from
      (
         select
            OHC_HEADER_LINK
         ,  cast(replace(OHC_NUMBER,'OHCF_USRCHAR','') as tinyint)   OHC_NUMBER
         ,  OHC_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHC_HEADER_LINK
               ,  OHCF_USRCHAR1
               ,  OHCF_USRCHAR2
               ,  OHCF_USRCHAR3
               ,  OHCF_USRCHAR4
               ,  OHCF_USRCHAR5
               ,  OHCF_USRCHAR6
               ,  OHCF_USRCHAR7
               ,  OHCF_USRCHAR8
               ,  OHCF_USRCHAR9
               ,  OHCF_USRCHAR10
               ,  OHCF_USRCHAR11
               ,  OHCF_USRCHAR12
               ,  OHCF_USRCHAR13
               ,  OHCF_USRCHAR14
               ,  OHCF_USRCHAR15
               ,  OHCF_USRCHAR16
               ,  OHCF_USRCHAR17
               ,  OHCF_USRCHAR18
               ,  OHCF_USRCHAR19
               ,  OHCF_USRCHAR20
                  from
                     inserted
            ) original
            unpivot
            (
               OHC_DATA
                  for OHC_NUMBER in
                  (
                     OHCF_USRCHAR1
                  ,  OHCF_USRCHAR2
                  ,  OHCF_USRCHAR3
                  ,  OHCF_USRCHAR4
                  ,  OHCF_USRCHAR5
                  ,  OHCF_USRCHAR6
                  ,  OHCF_USRCHAR7
                  ,  OHCF_USRCHAR8
                  ,  OHCF_USRCHAR9
                  ,  OHCF_USRCHAR10
                  ,  OHCF_USRCHAR11
                  ,  OHCF_USRCHAR12
                  ,  OHCF_USRCHAR13
                  ,  OHCF_USRCHAR14
                  ,  OHCF_USRCHAR15
                  ,  OHCF_USRCHAR16
                  ,  OHCF_USRCHAR17
                  ,  OHCF_USRCHAR18
                  ,  OHCF_USRCHAR19
                  ,  OHCF_USRCHAR20
                  )
            ) as unpivoted
         where
                  OHC_DATA is not null
            and   OHC_DATA <> ''       -- Don't store empty strings to save on rows. View will translate missing row to empty string.
      ) to_be_updated
      inner join ORD_HEADER_CUSTOM_CHAR OHCC on       OHCC.OHC_HEADER_LINK = to_be_updated.OHC_HEADER_LINK
                                                and   OHCC.OHC_NUMBER      = to_be_updated.OHC_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to update table ORD_HEADER_CUSTOM_CHAR',16,1)
      return
   end

insert into ORD_HEADER_CUSTOM_CHAR
select
   to_be_inserted.OHC_HEADER_LINK
,  to_be_inserted.OHC_NUMBER
,  to_be_inserted.OHC_DATA
   from
      (
         select
            OHC_HEADER_LINK
         ,  cast(replace(OHC_NUMBER,'OHCF_USRCHAR','') as tinyint)   OHC_NUMBER
         ,  OHC_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHC_HEADER_LINK
               ,  OHCF_USRCHAR1
               ,  OHCF_USRCHAR2
               ,  OHCF_USRCHAR3
               ,  OHCF_USRCHAR4
               ,  OHCF_USRCHAR5
               ,  OHCF_USRCHAR6
               ,  OHCF_USRCHAR7
               ,  OHCF_USRCHAR8
               ,  OHCF_USRCHAR9
               ,  OHCF_USRCHAR10
               ,  OHCF_USRCHAR11
               ,  OHCF_USRCHAR12
               ,  OHCF_USRCHAR13
               ,  OHCF_USRCHAR14
               ,  OHCF_USRCHAR15
               ,  OHCF_USRCHAR16
               ,  OHCF_USRCHAR17
               ,  OHCF_USRCHAR18
               ,  OHCF_USRCHAR19
               ,  OHCF_USRCHAR20
                  from
                     inserted
            ) original
            unpivot
            (
               OHC_DATA
                  for OHC_NUMBER in
                  (
                     OHCF_USRCHAR1
                  ,  OHCF_USRCHAR2
                  ,  OHCF_USRCHAR3
                  ,  OHCF_USRCHAR4
                  ,  OHCF_USRCHAR5
                  ,  OHCF_USRCHAR6
                  ,  OHCF_USRCHAR7
                  ,  OHCF_USRCHAR8
                  ,  OHCF_USRCHAR9
                  ,  OHCF_USRCHAR10
                  ,  OHCF_USRCHAR11
                  ,  OHCF_USRCHAR12
                  ,  OHCF_USRCHAR13
                  ,  OHCF_USRCHAR14
                  ,  OHCF_USRCHAR15
                  ,  OHCF_USRCHAR16
                  ,  OHCF_USRCHAR17
                  ,  OHCF_USRCHAR18
                  ,  OHCF_USRCHAR19
                  ,  OHCF_USRCHAR20
                  )
            ) as unpivoted
            where
                     OHC_DATA is not null
               and   OHC_DATA <> ''       -- Don't store empty strings to save on rows. View will translate missing row to empty string.
      ) to_be_inserted
   where
      not exists
      (
         select
            1
            from
               ORD_HEADER_CUSTOM_CHAR OHCC with(nolock)
            where
                     OHCC.OHC_HEADER_LINK = to_be_inserted.OHC_HEADER_LINK
               and   OHCC.OHC_NUMBER      = to_be_inserted.OHC_NUMBER
      )
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_CHAR',16,1)
      return
   end


-- Number fields
delete from ORD_HEADER_CUSTOM_NUMBER
   from
      (
         select
            OHN_HEADER_LINK
         ,  cast(replace(OHN_NUMBER,'OHCF_USRNUM','') as tinyint)   OHN_NUMBER
         ,  OHN_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHN_HEADER_LINK
               ,  OHCF_USRNUM1
               ,  OHCF_USRNUM2
               ,  OHCF_USRNUM3
               ,  OHCF_USRNUM4
               ,  OHCF_USRNUM5
               ,  OHCF_USRNUM6
               ,  OHCF_USRNUM7
               ,  OHCF_USRNUM8
               ,  OHCF_USRNUM9
               ,  OHCF_USRNUM10
               ,  OHCF_USRNUM11
               ,  OHCF_USRNUM12
               ,  OHCF_USRNUM13
               ,  OHCF_USRNUM14
               ,  OHCF_USRNUM15
               ,  OHCF_USRNUM16
               ,  OHCF_USRNUM17
               ,  OHCF_USRNUM18
               ,  OHCF_USRNUM19
               ,  OHCF_USRNUM20
                  from
                     inserted
            ) original
            unpivot
            (
               OHN_DATA
                  for OHN_NUMBER in
                  (
                     OHCF_USRNUM1
                  ,  OHCF_USRNUM2
                  ,  OHCF_USRNUM3
                  ,  OHCF_USRNUM4
                  ,  OHCF_USRNUM5
                  ,  OHCF_USRNUM6
                  ,  OHCF_USRNUM7
                  ,  OHCF_USRNUM8
                  ,  OHCF_USRNUM9
                  ,  OHCF_USRNUM10
                  ,  OHCF_USRNUM11
                  ,  OHCF_USRNUM12
                  ,  OHCF_USRNUM13
                  ,  OHCF_USRNUM14
                  ,  OHCF_USRNUM15
                  ,  OHCF_USRNUM16
                  ,  OHCF_USRNUM17
                  ,  OHCF_USRNUM18
                  ,  OHCF_USRNUM19
                  ,  OHCF_USRNUM20
                  )
            ) as unpivoted
         where
            OHN_DATA = 0         -- Don't store 0 to save on rows. View will translate missing row to 0.
      ) to_be_deleted
      inner join ORD_HEADER_CUSTOM_NUMBER OHCN  on       OHCN.OHN_HEADER_LINK = to_be_deleted.OHN_HEADER_LINK
                                                   and   OHCN.OHN_NUMBER      = to_be_deleted.OHN_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to delete from table ORD_HEADER_CUSTOM_NUMBER',16,1)
      return
   end

update OHCN
   set
      OHCN.OHN_DATA = to_be_updated.OHN_DATA
   from
      (
         select
            OHN_HEADER_LINK
         ,  cast(replace(OHN_NUMBER,'OHCF_USRNUM','') as tinyint)   OHN_NUMBER
         ,  OHN_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHN_HEADER_LINK
               ,  OHCF_USRNUM1
               ,  OHCF_USRNUM2
               ,  OHCF_USRNUM3
               ,  OHCF_USRNUM4
               ,  OHCF_USRNUM5
               ,  OHCF_USRNUM6
               ,  OHCF_USRNUM7
               ,  OHCF_USRNUM8
               ,  OHCF_USRNUM9
               ,  OHCF_USRNUM10
               ,  OHCF_USRNUM11
               ,  OHCF_USRNUM12
               ,  OHCF_USRNUM13
               ,  OHCF_USRNUM14
               ,  OHCF_USRNUM15
               ,  OHCF_USRNUM16
               ,  OHCF_USRNUM17
               ,  OHCF_USRNUM18
               ,  OHCF_USRNUM19
               ,  OHCF_USRNUM20
                  from
                     inserted
            ) original
            unpivot
            (
               OHN_DATA
                  for OHN_NUMBER in
                  (
                     OHCF_USRNUM1
                  ,  OHCF_USRNUM2
                  ,  OHCF_USRNUM3
                  ,  OHCF_USRNUM4
                  ,  OHCF_USRNUM5
                  ,  OHCF_USRNUM6
                  ,  OHCF_USRNUM7
                  ,  OHCF_USRNUM8
                  ,  OHCF_USRNUM9
                  ,  OHCF_USRNUM10
                  ,  OHCF_USRNUM11
                  ,  OHCF_USRNUM12
                  ,  OHCF_USRNUM13
                  ,  OHCF_USRNUM14
                  ,  OHCF_USRNUM15
                  ,  OHCF_USRNUM16
                  ,  OHCF_USRNUM17
                  ,  OHCF_USRNUM18
                  ,  OHCF_USRNUM19
                  ,  OHCF_USRNUM20
                  )
            ) as unpivoted
         where
                  OHN_DATA is not null
            and   OHN_DATA <> 0       -- Don't store empty strings to save on rows. View will translate missing row to empty string.
      ) to_be_updated
      inner join ORD_HEADER_CUSTOM_NUMBER OHCN  on       OHCN.OHN_HEADER_LINK = to_be_updated.OHN_HEADER_LINK
                                                   and   OHCN.OHN_NUMBER      = to_be_updated.OHN_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to update table ORD_HEADER_CUSTOM_NUMBER',16,1)
      return
   end

insert into ORD_HEADER_CUSTOM_NUMBER
select
   to_be_inserted.OHN_HEADER_LINK
,  to_be_inserted.OHN_NUMBER
,  to_be_inserted.OHN_DATA
   from
      (
         select
            OHN_HEADER_LINK
         ,  cast(replace(OHN_NUMBER,'OHCF_USRNUM','') as tinyint)   OHN_NUMBER
         ,  OHN_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHN_HEADER_LINK
               ,  OHCF_USRNUM1
               ,  OHCF_USRNUM2
               ,  OHCF_USRNUM3
               ,  OHCF_USRNUM4
               ,  OHCF_USRNUM5
               ,  OHCF_USRNUM6
               ,  OHCF_USRNUM7
               ,  OHCF_USRNUM8
               ,  OHCF_USRNUM9
               ,  OHCF_USRNUM10
               ,  OHCF_USRNUM11
               ,  OHCF_USRNUM12
               ,  OHCF_USRNUM13
               ,  OHCF_USRNUM14
               ,  OHCF_USRNUM15
               ,  OHCF_USRNUM16
               ,  OHCF_USRNUM17
               ,  OHCF_USRNUM18
               ,  OHCF_USRNUM19
               ,  OHCF_USRNUM20
                  from
                     inserted
            ) original
            unpivot
            (
               OHN_DATA
                  for OHN_NUMBER in
                  (
                     OHCF_USRNUM1
                  ,  OHCF_USRNUM2
                  ,  OHCF_USRNUM3
                  ,  OHCF_USRNUM4
                  ,  OHCF_USRNUM5
                  ,  OHCF_USRNUM6
                  ,  OHCF_USRNUM7
                  ,  OHCF_USRNUM8
                  ,  OHCF_USRNUM9
                  ,  OHCF_USRNUM10
                  ,  OHCF_USRNUM11
                  ,  OHCF_USRNUM12
                  ,  OHCF_USRNUM13
                  ,  OHCF_USRNUM14
                  ,  OHCF_USRNUM15
                  ,  OHCF_USRNUM16
                  ,  OHCF_USRNUM17
                  ,  OHCF_USRNUM18
                  ,  OHCF_USRNUM19
                  ,  OHCF_USRNUM20
                  )
            ) as unpivoted
         where
                  OHN_DATA is not null
            and   OHN_DATA <> 0        -- Don't store zero to save on rows. View will translate missing row to 0.
      ) to_be_inserted
   where
      not exists
      (
         select
            1
            from
               ORD_HEADER_CUSTOM_NUMBER OHCN with(nolock)
            where
                     OHCN.OHN_HEADER_LINK = to_be_inserted.OHN_HEADER_LINK
               and   OHCN.OHN_NUMBER      = to_be_inserted.OHN_NUMBER
      )
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_NUMBER',16,1)
      return
   end

-- Date fields
delete from ORD_HEADER_CUSTOM_DATE
   from
      (
         select
            OHD_HEADER_LINK
         ,  cast(replace(OHD_NUMBER,'OHCF_USRDATE','') as tinyint)   OHD_NUMBER
         ,  OHD_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHD_HEADER_LINK
               ,  OHCF_USRDATE1
               ,  OHCF_USRDATE2
               ,  OHCF_USRDATE3
               ,  OHCF_USRDATE4
               ,  OHCF_USRDATE5
               ,  OHCF_USRDATE6
               ,  OHCF_USRDATE7
               ,  OHCF_USRDATE8
               ,  OHCF_USRDATE9
               ,  OHCF_USRDATE10
                  from
                     inserted
            ) original
            unpivot
            (
               OHD_DATA
                  for OHD_NUMBER in
                  (
                     OHCF_USRDATE1
                  ,  OHCF_USRDATE2
                  ,  OHCF_USRDATE3
                  ,  OHCF_USRDATE4
                  ,  OHCF_USRDATE5
                  ,  OHCF_USRDATE6
                  ,  OHCF_USRDATE7
                  ,  OHCF_USRDATE8
                  ,  OHCF_USRDATE9
                  ,  OHCF_USRDATE10
                  )
            ) as unpivoted
         where
            OHD_DATA >= @LT_EndOfTime
      ) to_be_deleted
      inner join ORD_HEADER_CUSTOM_DATE OHCD on       OHCD.OHD_HEADER_LINK = to_be_deleted.OHD_HEADER_LINK
                                                and   OHCD.OHD_NUMBER      = to_be_deleted.OHD_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to delete from table ORD_HEADER_CUSTOM_DATE',16,1)
      return
   end

update OHCD
   set
      OHCD.OHD_DATA = to_be_updated.OHD_DATA
   from
      (
         select
            OHD_HEADER_LINK
         ,  cast(replace(OHD_NUMBER,'OHCF_USRDATE','') as tinyint)   OHD_NUMBER
         ,  OHD_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHD_HEADER_LINK
               ,  OHCF_USRDATE1
               ,  OHCF_USRDATE2
               ,  OHCF_USRDATE3
               ,  OHCF_USRDATE4
               ,  OHCF_USRDATE5
               ,  OHCF_USRDATE6
               ,  OHCF_USRDATE7
               ,  OHCF_USRDATE8
               ,  OHCF_USRDATE9
               ,  OHCF_USRDATE10
                  from
                     inserted
            ) original
            unpivot
            (
               OHD_DATA
                  for OHD_NUMBER in
                  (
                     OHCF_USRDATE1
                  ,  OHCF_USRDATE2
                  ,  OHCF_USRDATE3
                  ,  OHCF_USRDATE4
                  ,  OHCF_USRDATE5
                  ,  OHCF_USRDATE6
                  ,  OHCF_USRDATE7
                  ,  OHCF_USRDATE8
                  ,  OHCF_USRDATE9
                  ,  OHCF_USRDATE10
                  )
            ) as unpivoted
         where
                  OHD_DATA is not null
            and   OHD_DATA < @LT_EndOfTime
      ) to_be_updated
      inner join ORD_HEADER_CUSTOM_DATE OHCD on       OHCD.OHD_HEADER_LINK = to_be_updated.OHD_HEADER_LINK
                                                and   OHCD.OHD_NUMBER      = to_be_updated.OHD_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to update table ORD_HEADER_CUSTOM_DATE',16,1)
      return
   end

insert into ORD_HEADER_CUSTOM_DATE
select
   to_be_inserted.OHD_HEADER_LINK
,  to_be_inserted.OHD_NUMBER
,  to_be_inserted.OHD_DATA
   from
      (
         select
            OHD_HEADER_LINK
         ,  cast(replace(OHD_NUMBER,'OHCF_USRDATE','') as tinyint)   OHD_NUMBER
         ,  OHD_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHD_HEADER_LINK
               ,  OHCF_USRDATE1
               ,  OHCF_USRDATE2
               ,  OHCF_USRDATE3
               ,  OHCF_USRDATE4
               ,  OHCF_USRDATE5
               ,  OHCF_USRDATE6
               ,  OHCF_USRDATE7
               ,  OHCF_USRDATE8
               ,  OHCF_USRDATE9
               ,  OHCF_USRDATE10
                  from
                     inserted
            ) original
            unpivot
            (
               OHD_DATA
                  for OHD_NUMBER in
                  (
                     OHCF_USRDATE1
                  ,  OHCF_USRDATE2
                  ,  OHCF_USRDATE3
                  ,  OHCF_USRDATE4
                  ,  OHCF_USRDATE5
                  ,  OHCF_USRDATE6
                  ,  OHCF_USRDATE7
                  ,  OHCF_USRDATE8
                  ,  OHCF_USRDATE9
                  ,  OHCF_USRDATE10
                  )
            ) as unpivoted
         where
                  OHD_DATA is not null
            and   OHD_DATA < @LT_EndOfTime
      ) to_be_inserted
   where
      not exists
      (
         select
            1
            from
               ORD_HEADER_CUSTOM_DATE OHCD with(nolock)
            where
                     OHCD.OHD_HEADER_LINK = to_be_inserted.OHD_HEADER_LINK
               and   OHCD.OHD_NUMBER      = to_be_inserted.OHD_NUMBER
      )
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_DATE',16,1)
      return
   end

-- Flag fields
delete from ORD_HEADER_CUSTOM_FLAG
   from
      (
         select
            OHF_HEADER_LINK
         ,  cast(replace(OHF_NUMBER,'OHCF_USRFLAG','') as tinyint)   OHF_NUMBER
         ,  OHF_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHF_HEADER_LINK
               ,  OHCF_USRFLAG1
               ,  OHCF_USRFLAG2
               ,  OHCF_USRFLAG3
               ,  OHCF_USRFLAG4
               ,  OHCF_USRFLAG5
               ,  OHCF_USRFLAG6
               ,  OHCF_USRFLAG7
               ,  OHCF_USRFLAG8
               ,  OHCF_USRFLAG9
               ,  OHCF_USRFLAG10
                  from
                     inserted
            ) original
            unpivot
            (
               OHF_DATA
                  for OHF_NUMBER in
                  (
                     OHCF_USRFLAG1
                  ,  OHCF_USRFLAG2
                  ,  OHCF_USRFLAG3
                  ,  OHCF_USRFLAG4
                  ,  OHCF_USRFLAG5
                  ,  OHCF_USRFLAG6
                  ,  OHCF_USRFLAG7
                  ,  OHCF_USRFLAG8
                  ,  OHCF_USRFLAG9
                  ,  OHCF_USRFLAG10
                  )
            ) as unpivoted
         where
            OHF_DATA = 0         -- Don't store 0 to save on rows. View will translate missing row to 0.
      ) to_be_deleted
      inner join ORD_HEADER_CUSTOM_FLAG OHCF on       OHCF.OHF_HEADER_LINK = to_be_deleted.OHF_HEADER_LINK
                                                and   OHCF.OHF_NUMBER      = to_be_deleted.OHF_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to delete from table ORD_HEADER_CUSTOM_FLAG',16,1)
      return
   end

update OHCF
   set
      OHCF.OHF_DATA = to_be_updated.OHF_DATA
   from
      (
         select
            OHF_HEADER_LINK
         ,  cast(replace(OHF_NUMBER,'OHCF_USRFLAG','') as tinyint)   OHF_NUMBER
         ,  OHF_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHF_HEADER_LINK
               ,  OHCF_USRFLAG1
               ,  OHCF_USRFLAG2
               ,  OHCF_USRFLAG3
               ,  OHCF_USRFLAG4
               ,  OHCF_USRFLAG5
               ,  OHCF_USRFLAG6
               ,  OHCF_USRFLAG7
               ,  OHCF_USRFLAG8
               ,  OHCF_USRFLAG9
               ,  OHCF_USRFLAG10
                  from
                     inserted
            ) original
            unpivot
            (
               OHF_DATA
                  for OHF_NUMBER in
                  (
                     OHCF_USRFLAG1
                  ,  OHCF_USRFLAG2
                  ,  OHCF_USRFLAG3
                  ,  OHCF_USRFLAG4
                  ,  OHCF_USRFLAG5
                  ,  OHCF_USRFLAG6
                  ,  OHCF_USRFLAG7
                  ,  OHCF_USRFLAG8
                  ,  OHCF_USRFLAG9
                  ,  OHCF_USRFLAG10
                  )
            ) as unpivoted
         where
                  OHF_DATA is not null
            and   OHF_DATA <> 0        -- Don't store zero to save on rows. View will translate missing row to 0.
      ) to_be_updated
      inner join ORD_HEADER_CUSTOM_FLAG OHCF on       OHCF.OHF_HEADER_LINK = to_be_updated.OHF_HEADER_LINK
                                                and   OHCF.OHF_NUMBER      = to_be_updated.OHF_NUMBER
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to update table ORD_HEADER_CUSTOM_FLAG',16,1)
      return
   end

insert into ORD_HEADER_CUSTOM_FLAG
select
   to_be_inserted.OHF_HEADER_LINK
,  to_be_inserted.OHF_NUMBER
,  to_be_inserted.OHF_DATA
   from
      (
         select
            OHF_HEADER_LINK
         ,  cast(replace(OHF_NUMBER,'OHCF_USRFLAG','') as tinyint)   OHF_NUMBER
         ,  OHF_DATA
            from
            (
               select
                  OHCF_PRIMARY   OHF_HEADER_LINK
               ,  OHCF_USRFLAG1
               ,  OHCF_USRFLAG2
               ,  OHCF_USRFLAG3
               ,  OHCF_USRFLAG4
               ,  OHCF_USRFLAG5
               ,  OHCF_USRFLAG6
               ,  OHCF_USRFLAG7
               ,  OHCF_USRFLAG8
               ,  OHCF_USRFLAG9
               ,  OHCF_USRFLAG10
                  from
                     inserted
            ) original
            unpivot
            (
               OHF_DATA
                  for OHF_NUMBER in
                  (
                     OHCF_USRFLAG1
                  ,  OHCF_USRFLAG2
                  ,  OHCF_USRFLAG3
                  ,  OHCF_USRFLAG4
                  ,  OHCF_USRFLAG5
                  ,  OHCF_USRFLAG6
                  ,  OHCF_USRFLAG7
                  ,  OHCF_USRFLAG8
                  ,  OHCF_USRFLAG9
                  ,  OHCF_USRFLAG10
                  )
            ) as unpivoted
            where
                     OHF_DATA is not null
               and   OHF_DATA <> 0        -- Don't store zero to save on rows. View will translate missing row to 0.
      ) to_be_inserted
   where
      not exists
      (
         select
            1
            from
               ORD_HEADER_CUSTOM_FLAG OHCF with(nolock)
            where
                     OHCF.OHF_HEADER_LINK = to_be_inserted.OHF_HEADER_LINK
               and   OHCF.OHF_NUMBER      = to_be_inserted.OHF_NUMBER
      )
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_FLAG',16,1)
      return
   end
GO
create trigger AA_SOP_ORDER_CUSTOM_FIELDS_VIEW_IOIT
/*
** This trigger translates the insert on the view to the custom field talbes
**
** Written     :  27/08/2010 SM
** Last Amended:  03/09/2010 DB
*/
on AA_SOP_ORDER_CUSTOM_FIELDS_VIEW
instead of insert

as

-- Check if a pretend "row" has already been created for the specified order (e.g. it exists in the view)
if exists
   (
      select
         1
         from
            AA_SOP_ORDER_CUSTOM_FIELDS_VIEW
               inner join inserted on AA_SOP_ORDER_CUSTOM_FIELDS_VIEW.OHCF_PRIMARY = inserted.OHCF_PRIMARY
   )
   begin
      if @@trancount > 0
         rollback tran
      raiserror('There is already a record in AA_SOP_ORDER_CUSTOM_FIELDS_VIEW with the specified OHCF_PRIMARY',16,1)
      return
   end

-- Char fields
insert into ORD_HEADER_CUSTOM_CHAR
select
   OHC_HEADER_LINK
,  cast(replace(OHC_NUMBER,'OHCF_USRCHAR','') as tinyint)   OHC_NUMBER
,  OHC_DATA
   from
   (
      select
         OHCF_PRIMARY   OHC_HEADER_LINK
      ,  OHCF_USRCHAR1
      ,  OHCF_USRCHAR2
      ,  OHCF_USRCHAR3
      ,  OHCF_USRCHAR4
      ,  OHCF_USRCHAR5
      ,  OHCF_USRCHAR6
      ,  OHCF_USRCHAR7
      ,  OHCF_USRCHAR8
      ,  OHCF_USRCHAR9
      ,  OHCF_USRCHAR10
      ,  OHCF_USRCHAR11
      ,  OHCF_USRCHAR12
      ,  OHCF_USRCHAR13
      ,  OHCF_USRCHAR14
      ,  OHCF_USRCHAR15
      ,  OHCF_USRCHAR16
      ,  OHCF_USRCHAR17
      ,  OHCF_USRCHAR18
      ,  OHCF_USRCHAR19
      ,  OHCF_USRCHAR20
         from
            inserted
   ) original
   unpivot
   (
      OHC_DATA
         for OHC_NUMBER in
         (
            OHCF_USRCHAR1
         ,  OHCF_USRCHAR2
         ,  OHCF_USRCHAR3
         ,  OHCF_USRCHAR4
         ,  OHCF_USRCHAR5
         ,  OHCF_USRCHAR6
         ,  OHCF_USRCHAR7
         ,  OHCF_USRCHAR8
         ,  OHCF_USRCHAR9
         ,  OHCF_USRCHAR10
         ,  OHCF_USRCHAR11
         ,  OHCF_USRCHAR12
         ,  OHCF_USRCHAR13
         ,  OHCF_USRCHAR14
         ,  OHCF_USRCHAR15
         ,  OHCF_USRCHAR16
         ,  OHCF_USRCHAR17
         ,  OHCF_USRCHAR18
         ,  OHCF_USRCHAR19
         ,  OHCF_USRCHAR20
         )
   ) as unpivoted
where
         OHC_DATA is not null
   and   OHC_DATA <> ''       -- Don't store empty strings to save on rows. View will translate missing row to empty string.
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_CHAR',16,1)
      return
   end

-- Number fields
insert into ORD_HEADER_CUSTOM_NUMBER
select
   OHN_HEADER_LINK
,  cast(replace(OHN_NUMBER,'OHCF_USRNUM','') as tinyint)   OHN_NUMBER
,  OHN_DATA
   from
   (
      select
         OHCF_PRIMARY   OHN_HEADER_LINK
      ,  OHCF_USRNUM1
      ,  OHCF_USRNUM2
      ,  OHCF_USRNUM3
      ,  OHCF_USRNUM4
      ,  OHCF_USRNUM5
      ,  OHCF_USRNUM6
      ,  OHCF_USRNUM7
      ,  OHCF_USRNUM8
      ,  OHCF_USRNUM9
      ,  OHCF_USRNUM10
      ,  OHCF_USRNUM11
      ,  OHCF_USRNUM12
      ,  OHCF_USRNUM13
      ,  OHCF_USRNUM14
      ,  OHCF_USRNUM15
      ,  OHCF_USRNUM16
      ,  OHCF_USRNUM17
      ,  OHCF_USRNUM18
      ,  OHCF_USRNUM19
      ,  OHCF_USRNUM20
         from
            inserted
   ) original
   unpivot
   (
      OHN_DATA
         for OHN_NUMBER in
         (
            OHCF_USRNUM1
         ,  OHCF_USRNUM2
         ,  OHCF_USRNUM3
         ,  OHCF_USRNUM4
         ,  OHCF_USRNUM5
         ,  OHCF_USRNUM6
         ,  OHCF_USRNUM7
         ,  OHCF_USRNUM8
         ,  OHCF_USRNUM9
         ,  OHCF_USRNUM10
         ,  OHCF_USRNUM11
         ,  OHCF_USRNUM12
         ,  OHCF_USRNUM13
         ,  OHCF_USRNUM14
         ,  OHCF_USRNUM15
         ,  OHCF_USRNUM16
         ,  OHCF_USRNUM17
         ,  OHCF_USRNUM18
         ,  OHCF_USRNUM19
         ,  OHCF_USRNUM20
         )
   ) as unpivoted
where
         OHN_DATA is not null
   and   OHN_DATA <> 0        -- Don't store zero to save on rows. View will translate missing row to 0.
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_NUMBER',16,1)
      return
   end

-- Date fields
insert into ORD_HEADER_CUSTOM_DATE
select
   OHD_HEADER_LINK
,  cast(replace(OHD_NUMBER,'OHCF_USRDATE','') as tinyint)   OHD_NUMBER
,  OHD_DATA
   from
   (
      select
         OHCF_PRIMARY   OHD_HEADER_LINK
      ,  OHCF_USRDATE1
      ,  OHCF_USRDATE2
      ,  OHCF_USRDATE3
      ,  OHCF_USRDATE4
      ,  OHCF_USRDATE5
      ,  OHCF_USRDATE6
      ,  OHCF_USRDATE7
      ,  OHCF_USRDATE8
      ,  OHCF_USRDATE9
      ,  OHCF_USRDATE10
         from
            inserted
   ) original
   unpivot
   (
      OHD_DATA
         for OHD_NUMBER in
         (
            OHCF_USRDATE1
         ,  OHCF_USRDATE2
         ,  OHCF_USRDATE3
         ,  OHCF_USRDATE4
         ,  OHCF_USRDATE5
         ,  OHCF_USRDATE6
         ,  OHCF_USRDATE7
         ,  OHCF_USRDATE8
         ,  OHCF_USRDATE9
         ,  OHCF_USRDATE10
         )
   ) as unpivoted
where
   OHD_DATA is not null
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_DATE',16,1)
      return
   end

-- Flag fields
insert into ORD_HEADER_CUSTOM_FLAG
select
   OHF_HEADER_LINK
,  cast(replace(OHF_NUMBER,'OHCF_USRFLAG','') as tinyint)   OHF_NUMBER
,  OHF_DATA
   from
   (
      select
         OHCF_PRIMARY   OHF_HEADER_LINK
      ,  OHCF_USRFLAG1
      ,  OHCF_USRFLAG2
      ,  OHCF_USRFLAG3
      ,  OHCF_USRFLAG4
      ,  OHCF_USRFLAG5
      ,  OHCF_USRFLAG6
      ,  OHCF_USRFLAG7
      ,  OHCF_USRFLAG8
      ,  OHCF_USRFLAG9
      ,  OHCF_USRFLAG10
         from
            inserted
   ) original
   unpivot
   (
      OHF_DATA
         for OHF_NUMBER in
         (
            OHCF_USRFLAG1
         ,  OHCF_USRFLAG2
         ,  OHCF_USRFLAG3
         ,  OHCF_USRFLAG4
         ,  OHCF_USRFLAG5
         ,  OHCF_USRFLAG6
         ,  OHCF_USRFLAG7
         ,  OHCF_USRFLAG8
         ,  OHCF_USRFLAG9
         ,  OHCF_USRFLAG10
         )
   ) as unpivoted
where
         OHF_DATA is not null
   and   OHF_DATA <> 0        -- Don't store zero to save on rows. View will translate missing row to 0.
if @@error <> 0
   begin
      if @@trancount > 0
         rollback tran
      raiserror('Unable to insert into table ORD_HEADER_CUSTOM_FLAG',16,1)
      return
   end