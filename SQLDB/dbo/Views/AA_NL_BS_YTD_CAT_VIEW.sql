CREATE VIEW AA_NL_BS_YTD_CAT_VIEW
AS
/*
** 
** Intended to be called by AA_NL_BALANCE_SHEET_CAT_S with AA_NL_BALANCE_SHEET_CAT_VIEW
** The main search fields are in AA_NL_BS_YTD_CAT_VIEW along with the other financial fields.
** The following fields are intended to be displayed:
** 
**          Budget YTD (home)                - BUD_YTD
**          Last Year Budget YTD (home)      - BUD_YTD_L
**          Difference YTD (home)            - DIFF_YTD
**          Difference YTD Percent (home)    - DIFF_YTD_PC
**
**          [PRIMARY] identifies a row in the result set
**
** The list will be sorted by PRIMARY with any other supplied order by field
**
** Written:      29/10/2005 SB
** Last Amended: 10/01/2006 SB, 20/01/2006 SB
*/
select
   N.[PRIMARY] YTD_PRIMARY
   ,isnull(BV.B_PERIOD, N.PERIOD) B_PERIOD
   ,isnull(BV.B_YEAR, case N.YEAR when 'L' then -1 when 'C' then 0 else 1 end) B_YEAR
   ,N.CATEGORY
   --£ Budget YTD
   ,dbo.AA_VALUE_DPS_F(isnull(B_VALUE, cast(0 as decimal(24,8))) * case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) BUD_YTD
   --£ Difference YTD
   ,dbo.AA_VALUE_DPS_F((case isnull(B_VALUE,0) when 0 then cast(0 as decimal(24,8)) else NTURNOVER_YTD - B_VALUE end) * (case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end)) DIFF_YTD
   --Difference YTD %
   ,dbo.AA_VALUE_DPS_F(isnull(case B_VALUE when 0 then 0
    else (NTURNOVER_YTD - B_VALUE) * (case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) end * (case B_VALUE * (case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) when 0 then 0 else 100/B_VALUE * (case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) end),cast(0 as decimal(24,8)))) DIFF_YTD_PC
   --£ Last Year Budget YTD
   ,dbo.AA_VALUE_DPS_F(isnull(BUD_YTD_L,cast(0 as decimal(24,8)))) BUD_YTD_L
   ,isnull(BV.B_ACCOUNT_CODE,N.NCODE) B_ACCOUNT_CODE
   ,isnull(BV.B_REVISION_NUMBER,0) REV_NO
from AA_NL_BALANCE_SHEET_CAT_VIEW N 
      left join SYS_BUDGETS BV on
         N.NCODE        = BV.B_ACCOUNT_CODE
         and N.PERIOD   = BV.B_PERIOD
         and case N.YEAR when 'L' then -1 when 'C' then 0 else 1 end = BV.B_YEAR
      left join (select 
         N.[PRIMARY]
         ,isnull(BV.B_PERIOD, N.PERIOD) B_PERIOD
         ,isnull(BV.B_YEAR, case N.YEAR when 'L' then -1 when 'C' then 0 else 1 end) B_YEAR
         ,N.CATEGORY
         --£ Last Year Budget YTD
         ,sum(isnull(B_VALUE,cast(0 as decimal(24,8))) * case NMAJORCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) BUD_YTD_L
         ,isnull(BV.B_ACCOUNT_CODE,N.NCODE) B_ACCOUNT_CODE
         ,isnull(BV.B_REVISION_NUMBER,0) REV_NO
      from 
         AA_NL_BALANCE_SHEET_CAT_VIEW N 
         left join SYS_BUDGETS BV on
            N.NCODE        = BV.B_ACCOUNT_CODE
            and N.PERIOD   = BV.B_PERIOD
            and case N.YEAR when 'L' then -1 when 'C' then 0 else 1 end = BV.B_YEAR 
      where
         BV.B_RECORD_TYPE           = 'N'
         and   BV.B_YEAR            = -1
         and   BV.B_BUDGET_TYPE     = 'B'         
      group by N.[PRIMARY]
         ,BV.B_YEAR 
         ,N.YEAR
         ,BV.B_PERIOD 
         ,N.PERIOD
         ,N.CATEGORY
         ,BV.B_ACCOUNT_CODE
         ,N.NCODE
         ,BV.B_REVISION_NUMBER 
      ) L --Last Year's Budget figures
      on L.B_ACCOUNT_CODE  = N.NCODE
      and L.[PRIMARY]      = N.[PRIMARY]
      and L.B_PERIOD       = N.PERIOD
      and L.REV_NO         = BV.B_REVISION_NUMBER
   group by N.[PRIMARY]
   ,BV.B_YEAR 
   ,N.YEAR
   ,BV.B_PERIOD 
   ,N.PERIOD
   ,N.CATEGORY
   ,BV.B_ACCOUNT_CODE
   ,N.NCODE
   ,BV.B_REVISION_NUMBER 
   ,BUD_YTD_L
   ,NMAJORCODE
   ,B_VALUE
   ,NTURNOVER_YTD