create view AA_NL_RECJNL_BATCH_HEADER_SIMPLE_VIEW
/*
** Written:      
** Last Amended: 16/05/2005 SR; 06/07/05 SRB, 30/08/2005 SH, 01/11/06 NC
*/
as

select 
 
NT_PRIMARY as [PRIMARY]
,isnull(NT_HEADER_REF,'') as NT_HEADER_REF
,NT_DATE
,NT_YEAR
,NT_PERIODNUMBER
,dbo.AA_VALUE_DPS_F(NT_POST_VALUE) as NT_POST_VALUE
,isnull(NT_GROSS_CONTRA,'') as NT_GROSS_CONTRA
,isnull(NT_DESCRIPTION,'') as NT_DESCRIPTION
,NT_CURRENCYCODE
,dbo.AA_VALUE_DPS_F(NT_CURR_VALUE) as NT_CURR_VALUE
,NT_TRANTYPE
,NT_CURRENCYRATE
,isnull(NT_BATCH_REF,'') as NT_BATCH_REF
,cast(NT_POSTINGS_CNT as nvarchar) + '/' + cast(NT_MAX_POSTINGS as nvarchar) as POSTED_SO_FAR
,NT_FIRST_DATE
,NT_POSTED_DATE
,cast(substring(NT_POSTINGS_FRQ,2,len(NT_POSTINGS_FRQ)-1) as nvarchar) 
 + case substring(upper(NT_POSTINGS_FRQ),1,1) when 'W' then ' Week(s)'
                                              when 'M' then ' Month(s)' end as POSTING_EVERY
,NT_NEXT_DATE
,cast(NT_PRIMARY as int) as NT_PRIMARY
,NT_USER_PUTIN
,NT_POSTINGS_CNT
,NT_MAX_POSTINGS
,case (select top 1 isnull(d.DET_NOMINALDR,'') from SL_PL_NL_DETAIL d with (nolock) where d.DET_HEADER_KEY = n.NT_HEADER_KEY order by d.DET_PRIMARY) 
            when ''  then 
                        case NT_TRANTYPE 
                                    when 'VJL' then
                                                4
                                    else
                                                3
                        end                              
            else
                        case NT_TRANTYPE 
                                    when 'VJL' then
                                                5
                                    else
                                                3
                        end                             
end as TRANSACTION_TYPE
,NT_REVERSE_FLAG
 
from NL_TRANSACTIONS n
 
where NT_RECUR_FLAG = 1
 
and (NT_POSTINGS_CNT + 1) < (NT_MAX_POSTINGS + 1) 
