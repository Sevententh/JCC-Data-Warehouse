CREATE VIEW AA_NL_RECORD_PERIOD_INFO_VIEW
/*
** Written:        10/02/03 NC
** Last Amended:   19/05/2005 WW, 7/11/2007 WW
*/
(Code, Nominal_Primary, Trading_Currency_Code, Type, MajorHeading, Year, Period, Period_Sort
, Period_Turnover, Period_Budget, Period_Original_Budget, Period_Currency_Turnover)
as
select 
  N1.NCODE
, N1.N_PRIMARY
, N1.NCURRENCYCODE
, N1.NTYPE
, N1.NMAJORHEADCODE
, Year
, Period
, Period + (13*(charindex(Year,'LCN')-1))
, convert(decimal(24,2), case Period + (13*(charindex(Year,'LCN')))
    when 14 then NTURNOVER_L1  when 15 then NTURNOVER_L2  when 16 then NTURNOVER_L3
    when 16 then NTURNOVER_L3  when 17 then NTURNOVER_L4  when 18 then NTURNOVER_L5
    when 19 then NTURNOVER_L6  when 20 then NTURNOVER_L7  when 21 then NTURNOVER_L8
    when 22 then NTURNOVER_L9  when 23 then NTURNOVER_L10 when 24 then NTURNOVER_L11
    when 25 then NTURNOVER_L12 when 26 then NTURNOVER_L13 when 27 then NTURNOVER_C1
    when 28 then NTURNOVER_C2  when 29 then NTURNOVER_C3  when 30 then NTURNOVER_C4
    when 31 then NTURNOVER_C5  when 32 then NTURNOVER_C6  when 33 then NTURNOVER_C7
    when 34 then NTURNOVER_C8  when 35 then NTURNOVER_C9  when 36 then NTURNOVER_C10
    when 37 then NTURNOVER_C11 when 38 then NTURNOVER_C12 when 39 then NTURNOVER_C13
    when 40 then NTURNOVER_N1  when 41 then NTURNOVER_N2  when 42 then NTURNOVER_N3
    when 43 then NTURNOVER_N4  when 44 then NTURNOVER_N5  when 45 then NTURNOVER_N6
    when 46 then NTURNOVER_N7  when 47 then NTURNOVER_N8  when 48 then NTURNOVER_N9
    when 49 then NTURNOVER_N10 when 50 then NTURNOVER_N11 when 51 then NTURNOVER_N12
    when 52 then NTURNOVER_N13 else 0 end)
,  convert(decimal(24,2), case Period + (13*(charindex(Year,'LCN')))
    when 14 then NBUDGET_L1  when 15 then NBUDGET_L2  when 16 then NBUDGET_L3
    when 16 then NBUDGET_L3  when 17 then NBUDGET_L4  when 18 then NBUDGET_L5
    when 19 then NBUDGET_L6  when 20 then NBUDGET_L7  when 21 then NBUDGET_L8
    when 22 then NBUDGET_L9  when 23 then NBUDGET_L10 when 24 then NBUDGET_L11
    when 25 then NBUDGET_L12 when 26 then NBUDGET_L13 when 27 then NBUDGET_C1
    when 28 then NBUDGET_C2  when 29 then NBUDGET_C3  when 30 then NBUDGET_C4
    when 31 then NBUDGET_C5  when 32 then NBUDGET_C6  when 33 then NBUDGET_C7
    when 34 then NBUDGET_C8  when 35 then NBUDGET_C9  when 36 then NBUDGET_C10
    when 37 then NBUDGET_C11 when 38 then NBUDGET_C12 when 39 then NBUDGET_C13
    when 40 then NBUDGET_N1  when 41 then NBUDGET_N2  when 42 then NBUDGET_N3
    when 43 then NBUDGET_N4  when 44 then NBUDGET_N5  when 45 then NBUDGET_N6
    when 46 then NBUDGET_N7  when 47 then NBUDGET_N8  when 48 then NBUDGET_N9
    when 49 then NBUDGET_N10 when 50 then NBUDGET_N11 when 51 then NBUDGET_N12
    when 52 then NBUDGET_N13 else 0 end)
,  convert(decimal(24,2), case Period + (13*(charindex(Year,'LCN')))
    when 14 then NBUDGET_L1_O  when 15 then NBUDGET_L2_O  when 16 then NBUDGET_L3_O
    when 16 then NBUDGET_L3_O  when 17 then NBUDGET_L4_O  when 18 then NBUDGET_L5_O
    when 19 then NBUDGET_L6_O  when 20 then NBUDGET_L7_O  when 21 then NBUDGET_L8_O
    when 22 then NBUDGET_L9_O  when 23 then NBUDGET_L10_O when 24 then NBUDGET_L11_O
    when 25 then NBUDGET_L12_O when 26 then NBUDGET_L13_O when 27 then NBUDGET_C1_O
    when 28 then NBUDGET_C2_O  when 29 then NBUDGET_C3_O  when 30 then NBUDGET_C4_O
    when 31 then NBUDGET_C5_O  when 32 then NBUDGET_C6_O  when 33 then NBUDGET_C7_O
    when 34 then NBUDGET_C8_O  when 35 then NBUDGET_C9_O  when 36 then NBUDGET_C10_O
    when 37 then NBUDGET_C11_O when 38 then NBUDGET_C12_O when 39 then NBUDGET_C13_O
    when 40 then NBUDGET_N1_O  when 41 then NBUDGET_N2_O  when 42 then NBUDGET_N3_O
    when 43 then NBUDGET_N4_O  when 44 then NBUDGET_N5_O  when 45 then NBUDGET_N6_O
    when 46 then NBUDGET_N7_O  when 47 then NBUDGET_N8_O  when 48 then NBUDGET_N9_O
    when 49 then NBUDGET_N10_O when 50 then NBUDGET_N11_O when 51 then NBUDGET_N12_O
    when 52 then NBUDGET_N13_O else 0 end)
, convert(decimal(24,2), case Period + (13*(charindex(Year,'LCN')))
    when 14 then NTURNOVER_L1_C  when 15 then NTURNOVER_L2_C  when 16 then NTURNOVER_L3_C
    when 16 then NTURNOVER_L3_C  when 17 then NTURNOVER_L4_C  when 18 then NTURNOVER_L5_C
    when 19 then NTURNOVER_L6_C  when 20 then NTURNOVER_L7_C  when 21 then NTURNOVER_L8_C
    when 22 then NTURNOVER_L9_C  when 23 then NTURNOVER_L10_C when 24 then NTURNOVER_L11_C
    when 25 then NTURNOVER_L12_C when 26 then NTURNOVER_L13_C when 27 then NTURNOVER_C1_C
    when 28 then NTURNOVER_C2_C  when 29 then NTURNOVER_C3_C  when 30 then NTURNOVER_C4_C
    when 31 then NTURNOVER_C5_C  when 32 then NTURNOVER_C6_C  when 33 then NTURNOVER_C7_C
    when 34 then NTURNOVER_C8_C  when 35 then NTURNOVER_C9_C  when 36 then NTURNOVER_C10_C
    when 37 then NTURNOVER_C11_C when 38 then NTURNOVER_C12_C when 39 then NTURNOVER_C13_C
    when 40 then NTURNOVER_N1_C  when 41 then NTURNOVER_N2_C  when 42 then NTURNOVER_N3_C
    when 43 then NTURNOVER_N4_C  when 44 then NTURNOVER_N5_C  when 45 then NTURNOVER_N6_C
    when 46 then NTURNOVER_N7_C  when 47 then NTURNOVER_N8_C  when 48 then NTURNOVER_N9_C
    when 49 then NTURNOVER_N10_C when 50 then NTURNOVER_N11_C when 51 then NTURNOVER_N12_C
    when 52 then NTURNOVER_N13_C else 0 end)

from NL_ACCOUNTS N1
   , (select 1 as Period union select 2 as Period union select 3 as Period
   union select 4 as Period union select 5 as Period
   union select 6 as Period union select 7 as Period union select 8 as Period
   union select 9 as Period union select 10 as Period
   union select 11 as Period union select 12 as Period union select 13 as Period
   ) PERIODS
   , (select 'L' as Year union select 'C' as Year union select 'N' as Year) Years
   