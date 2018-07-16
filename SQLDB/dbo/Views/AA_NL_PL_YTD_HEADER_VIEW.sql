CREATE VIEW AA_NL_PL_YTD_HEADER_VIEW
AS
/*
** 
** Intended to be called by AA_NL_PROFIT_LOSS_HEADER_S with AA_NL_PROFIT_LOSS_HEADER_VIEW
** The main search fields are in AA_NL_PROFIT_LOSS_HEADER_VIEW along with the other financial fields.
** The following fields are intended to be displayed:
** 
**          Budget YTD (home)                - BUD
**          Difference YTD (home)            - DIFF
**
**          [PRIMARY] identifies a row in the result set
**
** These fields are provided to identify a row in the main view (AA_NL_PROFIT_LOSS_HEADER_VIEW):
**          B_PERIOD
**          B_YEAR
**          NMAJORCODE
**          B_ACCOUNT_CODE
**          REV_NO
**
** The list will be sorted by PRIMARY with any other supplied order by field
**
** Written:      29/10/2005 SB
** Last Amended: 22/12/2005 SB, 20/01/2006 SB
*/
select 
   N.[PRIMARY] YTD_PRIMARY
   ,isnull(BV.B_PERIOD,N.PERIOD) B_PERIOD
   ,isnull(BV.B_YEAR,case N.YEAR when 'L' then -1 when 'C' then 0 else 1 end) B_YEAR
   ,N.NMAJORCODE
   --£ Budget PTD
   ,dbo.AA_VALUE_DPS_F(isnull(BV.B_VALUE,cast(0.0 as decimal(24,8))) * case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) BUD
   --£ Difference PTD
   ,dbo.AA_VALUE_DPS_F((case isnull(BV.B_VALUE,0) when 0 then cast(0.0 as decimal(24,8)) else N.NTURNOVER - BV.B_VALUE end) * (case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end)) DIFF
   ,isnull(BV.B_ACCOUNT_CODE,N.NCODE) B_ACCOUNT_CODE
   ,isnull(BV.B_REVISION_NUMBER,0) REV_NO
from 
   (
      select -1 as TURNOVER_YEAR  union
      select 0                    union
      select 1
   ) U -- Force correct number and types of years

   cross join  (
      select 1 as TURNOVER_PERIOD union
      select 2                    union
      select 3                    union
      select 4                    union
      select 5                    union
      select 6                    union
      select 7                    union
      select 8                    union
      select 9                    union
      select 10                   union
      select 11                   union
      select 12                   union
      select 13
   ) P
      left join SYS_BUDGETS BV on
         BV.B_RECORD_TYPE           = 'N'
         and   BV.B_YEAR            = U.TURNOVER_YEAR
         and   BV.B_PERIOD          = P.TURNOVER_PERIOD
         and   BV.B_BUDGET_TYPE     = 'B'
      right join (select 
   V.[PRIMARY]
   ,V.HEADCODE
   ,NCODE
   ,V.NMAJORHEADCODE NMAJORCODE
   ,V.NL_MAJORNAME NMAJORNAME
   ,V.NCURRENCYCODE NCURRCODE
   ,V.NCATEGORYCODE1 NCATCODE1
   ,V.NCATEGORYCODE2 NCATCODE2
   ,V.NCATEGORYCODE3 NCATCODE3
   ,V.NCATEGORYCODE4 NCATCODE4
   ,V.NCATEGORYCODE5 NCATCODE5
   ,V.NCATEGORYCODE6 NCATCODE6
   ,V.NCATEGORYCODE7 NCATCODE7
   ,V.NCATEGORYCODE8 NCATCODE8
   ,V.PERIOD 
   ,V.YEAR 
   --Turnover
   , NTURNOVER
from 
   (
      select -1 as TURNOVER_YEAR  union
      select 0                    union
      select 1
   ) U -- Force correct number and types of years

   cross join  (
      select 1 as TURNOVER_PERIOD union
      select 2                    union
      select 3                    union
      select 4                    union
      select 5                    union
      select 6                    union
      select 7                    union
      select 8                    union
      select 9                    union
      select 10                   union
      select 11                   union
      select 12                   union
      select 13
   ) P
      inner join (
   select NM_PRIMARY [PRIMARY]
   ,cast(NM_PRIMARY as decimal(16,1)) HEADCODE
   ,NCODE 
   ,isnull(NNAME,'') NNAME
   ,isnull(NCATEGORYCODE1,'') NCATEGORYCODE1
   ,isnull(NCATEGORYCODE2,'') NCATEGORYCODE2
   ,isnull(NCATEGORYCODE3,'') NCATEGORYCODE3
   ,isnull(NCATEGORYCODE4,'') NCATEGORYCODE4
   ,isnull(NCATEGORYCODE5,'') NCATEGORYCODE5
   ,isnull(NCATEGORYCODE6,'') NCATEGORYCODE6
   ,isnull(NCATEGORYCODE7,'') NCATEGORYCODE7
   ,isnull(NCATEGORYCODE8,'') NCATEGORYCODE8
   ,NMAJORHEADCODE 
   ,NCURRENCYCODE
   ,cast(case
         when PERIOD = 1 and YEAR ='C' then N1.NTURNOVER_C1
         when PERIOD = 2 and YEAR ='C' then N1.NTURNOVER_C2
         when PERIOD = 3 and YEAR ='C' then N1.NTURNOVER_C3
         when PERIOD = 4 and YEAR ='C' then N1.NTURNOVER_C4
         when PERIOD = 5 and YEAR ='C' then N1.NTURNOVER_C5
         when PERIOD = 6 and YEAR ='C' then N1.NTURNOVER_C6
         when PERIOD = 7 and YEAR ='C' then N1.NTURNOVER_C7
         when PERIOD = 8 and YEAR ='C' then N1.NTURNOVER_C8
         when PERIOD = 9 and YEAR ='C' then N1.NTURNOVER_C9
         when PERIOD = 10 and YEAR ='C' then N1.NTURNOVER_C10
         when PERIOD = 11 and YEAR ='C' then N1.NTURNOVER_C11
         when PERIOD = 12 and YEAR ='C' then N1.NTURNOVER_C12
         when PERIOD = 13 and YEAR ='C' then N1.NTURNOVER_C13
         when PERIOD = 1 and YEAR ='L' then N1.NTURNOVER_L1
         when PERIOD = 2 and YEAR ='L' then N1.NTURNOVER_L2
         when PERIOD = 3 and YEAR ='L' then N1.NTURNOVER_L3
         when PERIOD = 4 and YEAR ='L' then N1.NTURNOVER_L4
         when PERIOD = 5 and YEAR ='L' then N1.NTURNOVER_L5
         when PERIOD = 6 and YEAR ='L' then N1.NTURNOVER_L6
         when PERIOD = 7 and YEAR ='L' then N1.NTURNOVER_L7
         when PERIOD = 8 and YEAR ='L' then N1.NTURNOVER_L8
         when PERIOD = 9 and YEAR ='L' then N1.NTURNOVER_L9
         when PERIOD = 10 and YEAR ='L' then N1.NTURNOVER_L10
         when PERIOD = 11 and YEAR ='L' then N1.NTURNOVER_L11
         when PERIOD = 12 and YEAR ='L' then N1.NTURNOVER_L12
         when PERIOD = 13 and YEAR ='L' then N1.NTURNOVER_L13
         when PERIOD = 1 and YEAR ='N' then N1.NTURNOVER_N1
         when PERIOD = 2 and YEAR ='N' then N1.NTURNOVER_N2
         when PERIOD = 3 and YEAR ='N' then N1.NTURNOVER_N3
         when PERIOD = 4 and YEAR ='N' then N1.NTURNOVER_N4
         when PERIOD = 5 and YEAR ='N' then N1.NTURNOVER_N5
         when PERIOD = 6 and YEAR ='N' then N1.NTURNOVER_N6
         when PERIOD = 7 and YEAR ='N' then N1.NTURNOVER_N7
         when PERIOD = 8 and YEAR ='N' then N1.NTURNOVER_N8
         when PERIOD = 9 and YEAR ='N' then N1.NTURNOVER_N9
         when PERIOD = 10 and YEAR ='N' then N1.NTURNOVER_N10
         when PERIOD = 11 and YEAR ='N' then N1.NTURNOVER_N11
         when PERIOD = 12 and YEAR ='N' then N1.NTURNOVER_N12
         when PERIOD = 13 and YEAR ='N' then N1.NTURNOVER_N13
         else 0 end as decimal(24,8)) NTURNOVER
      ,isnull(dbo.NL_MAJORHEADING.NL_MAJORNAME,'') NL_MAJORNAME
      ,PERIOD
      ,YEAR
   from NL_ACCOUNTS N1 inner join dbo.NL_MAJORHEADING on NMAJORHEADCODE = dbo.NL_MAJORHEADING.NL_MAJORCODE
      ,(select 1 as PERIOD union select 2 as PERIOD union select 3 as PERIOD
         union select 4 as PERIOD union select 5 as PERIOD
         union select 6 as PERIOD union select 7 as PERIOD union select 8 as PERIOD
         union select 9 as PERIOD union select 10 as PERIOD
         union select 11 as PERIOD union select 12 as PERIOD union select 13 as PERIOD
       ) PERIODS
       ,(select 'L' as Year union select 'C' as Year union select 'N' as Year) YEARS
   where isnull(dbo.NL_MAJORHEADING.NL_MAJORCODE,0) between 1 and 6
   ) V on
         P.TURNOVER_PERIOD = V.PERIOD
         and U.TURNOVER_YEAR = case V.YEAR when 'L' then -1 when 'C' then 0 else 1 end) N on
         BV.B_ACCOUNT_CODE = N.NCODE and
          BV.B_PERIOD = N.PERIOD
         and BV.B_YEAR = case N.YEAR when 'L' then -1 when 'C' then 0 else 1 end