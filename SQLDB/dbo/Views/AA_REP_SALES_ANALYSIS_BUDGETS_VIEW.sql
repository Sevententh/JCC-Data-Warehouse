Create View AA_REP_SALES_ANALYSIS_BUDGETS_VIEW 
as
/*
** Written:     29/03/2005 RV/NC, 19/04/2006 SRB
** Last Amended:
** Comments: returns sales analysis budgets records for crystal reports
*/
Select L.Analysis as Analysis
, L.revision as Revision
, isnull(sum(case when Year=-2 and Period=1 then B.B_VALUE end),0) as BUD_O1
, isnull(sum(case when Year=-2 and Period=2 then B.B_VALUE end),0) as BUD_O2
, isnull(sum(case when Year=-2 and Period=3 then B.B_VALUE end),0) as BUD_O3
, isnull(sum(case when Year=-2 and Period=4 then B.B_VALUE end),0) as BUD_O4
, isnull(sum(case when Year=-2 and Period=5 then B.B_VALUE end),0) as BUD_O5
, isnull(sum(case when Year=-2 and Period=6 then B.B_VALUE end),0) as BUD_O6
, isnull(sum(case when Year=-2 and Period=7 then B.B_VALUE end),0) as BUD_O7
, isnull(sum(case when Year=-2 and Period=8 then B.B_VALUE end),0) as BUD_O8
, isnull(sum(case when Year=-2 and Period=9 then B.B_VALUE end),0) as BUD_O9
, isnull(sum(case when Year=-2 and Period=10 then B.B_VALUE end),0) as BUD_O10
, isnull(sum(case when Year=-2 and Period=11 then B.B_VALUE end),0) as BUD_O11
, isnull(sum(case when Year=-2 and Period=12 then B.B_VALUE end),0) as BUD_O12
, isnull(sum(case when Year=-2 and Period=13 then B.B_VALUE end),0) as BUD_O13

, isnull(sum(case when Year=-1 and Period=1 then B.B_VALUE end),0) as BUD_L1
, isnull(sum(case when Year=-1 and Period=2 then B.B_VALUE end),0) as BUD_L2
, isnull(sum(case when Year=-1 and Period=3 then B.B_VALUE end),0) as BUD_L3
, isnull(sum(case when Year=-1 and Period=4 then B.B_VALUE end),0) as BUD_L4
, isnull(sum(case when Year=-1 and Period=5 then B.B_VALUE end),0) as BUD_L5
, isnull(sum(case when Year=-1 and Period=6 then B.B_VALUE end),0) as BUD_L6
, isnull(sum(case when Year=-1 and Period=7 then B.B_VALUE end),0) as BUD_L7
, isnull(sum(case when Year=-1 and Period=8 then B.B_VALUE end),0) as BUD_L8
, isnull(sum(case when Year=-1 and Period=9 then B.B_VALUE end),0) as BUD_L9
, isnull(sum(case when Year=-1 and Period=10 then B.B_VALUE end),0) as BUD_L10
, isnull(sum(case when Year=-1 and Period=11 then B.B_VALUE end),0) as BUD_L11
, isnull(sum(case when Year=-1 and Period=12 then B.B_VALUE end),0) as BUD_L12
, isnull(sum(case when Year=-1 and Period=13 then B.B_VALUE end),0) as BUD_L13

, isnull(sum(case when Year=0 and Period=1 then B.B_VALUE end),0) as BUD_C1
, isnull(sum(case when Year=0 and Period=2 then B.B_VALUE end),0) as BUD_C2
, isnull(sum(case when Year=0 and Period=3 then B.B_VALUE end),0) as BUD_C3
, isnull(sum(case when Year=0 and Period=4 then B.B_VALUE end),0) as BUD_C4
, isnull(sum(case when Year=0 and Period=5 then B.B_VALUE end),0) as BUD_C5
, isnull(sum(case when Year=0 and Period=6 then B.B_VALUE end),0) as BUD_C6
, isnull(sum(case when Year=0 and Period=7 then B.B_VALUE end),0) as BUD_C7
, isnull(sum(case when Year=0 and Period=8 then B.B_VALUE end),0) as BUD_C8
, isnull(sum(case when Year=0 and Period=9 then B.B_VALUE end),0) as BUD_C9
, isnull(sum(case when Year=0 and Period=10 then B.B_VALUE end),0) as BUD_C10
, isnull(sum(case when Year=0 and Period=11 then B.B_VALUE end),0) as BUD_C11
, isnull(sum(case when Year=0 and Period=12 then B.B_VALUE end),0) as BUD_C12
, isnull(sum(case when Year=0 and Period=13 then B.B_VALUE end),0) as BUD_C13

from
(select isnull(R.B_REVISION_NUMBER,0) revision
   ,S.SACODE Analysis
   ,P.P_PERIOD Period
   ,Y.Y_YEAR Year
   ,max(M.B_REVISION_NUMBER) ActualRevision
   from ( select 1 as P_PERIOD union select 2 union select 3 union select 4 union select 5 union select 6 union select 7
					    union select 8 union select 9 union select 10 union select 11 union select 12 union select 13 ) P
   	cross join ( select -2 as Y_YEAR union select -1 union select 0 ) Y
      join SL_ANALYSIS S on S.SACODE <> ''
      left outer join SYS_BUDGETS R on R.B_ACCOUNT_CODE = S.SACODE and R.B_RECORD_TYPE = 'SA' and R.B_BUDGET_TYPE  = 'B'
      left outer join SYS_BUDGETS M on M.B_ACCOUNT_CODE = S.SACODE and M.B_RECORD_TYPE = 'SA' and M.B_BUDGET_TYPE  = 'B'
                                       and M.B_YEAR = Y.Y_YEAR and M.B_PERIOD = P.P_PERIOD
                                       and M.B_REVISION_NUMBER<=isnull(R.B_REVISION_NUMBER,0)
   group by S.SACODE,Y.Y_YEAR,P.P_PERIOD,isnull(R.B_REVISION_NUMBER,0)) L
left outer join SYS_BUDGETS B on B.B_ACCOUNT_CODE = Analysis and B.B_RECORD_TYPE = 'SA' and B.B_BUDGET_TYPE  = 'B'
                                       and B.B_YEAR = Year and B.B_PERIOD = Period
                                       and B.B_REVISION_NUMBER=L.ActualRevision
group by L.Analysis, L.revision


