﻿CREATE VIEW dbo.AA_ED_PL_ANA_RECS_VIEW
AS
select PACODE,PANAME,PATYPE_P_B_D,PASORT,PAUSER1,PAUSER2,PAUSER3,
CAST(
CASE PURCHASE_PERIOD
	WHEN 1 THEN PATURNOVR_C1
	WHEN 2 THEN PATURNOVR_C2
	WHEN 3 THEN PATURNOVR_C3
	WHEN 4 THEN PATURNOVR_C4
	WHEN 5 THEN PATURNOVR_C5
	WHEN 6 THEN PATURNOVR_C6
	WHEN 7 THEN PATURNOVR_C7
	WHEN 8 THEN PATURNOVR_C8
	WHEN 9 THEN PATURNOVR_C9
	WHEN 10 THEN PATURNOVR_C10
	WHEN 11 THEN PATURNOVR_C11
	WHEN 12 THEN PATURNOVR_C12
	WHEN 13 THEN PATURNOVR_C13
END as float) AS PTD_CURRENT_YEAR,
CAST(CASE PURCHASE_PERIOD
	WHEN 1 THEN PATURNOVR_L1
	WHEN 2 THEN PATURNOVR_L2
	WHEN 3 THEN PATURNOVR_L3
	WHEN 4 THEN PATURNOVR_L4
	WHEN 5 THEN PATURNOVR_L5
	WHEN 6 THEN PATURNOVR_L6
	WHEN 7 THEN PATURNOVR_L7
	WHEN 8 THEN PATURNOVR_L8
	WHEN 9 THEN PATURNOVR_L9
	WHEN 10 THEN PATURNOVR_L10
	WHEN 11 THEN PATURNOVR_L11
	WHEN 12 THEN PATURNOVR_L12
	WHEN 13 THEN PATURNOVR_L13
END AS FLOAT) AS PTD_LAST_YEAR,
CAST(CASE PURCHASE_PERIOD
	WHEN 1 THEN PATURNOVR_O1
	WHEN 2 THEN PATURNOVR_O2
	WHEN 3 THEN PATURNOVR_O3
	WHEN 4 THEN PATURNOVR_O4
	WHEN 5 THEN PATURNOVR_O5
	WHEN 6 THEN PATURNOVR_O6
	WHEN 7 THEN PATURNOVR_O7
	WHEN 8 THEN PATURNOVR_O8
	WHEN 9 THEN PATURNOVR_O9
	WHEN 10 THEN PATURNOVR_O10
	WHEN 11 THEN PATURNOVR_O11
	WHEN 12 THEN PATURNOVR_O12
	WHEN 13 THEN PATURNOVR_O13
END AS FLOAT) AS PTD_PREV_YEAR,
CAST(CASE PURCHASE_PERIOD
	WHEN 1 THEN PATURNOVR_C1
	WHEN 2 THEN PATURNOVR_C1+PATURNOVR_C2
	WHEN 3 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3
	WHEN 4 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4
	WHEN 5 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5
	WHEN 6 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6
	WHEN 7 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7
	WHEN 8 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7+PATURNOVR_C8
	WHEN 9 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7+PATURNOVR_C8+PATURNOVR_C9
	WHEN 10 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7+PATURNOVR_C8+PATURNOVR_C9+PATURNOVR_C10
	WHEN 11 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7+PATURNOVR_C8+PATURNOVR_C9+PATURNOVR_C10+PATURNOVR_C11
	WHEN 12 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7+PATURNOVR_C8+PATURNOVR_C9+PATURNOVR_C10+PATURNOVR_C11+PATURNOVR_C12
	WHEN 13 THEN PATURNOVR_C1+PATURNOVR_C2+PATURNOVR_C3+PATURNOVR_C4+PATURNOVR_C5+PATURNOVR_C6+PATURNOVR_C7+PATURNOVR_C8+PATURNOVR_C9+PATURNOVR_C10+PATURNOVR_C11+PATURNOVR_C12+PATURNOVR_C13
END AS FLOAT) AS YTD_CURRENT_YEAR,
CAST(CASE PURCHASE_PERIOD
	WHEN 1 THEN PATURNOVR_L1
	WHEN 2 THEN PATURNOVR_L1+PATURNOVR_L2
	WHEN 3 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3
	WHEN 4 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4
	WHEN 5 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5
	WHEN 6 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6
	WHEN 7 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7
	WHEN 8 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7+PATURNOVR_L8
	WHEN 9 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7+PATURNOVR_L8+PATURNOVR_L9
	WHEN 10 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7+PATURNOVR_L8+PATURNOVR_L9+PATURNOVR_L10
	WHEN 11 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7+PATURNOVR_L8+PATURNOVR_L9+PATURNOVR_L10+PATURNOVR_L11
	WHEN 12 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7+PATURNOVR_L8+PATURNOVR_L9+PATURNOVR_L10+PATURNOVR_L11+PATURNOVR_L12
	WHEN 13 THEN PATURNOVR_L1+PATURNOVR_L2+PATURNOVR_L3+PATURNOVR_L4+PATURNOVR_L5+PATURNOVR_L6+PATURNOVR_L7+PATURNOVR_L8+PATURNOVR_L9+PATURNOVR_L10+PATURNOVR_L11+PATURNOVR_L12+PATURNOVR_L13
END AS FLOAT) AS YTD_LAST_YEAR,
CAST(CASE PURCHASE_PERIOD
	WHEN 1 THEN PATURNOVR_O1
	WHEN 2 THEN PATURNOVR_O1+PATURNOVR_O2
	WHEN 3 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3
	WHEN 4 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4
	WHEN 5 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5
	WHEN 6 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6
	WHEN 7 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7
	WHEN 8 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7+PATURNOVR_O8
	WHEN 9 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7+PATURNOVR_O8+PATURNOVR_O9
	WHEN 10 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7+PATURNOVR_O8+PATURNOVR_O9+PATURNOVR_O10
	WHEN 11 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7+PATURNOVR_O8+PATURNOVR_O9+PATURNOVR_O10+PATURNOVR_O11
	WHEN 12 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7+PATURNOVR_O8+PATURNOVR_O9+PATURNOVR_O10+PATURNOVR_O11+PATURNOVR_O12
	WHEN 13 THEN PATURNOVR_O1+PATURNOVR_O2+PATURNOVR_O3+PATURNOVR_O4+PATURNOVR_O5+PATURNOVR_O6+PATURNOVR_O7+PATURNOVR_O8+PATURNOVR_O9+PATURNOVR_O10+PATURNOVR_O11+PATURNOVR_O12+PATURNOVR_O13
END AS FLOAT) AS YTD_PREV_YEAR
FROM PL_ANALYSIS join SYS_DATAINFO on sys_primary = 1