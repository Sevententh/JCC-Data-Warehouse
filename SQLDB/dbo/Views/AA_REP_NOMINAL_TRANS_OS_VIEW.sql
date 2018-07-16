create view AA_REP_NOMINAL_TRANS_OS_VIEW 

As

/*
** Written     :  27/09/2005 RV, 19/04/06 SRB
** Last Amended:  
** Comments    :  Returns outstanding journal transactions for crystal reports
*/

Select 
    
AA_REP_NOMINAL_TRANS_VIEW.*, 
N.NT_PERIOD_MAXC, 
N.NT_POST_VALUE,
0 AS NR_COUNT

         
	from NL_TRANSACTIONS N
	
	inner join AA_REP_NOMINAL_TRANS_VIEW On AA_REP_NOMINAL_TRANS_VIEW.NT_PRIMARY = N.NT_PRIMARY

        where N.NT_YEAR = 'C' and
              N.NT_RECUR_FLAG = 1 and
              N.NT_PERIOD_MAXC > 0 and
              (N.NT_POSTINGS_CNT < N.NT_MAX_POSTINGS) and
              (N.NT_POSTINGS_CNT = 0 or not exists
              	(select 1
                from NL_RECURJNL_COUNT
			Inner join SYS_DATAINFO D with(nolock) on D.SYS_PRIMARY = 1
                        where NR_YEAR = 'C' and
                              NR_PERIOD = NOMINAL_PERIOD and
                              NR_TRANSACTION_LINK = N.NT_PRIMARY))
union

Select 

AA_REP_NOMINAL_TRANS_VIEW.*, 
N.NT_PERIOD_MAXC, 
N.NT_POST_VALUE,
NL_RECURJNL_COUNT.NR_COUNT

         from NL_TRANSACTIONS N
		
	 inner join AA_REP_NOMINAL_TRANS_VIEW On AA_REP_NOMINAL_TRANS_VIEW.NT_PRIMARY = N.NT_PRIMARY
              inner join SYS_DATAINFO D with(nolock) on D.SYS_PRIMARY = 1
	 inner join NL_RECURJNL_COUNT On NR_TRANSACTION_LINK = N.NT_PRIMARY 
          
         where N.NT_YEAR = 'C' and
               N.NT_RECUR_FLAG = 1 and
               NR_YEAR = 'C' and
               (N.NT_POSTINGS_CNT < N.NT_MAX_POSTINGS) and
               NR_COUNT < N.NT_PERIOD_MAXC and
               NR_PERIOD = NOMINAL_PERIOD and
               N.NT_PERIOD_MAXC > 0




