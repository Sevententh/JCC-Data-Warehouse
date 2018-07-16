 
CREATE VIEW [dbo].[dhc_vw_JCC_StockClassifications]
AS

	select STKCODE,
		max(case when JSCD_DATEINDEX=12 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q12ClassMonth,
		max(case when JSCD_DATEINDEX=11 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q11ClassMonth,
		max(case when JSCD_DATEINDEX=10 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q10ClassMonth,
		max(case when JSCD_DATEINDEX=9 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q9ClassMonth,
		max(case when JSCD_DATEINDEX=8 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q8ClassMonth,
		max(case when JSCD_DATEINDEX=7 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q7ClassMonth,
		max(case when JSCD_DATEINDEX=6 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q6ClassMonth,
		max(case when JSCD_DATEINDEX=5 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q5ClassMonth,
		max(case when JSCD_DATEINDEX=4 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q4ClassMonth,
		max(case when JSCD_DATEINDEX=3 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q3ClassMonth,
		max(case when JSCD_DATEINDEX=2 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q2ClassMonth,
		max(case when JSCD_DATEINDEX=1 and JSCD_TYPE='Q' then JSCH_CLASSIFICATION else null end) as Q1ClassMonth,
		
		max(case when JSCD_DATEINDEX=12 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q12RunAt,
		max(case when JSCD_DATEINDEX=11 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q11RunAt,
		max(case when JSCD_DATEINDEX=10 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q10RunAt,
		max(case when JSCD_DATEINDEX=9 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q9RunAt,
		max(case when JSCD_DATEINDEX=8 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q8RunAt,
		max(case when JSCD_DATEINDEX=7 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q7RunAt,
		max(case when JSCD_DATEINDEX=6 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q6RunAt,
		max(case when JSCD_DATEINDEX=5 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q5RunAt,
		max(case when JSCD_DATEINDEX=4 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q4RunAt,
		max(case when JSCD_DATEINDEX=3 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q3RunAt,
		max(case when JSCD_DATEINDEX=2 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q2RunAt,
		max(case when JSCD_DATEINDEX=1 and JSCD_TYPE='Q' then JSCD_DATE else null end) as Q1RunAt,

		max(case when JSCD_DATEINDEX=12 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V12ClassMonth,
		max(case when JSCD_DATEINDEX=11 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V11ClassMonth,
		max(case when JSCD_DATEINDEX=10 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V10ClassMonth,
		max(case when JSCD_DATEINDEX=9 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V9ClassMonth,
		max(case when JSCD_DATEINDEX=8 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V8ClassMonth,
		max(case when JSCD_DATEINDEX=7 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V7ClassMonth,
		max(case when JSCD_DATEINDEX=6 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V6ClassMonth,
		max(case when JSCD_DATEINDEX=5 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V5ClassMonth,
		max(case when JSCD_DATEINDEX=4 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V4ClassMonth,
		max(case when JSCD_DATEINDEX=3 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V3ClassMonth,
		max(case when JSCD_DATEINDEX=2 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V2ClassMonth,
		max(case when JSCD_DATEINDEX=1 and JSCD_TYPE='V' then JSCH_CLASSIFICATION else null end) as V1ClassMonth,
		
		max(case when JSCD_DATEINDEX=12 and JSCD_TYPE='V' then JSCD_DATE else null end) as V12RunAt,
		max(case when JSCD_DATEINDEX=11 and JSCD_TYPE='V' then JSCD_DATE else null end) as V11RunAt,
		max(case when JSCD_DATEINDEX=10 and JSCD_TYPE='V' then JSCD_DATE else null end) as V10RunAt,
		max(case when JSCD_DATEINDEX=9 and JSCD_TYPE='V' then JSCD_DATE else null end) as V9RunAt,
		max(case when JSCD_DATEINDEX=8 and JSCD_TYPE='V' then JSCD_DATE else null end) as V8RunAt,
		max(case when JSCD_DATEINDEX=7 and JSCD_TYPE='V' then JSCD_DATE else null end) as V7RunAt,
		max(case when JSCD_DATEINDEX=6 and JSCD_TYPE='V' then JSCD_DATE else null end) as V6RunAt,
		max(case when JSCD_DATEINDEX=5 and JSCD_TYPE='V' then JSCD_DATE else null end) as V5RunAt,
		max(case when JSCD_DATEINDEX=4 and JSCD_TYPE='V' then JSCD_DATE else null end) as V4RunAt,
		max(case when JSCD_DATEINDEX=3 and JSCD_TYPE='V' then JSCD_DATE else null end) as V3RunAt,
		max(case when JSCD_DATEINDEX=2 and JSCD_TYPE='V' then JSCD_DATE else null end) as V2RunAt,
		max(case when JSCD_DATEINDEX=1 and JSCD_TYPE='V' then JSCD_DATE else null end) as V1RunAt

--		(case when month(max(JSCH_DATE))
--		JSCH_CLASSIFICATION varchar(2) not null,
--		JSCH_DATE datetime not null,
--		--JSCH_MONTH_INDEX int not null,
--		JSCH_TYPE varchar(1) not null --Q=Qty, V=Value

	from STK_STOCK
		left outer join dhc_tbl_JCC_StockClassHistory on JSCH_STOCKCODE=STKCODE
		left outer join dhc_tbl_JCC_StockClassHistoryDates on JSCD_PRIMARY=JSCH_DATEINDEX_LINK
		
	where JSCD_DATEINDEX<=12

	group by STKCODE

