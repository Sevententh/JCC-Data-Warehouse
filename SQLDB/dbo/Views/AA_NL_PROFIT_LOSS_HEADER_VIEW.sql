CREATE VIEW AA_NL_PROFIT_LOSS_HEADER_VIEW
AS
/*
** 
** Intended to be called by AA_NL_PROFIT_LOSS_HEADER_S
** The following fields are intended to be displayed:
**          Major Heading Name               - NMAJORNAME
**          £ Actual PTD (home)              - ACT_PTD
**          Actual YTD (home)                - ACT_YTD
**          Budget PTD (home)                - BUD_PTD
**          Difference PTD (home)            - DIFF_PTD
**          Difference PTD Percent (home)    - DIFF_PTD_PC
**          Actual PTD (Currency)            - ACT_PTD_C
**          Actual YTD (Currency)            - ACT_YTD_C
**          Budget PTD (Currency)            - BUD_PTD_C (always 0)
**          Budget YTD (Currency)            - BUD_YTD_C (always 0)
**          Difference PTD (Currency)        - DIFF_PTD_C (always 0)
**          Difference YTD (Currency)        - DIFF_YTD_C (always 0)
**          Difference PTD Percent (Curr)    - DIFF_PTD_PC_C (always 0)
**          Difference YTD Percent (Curr)    - DIFF_YTD_PC_C (always 0)
**
** The following fields are required for searching
**          Nominal Account Code             - NCODE
**          Nominal Account Name             - NNAME
**          Currency Code                    - NCURRCODE
**          Category Codes                   - NCATCODE1-NCATCODE8
**          Major Heading Code               - NMAJORCODE
**          Year (L,C,N)                     - YEAR
**          Period (1-13)                    - PERIOD
**          Revision Number                  - REV_NO
**
**          [PRIMARY] identifies a row in the result set
**          HEADCODE is intended to allow the client to rearrange the data layout in a grid
**
** The following fields are required by the view AA_NL_PL_YTD_HEADER_VIEW and the procedure AA_NL_PROFIT_LOSS_HEADER_S:
**          B_ACCOUNT_CODE
**          B_YEAR
**          B_PERIOD
**          NTURNOVER
**
** The following fields are now calculated from data accessed through AA_NL_PL_YTD_HEADER_VIEW and are no longer in
** this view:
**          Budget YTD (home)                - BUD_YTD
**          Difference YTD (home)            - DIFF_YTD
**          Difference YTD Percent (home)    - DIFF_YTD_PC
**
** The list will be sorted by PRIMARY with any other supplied order by field
**
** Written:      21/09/2005 SB
** Last Amended: 05/10/2005 SB, 13/10/2005 SB, 10/11/2005 SB, 22/12/05 SB, 19/01/06 SB
*/
select 
   V.[PRIMARY]
   ,V.HEADCODE
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
   --£ Actual PTD 
   ,dbo.AA_VALUE_DPS_F(case NMAJORHEADCODE when 1 then -NTURNOVER when 3 then -NTURNOVER when 10 then -NTURNOVER when 11 then -NTURNOVER when 12 then -NTURNOVER else NTURNOVER end) ACT_PTD
   --Currency Actual PTD
   ,dbo.AA_VALUE_DPS_F(case NMAJORHEADCODE when 1 then -NTURNOVER_CURR when 3 then -NTURNOVER_CURR when 10 then -NTURNOVER_CURR when 11 then -NTURNOVER_CURR when 12 then -NTURNOVER_CURR else NTURNOVER_CURR end) ACT_PTD_C
   --£ Actual YTD 
   ,dbo.AA_VALUE_DPS_F(case NMAJORHEADCODE when 1 then -NTURNOVER_YTD when 3 then -NTURNOVER_YTD when 10 then -NTURNOVER_YTD when 11 then -NTURNOVER_YTD when 12 then -NTURNOVER_YTD else NTURNOVER_YTD end) ACT_YTD
   --Currency Actual YTD
   ,dbo.AA_VALUE_DPS_F(case NMAJORHEADCODE when 1 then -NTURNOVER_YTD_CURR when 3 then -NTURNOVER_YTD_CURR when 10 then -NTURNOVER_YTD_CURR when 11 then -NTURNOVER_YTD_CURR when 12 then -NTURNOVER_YTD_CURR else NTURNOVER_YTD_CURR end) ACT_YTD_C
   --£ Budget PTD 
   ,dbo.AA_VALUE_DPS_F(isnull(BV.B_VALUE,cast(0 as decimal(24,8))) * case NMAJORHEADCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) BUD_PTD
   --Currency Budget PTD 
   ,dbo.AA_VALUE_DPS_F(0) BUD_PTD_C
   --Currency Budget YTD
   ,dbo.AA_VALUE_DPS_F(0) BUD_YTD_C
   --£ Difference PTD
   ,dbo.AA_VALUE_DPS_F((case isnull(BV.B_VALUE,0) when 0 then cast(0 as decimal(24,8)) else NTURNOVER - BV.B_VALUE end) * (case NMAJORHEADCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end)) DIFF_PTD
   --Currency Difference PTD
   ,dbo.AA_VALUE_DPS_F(0) DIFF_PTD_C
   --Currency Difference YTD
   ,dbo.AA_VALUE_DPS_F(0) DIFF_YTD_C
   --Difference PTD %
   ,dbo.AA_VALUE_DPS_F((case isnull(BV.B_VALUE,0) when 0 then cast(0 as decimal(24,8)) else (NTURNOVER - BV.B_VALUE) * (case NMAJORHEADCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end) end) * (case (BV.B_VALUE * (case NMAJORHEADCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end)) when 0 then 0 else 100/(BV.B_VALUE * (case NMAJORHEADCODE when 1 then -1 when 3 then -1 when 10 then -1 when 11 then -1 when 12 then -1 else 1 end)) end)) DIFF_PTD_PC
   --Currency Difference PTD %
   ,dbo.AA_VALUE_DPS_F(0) DIFF_PTD_PC_C
   --Currency Difference YTD %
   ,dbo.AA_VALUE_DPS_F(0) DIFF_YTD_PC_C 
   --Turnover
   ,dbo.AA_VALUE_DPS_F(NTURNOVER) NTURNOVER
   --Budget fields.  Provide defaults in case there isn't a corresponding row in the budget table
   ,isnull(B_YEAR,case V.YEAR when 'L' then -1 when 'C' then 0 else 1 end) B_YEAR
   ,isnull(B_PERIOD,V.PERIOD) B_PERIOD
   ,isnull(B_ACCOUNT_CODE,V.NCODE) B_ACCOUNT_CODE
   ,isnull(B_REVISION_NUMBER,0) REV_NO
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
      left join SYS_BUDGETS BV with (index(B_RECORD_TYPE)) on
         BV.B_RECORD_TYPE     = 'N'
         and   BV.B_YEAR            = U.TURNOVER_YEAR
         and   BV.B_PERIOD          = P.TURNOVER_PERIOD
         and   BV.B_BUDGET_TYPE     = 'B'
      right join (
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
         when PERIOD = 1   and YEAR ='C' then N1.NTURNOVER_C1
         when PERIOD = 2   and YEAR ='C' then N1.NTURNOVER_C2
         when PERIOD = 3   and YEAR ='C' then N1.NTURNOVER_C3
         when PERIOD = 4   and YEAR ='C' then N1.NTURNOVER_C4
         when PERIOD = 5   and YEAR ='C' then N1.NTURNOVER_C5
         when PERIOD = 6   and YEAR ='C' then N1.NTURNOVER_C6
         when PERIOD = 7   and YEAR ='C' then N1.NTURNOVER_C7
         when PERIOD = 8   and YEAR ='C' then N1.NTURNOVER_C8
         when PERIOD = 9   and YEAR ='C' then N1.NTURNOVER_C9
         when PERIOD = 10  and YEAR ='C' then N1.NTURNOVER_C10
         when PERIOD = 11  and YEAR ='C' then N1.NTURNOVER_C11
         when PERIOD = 12  and YEAR ='C' then N1.NTURNOVER_C12
         when PERIOD = 13  and YEAR ='C' then N1.NTURNOVER_C13
         when PERIOD = 1   and YEAR ='L' then N1.NTURNOVER_L1
         when PERIOD = 2   and YEAR ='L' then N1.NTURNOVER_L2
         when PERIOD = 3   and YEAR ='L' then N1.NTURNOVER_L3
         when PERIOD = 4   and YEAR ='L' then N1.NTURNOVER_L4
         when PERIOD = 5   and YEAR ='L' then N1.NTURNOVER_L5
         when PERIOD = 6   and YEAR ='L' then N1.NTURNOVER_L6
         when PERIOD = 7   and YEAR ='L' then N1.NTURNOVER_L7
         when PERIOD = 8   and YEAR ='L' then N1.NTURNOVER_L8
         when PERIOD = 9   and YEAR ='L' then N1.NTURNOVER_L9
         when PERIOD = 10  and YEAR ='L' then N1.NTURNOVER_L10
         when PERIOD = 11  and YEAR ='L' then N1.NTURNOVER_L11
         when PERIOD = 12  and YEAR ='L' then N1.NTURNOVER_L12
         when PERIOD = 13  and YEAR ='L' then N1.NTURNOVER_L13
         when PERIOD = 1   and YEAR ='N' then N1.NTURNOVER_N1
         when PERIOD = 2   and YEAR ='N' then N1.NTURNOVER_N2
         when PERIOD = 3   and YEAR ='N' then N1.NTURNOVER_N3
         when PERIOD = 4   and YEAR ='N' then N1.NTURNOVER_N4
         when PERIOD = 5   and YEAR ='N' then N1.NTURNOVER_N5
         when PERIOD = 6   and YEAR ='N' then N1.NTURNOVER_N6
         when PERIOD = 7   and YEAR ='N' then N1.NTURNOVER_N7
         when PERIOD = 8   and YEAR ='N' then N1.NTURNOVER_N8
         when PERIOD = 9   and YEAR ='N' then N1.NTURNOVER_N9
         when PERIOD = 10  and YEAR ='N' then N1.NTURNOVER_N10
         when PERIOD = 11  and YEAR ='N' then N1.NTURNOVER_N11
         when PERIOD = 12  and YEAR ='N' then N1.NTURNOVER_N12
         when PERIOD = 13  and YEAR ='N' then N1.NTURNOVER_N13
         else 0 end as decimal(24,8)) NTURNOVER
      ,cast(case
         when PERIOD = 1   and YEAR ='C' then N1.NTURNOVER_C1_C
         when PERIOD = 2   and YEAR ='C' then N1.NTURNOVER_C2_C
         when PERIOD = 3   and YEAR ='C' then N1.NTURNOVER_C3_C
         when PERIOD = 4   and YEAR ='C' then N1.NTURNOVER_C4_C
         when PERIOD = 5   and YEAR ='C' then N1.NTURNOVER_C5_C
         when PERIOD = 6   and YEAR ='C' then N1.NTURNOVER_C6_C
         when PERIOD = 7   and YEAR ='C' then N1.NTURNOVER_C7_C
         when PERIOD = 8   and YEAR ='C' then N1.NTURNOVER_C8_C
         when PERIOD = 9   and YEAR ='C' then N1.NTURNOVER_C9_C
         when PERIOD = 10  and YEAR ='C' then N1.NTURNOVER_C10_C
         when PERIOD = 11  and YEAR ='C' then N1.NTURNOVER_C11_C
         when PERIOD = 12  and YEAR ='C' then N1.NTURNOVER_C12_C
         when PERIOD = 13  and YEAR ='C' then N1.NTURNOVER_C13_C
         when PERIOD = 1   and YEAR ='L' then N1.NTURNOVER_L1_C
         when PERIOD = 2   and YEAR ='L' then N1.NTURNOVER_L2_C
         when PERIOD = 3   and YEAR ='L' then N1.NTURNOVER_L3_C
         when PERIOD = 4   and YEAR ='L' then N1.NTURNOVER_L4_C
         when PERIOD = 5   and YEAR ='L' then N1.NTURNOVER_L5_C
         when PERIOD = 6   and YEAR ='L' then N1.NTURNOVER_L6_C
         when PERIOD = 7   and YEAR ='L' then N1.NTURNOVER_L7_C
         when PERIOD = 8   and YEAR ='L' then N1.NTURNOVER_L8_C
         when PERIOD = 9   and YEAR ='L' then N1.NTURNOVER_L9_C
         when PERIOD = 10  and YEAR ='L' then N1.NTURNOVER_L10_C
         when PERIOD = 11  and YEAR ='L' then N1.NTURNOVER_L11_C
         when PERIOD = 12  and YEAR ='L' then N1.NTURNOVER_L12_C
         when PERIOD = 13  and YEAR ='L' then N1.NTURNOVER_L13_C
         when PERIOD = 1   and YEAR ='N' then N1.NTURNOVER_N1_C
         when PERIOD = 2   and YEAR ='N' then N1.NTURNOVER_N2_C
         when PERIOD = 3   and YEAR ='N' then N1.NTURNOVER_N3_C
         when PERIOD = 4   and YEAR ='N' then N1.NTURNOVER_N4_C
         when PERIOD = 5   and YEAR ='N' then N1.NTURNOVER_N5_C
         when PERIOD = 6   and YEAR ='N' then N1.NTURNOVER_N6_C
         when PERIOD = 7   and YEAR ='N' then N1.NTURNOVER_N7_C
         when PERIOD = 8   and YEAR ='N' then N1.NTURNOVER_N8_C
         when PERIOD = 9   and YEAR ='N' then N1.NTURNOVER_N9_C
         when PERIOD = 10  and YEAR ='N' then N1.NTURNOVER_N10_C
         when PERIOD = 11  and YEAR ='N' then N1.NTURNOVER_N11_C
         when PERIOD = 12  and YEAR ='N' then N1.NTURNOVER_N12_C
         when PERIOD = 13  and YEAR ='N' then N1.NTURNOVER_N13_C
         else 0 end as decimal(24,8)) NTURNOVER_CURR
      ,cast(case
         when PERIOD = 1   and YEAR ='C' then N1.NTURNOVER_C1
         when PERIOD = 2   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2
         when PERIOD = 3   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3
         when PERIOD = 4   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4
         when PERIOD = 5   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5
         when PERIOD = 6   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6
         when PERIOD = 7   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7
         when PERIOD = 8   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7 + N1.NTURNOVER_C8
         when PERIOD = 9   and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7 + N1.NTURNOVER_C8 + N1.NTURNOVER_C9
         when PERIOD = 10  and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7 + N1.NTURNOVER_C8 + N1.NTURNOVER_C9 + N1.NTURNOVER_C10
         when PERIOD = 11  and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7 + N1.NTURNOVER_C8 + N1.NTURNOVER_C9 + N1.NTURNOVER_C10 + N1.NTURNOVER_C11
         when PERIOD = 12  and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7 + N1.NTURNOVER_C8 + N1.NTURNOVER_C9 + N1.NTURNOVER_C10 + N1.NTURNOVER_C11 + N1.NTURNOVER_C12
         when PERIOD = 13  and YEAR ='C' then N1.NTURNOVER_C1 + N1.NTURNOVER_C2 + N1.NTURNOVER_C3 + N1.NTURNOVER_C4 + N1.NTURNOVER_C5 + N1.NTURNOVER_C6 + N1.NTURNOVER_C7 + N1.NTURNOVER_C8 + N1.NTURNOVER_C9 + N1.NTURNOVER_C10 + N1.NTURNOVER_C11 + N1.NTURNOVER_C12 + N1.NTURNOVER_C13
         when PERIOD = 1   and YEAR ='L' then N1.NTURNOVER_L1
         when PERIOD = 2   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2
         when PERIOD = 3   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3
         when PERIOD = 4   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4
         when PERIOD = 5   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5
         when PERIOD = 6   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6
         when PERIOD = 7   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7
         when PERIOD = 8   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7 + N1.NTURNOVER_L8
         when PERIOD = 9   and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7 + N1.NTURNOVER_L8 + N1.NTURNOVER_L9
         when PERIOD = 10  and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7 + N1.NTURNOVER_L8 + N1.NTURNOVER_L9 + N1.NTURNOVER_L10
         when PERIOD = 11  and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7 + N1.NTURNOVER_L8 + N1.NTURNOVER_L9 + N1.NTURNOVER_L10 + N1.NTURNOVER_L11
         when PERIOD = 12  and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7 + N1.NTURNOVER_L8 + N1.NTURNOVER_L9 + N1.NTURNOVER_L10 + N1.NTURNOVER_L11 + N1.NTURNOVER_L12
         when PERIOD = 13  and YEAR ='L' then N1.NTURNOVER_L1 + N1.NTURNOVER_L2 + N1.NTURNOVER_L3 + N1.NTURNOVER_L4 + N1.NTURNOVER_L5 + N1.NTURNOVER_L6 + N1.NTURNOVER_L7 + N1.NTURNOVER_L8 + N1.NTURNOVER_L9 + N1.NTURNOVER_L10 + N1.NTURNOVER_L11 + N1.NTURNOVER_L12 + N1.NTURNOVER_L13
         when PERIOD = 1   and YEAR ='N' then N1.NTURNOVER_N1
         when PERIOD = 2   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2
         when PERIOD = 3   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3
         when PERIOD = 4   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4
         when PERIOD = 5   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5
         when PERIOD = 6   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6
         when PERIOD = 7   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7
         when PERIOD = 8   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7 + N1.NTURNOVER_N8
         when PERIOD = 9   and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7 + N1.NTURNOVER_N8 + N1.NTURNOVER_N9
         when PERIOD = 10  and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7 + N1.NTURNOVER_N8 + N1.NTURNOVER_N9 + N1.NTURNOVER_N10
         when PERIOD = 11  and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7 + N1.NTURNOVER_N8 + N1.NTURNOVER_N9 + N1.NTURNOVER_N10 + N1.NTURNOVER_N11
         when PERIOD = 12  and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7 + N1.NTURNOVER_N8 + N1.NTURNOVER_N9 + N1.NTURNOVER_N10 + N1.NTURNOVER_N11 + N1.NTURNOVER_N12
         when PERIOD = 13  and YEAR ='N' then N1.NTURNOVER_N1 + N1.NTURNOVER_N2 + N1.NTURNOVER_N3 + N1.NTURNOVER_N4 + N1.NTURNOVER_N5 + N1.NTURNOVER_N6 + N1.NTURNOVER_N7 + N1.NTURNOVER_N8 + N1.NTURNOVER_N9 + N1.NTURNOVER_N10 + N1.NTURNOVER_N11 + N1.NTURNOVER_N12 + N1.NTURNOVER_N13
         else 0 end as decimal(24,8)) NTURNOVER_YTD  
      ,cast(case
         when PERIOD = 1   and YEAR ='C' then N1.NTURNOVER_C1_C
         when PERIOD = 2   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C
         when PERIOD = 3   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C
         when PERIOD = 4   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C
         when PERIOD = 5   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C
         when PERIOD = 6   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C
         when PERIOD = 7   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C
         when PERIOD = 8   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C + N1.NTURNOVER_C8_C
         when PERIOD = 9   and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C + N1.NTURNOVER_C8_C + N1.NTURNOVER_C9_C
         when PERIOD = 10  and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C + N1.NTURNOVER_C8_C + N1.NTURNOVER_C9_C + N1.NTURNOVER_C10_C
         when PERIOD = 11  and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C + N1.NTURNOVER_C8_C + N1.NTURNOVER_C9_C + N1.NTURNOVER_C10_C + N1.NTURNOVER_C11_C
         when PERIOD = 12  and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C + N1.NTURNOVER_C8_C + N1.NTURNOVER_C9_C + N1.NTURNOVER_C10_C + N1.NTURNOVER_C11_C + N1.NTURNOVER_C12_C
         when PERIOD = 13  and YEAR ='C' then N1.NTURNOVER_C1_C + N1.NTURNOVER_C2_C + N1.NTURNOVER_C3_C + N1.NTURNOVER_C4_C + N1.NTURNOVER_C5_C + N1.NTURNOVER_C6_C + N1.NTURNOVER_C7_C + N1.NTURNOVER_C8_C + N1.NTURNOVER_C9_C + N1.NTURNOVER_C10_C + N1.NTURNOVER_C11_C + N1.NTURNOVER_C12_C + N1.NTURNOVER_C13_C
         when PERIOD = 1   and YEAR ='L' then N1.NTURNOVER_L1_C
         when PERIOD = 2   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C
         when PERIOD = 3   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C
         when PERIOD = 4   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C
         when PERIOD = 5   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C
         when PERIOD = 6   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C
         when PERIOD = 7   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C
         when PERIOD = 8   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C + N1.NTURNOVER_L8_C
         when PERIOD = 9   and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C + N1.NTURNOVER_L8_C + N1.NTURNOVER_L9_C
         when PERIOD = 10  and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C + N1.NTURNOVER_L8_C + N1.NTURNOVER_L9_C + N1.NTURNOVER_L10_C
         when PERIOD = 11  and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C + N1.NTURNOVER_L8_C + N1.NTURNOVER_L9_C + N1.NTURNOVER_L10_C + N1.NTURNOVER_L11_C
         when PERIOD = 12  and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C + N1.NTURNOVER_L8_C + N1.NTURNOVER_L9_C + N1.NTURNOVER_L10_C + N1.NTURNOVER_L11_C + N1.NTURNOVER_L12_C
         when PERIOD = 13  and YEAR ='L' then N1.NTURNOVER_L1_C + N1.NTURNOVER_L2_C + N1.NTURNOVER_L3_C + N1.NTURNOVER_L4_C + N1.NTURNOVER_L5_C + N1.NTURNOVER_L6_C + N1.NTURNOVER_L7_C + N1.NTURNOVER_L8_C + N1.NTURNOVER_L9_C + N1.NTURNOVER_L10_C + N1.NTURNOVER_L11_C + N1.NTURNOVER_L12_C + N1.NTURNOVER_L13_C      
         when PERIOD = 1   and YEAR ='N' then N1.NTURNOVER_N1_C
         when PERIOD = 2   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C
         when PERIOD = 3   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C
         when PERIOD = 4   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C
         when PERIOD = 5   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C
         when PERIOD = 6   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C
         when PERIOD = 7   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C
         when PERIOD = 8   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C + N1.NTURNOVER_N8_C
         when PERIOD = 9   and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C + N1.NTURNOVER_N8_C + N1.NTURNOVER_N9_C
         when PERIOD = 10  and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C + N1.NTURNOVER_N8_C + N1.NTURNOVER_N9_C + N1.NTURNOVER_N10_C
         when PERIOD = 11  and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C + N1.NTURNOVER_N8_C + N1.NTURNOVER_N9_C + N1.NTURNOVER_N10_C + N1.NTURNOVER_N11_C
         when PERIOD = 12  and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C + N1.NTURNOVER_N8_C + N1.NTURNOVER_N9_C + N1.NTURNOVER_N10_C + N1.NTURNOVER_N11_C + N1.NTURNOVER_N12_C
         when PERIOD = 13  and YEAR ='N' then N1.NTURNOVER_N1_C + N1.NTURNOVER_N2_C + N1.NTURNOVER_N3_C + N1.NTURNOVER_N4_C + N1.NTURNOVER_N5_C + N1.NTURNOVER_N6_C + N1.NTURNOVER_N7_C + N1.NTURNOVER_N8_C + N1.NTURNOVER_N9_C + N1.NTURNOVER_N10_C + N1.NTURNOVER_N11_C + N1.NTURNOVER_N12_C + N1.NTURNOVER_N13_C
         else 0 end as decimal(24,8)) NTURNOVER_YTD_CURR
      ,cast(0 as decimal(24,8)) NBUDGET_CURR
      ,cast(0 as decimal(24,8)) NBUDGET_YTD_CURR
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
         BV.B_ACCOUNT_CODE = V.NCODE
         and BV.B_YEAR = case V.YEAR when 'L' then -1 when 'C' then 0 else 1 end
         and BV.B_PERIOD = V.PERIOD