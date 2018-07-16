CREATE VIEW AA_REP_NOMINAL_BUDGETS_VIEW
AS
/*
** Written:     02/06/2005 RV/NC   
** Last Amended: 20/09/05 RV 
** Comments: returns nominal budgets records for crystal reports
*/
Select L.Nominal as Nominal
, L.revision as Revision

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

, isnull(sum(case when Year=1 and Period=1 then B.B_VALUE end),0) as BUD_N1
, isnull(sum(case when Year=1 and Period=2 then B.B_VALUE end),0) as BUD_N2
, isnull(sum(case when Year=1 and Period=3 then B.B_VALUE end),0) as BUD_N3
, isnull(sum(case when Year=1 and Period=4 then B.B_VALUE end),0) as BUD_N4
, isnull(sum(case when Year=1 and Period=5 then B.B_VALUE end),0) as BUD_N5
, isnull(sum(case when Year=1 and Period=6 then B.B_VALUE end),0) as BUD_N6
, isnull(sum(case when Year=1 and Period=7 then B.B_VALUE end),0) as BUD_N7
, isnull(sum(case when Year=1 and Period=8 then B.B_VALUE end),0) as BUD_N8
, isnull(sum(case when Year=1 and Period=9 then B.B_VALUE end),0) as BUD_N9
, isnull(sum(case when Year=1 and Period=10 then B.B_VALUE end),0) as BUD_N10
, isnull(sum(case when Year=1 and Period=11 then B.B_VALUE end),0) as BUD_N11
, isnull(sum(case when Year=1 and Period=12 then B.B_VALUE end),0) as BUD_N12
, isnull(sum(case when Year=1 and Period=13 then B.B_VALUE end),0) as BUD_N13

from
(select isnull(R.B_REVISION_NUMBER,0) revision
   ,N.NCODE Nominal
   ,P.P_PERIOD Period
   ,Y.Y_YEAR Year
   ,max(M.B_REVISION_NUMBER) ActualRevision
   from ( select 1 as P_PERIOD union select 2 union select 3 union select 4 union select 5 union select 6 union select 7
					    union select 8 union select 9 union select 10 union select 11 union select 12 union select 13 ) P
   	cross join ( select 1 as Y_YEAR union select -1 union select 0 ) Y
      join NL_ACCOUNTS N on N.NCODE<>''
      left outer join SYS_BUDGETS R on R.B_ACCOUNT_CODE = N.NCODE and R.B_RECORD_TYPE = 'N' and R.B_BUDGET_TYPE  = 'B' and R.B_YEAR = Y.Y_YEAR and R.B_PERIOD = P.P_PERIOD
      left outer join SYS_BUDGETS M on M.B_ACCOUNT_CODE = N.NCODE and M.B_RECORD_TYPE = 'N' and M.B_BUDGET_TYPE  = 'B' and M.B_YEAR = Y.Y_YEAR and M.B_PERIOD = P.P_PERIOD
                                       and M.B_REVISION_NUMBER<=isnull(R.B_REVISION_NUMBER,0)
   group by N.NCODE,Y.Y_YEAR,P.P_PERIOD,isnull(R.B_REVISION_NUMBER,0)) L
left outer join SYS_BUDGETS B on B.B_ACCOUNT_CODE = Nominal and B.B_RECORD_TYPE = 'N' and B.B_BUDGET_TYPE  = 'B'
                                       and B.B_YEAR = Year and B.B_PERIOD = Period
                                       and B.B_REVISION_NUMBER=L.ActualRevision
group by L.Nominal, L.revision





