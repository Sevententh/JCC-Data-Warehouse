create view AA_NL_JNL_BATCH_HEADER_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_NL_JNL_BATCH_ENQUIRY_S
** Written:      
** Last Amended: 06/07/05, 1/11/06 NC
**
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
,cast(NT_PRIMARY as int) as NT_PRIMARY
,NT_USER_PUTIN

,case (select top 1 isnull(d.DET_NOMINALDR,'') from SL_PL_NL_DETAIL d with (nolock) where d.DET_HEADER_KEY = n.NT_HEADER_KEY order by d.DET_PRIMARY)
   when ''  then 
      case NT_TRANTYPE 
         when 'VJL' then
            1
         else
            0
      end         
   else
      case NT_TRANTYPE 
         when 'VJL' then
            2
         else
            0
      end         
end as TRANSACTION_TYPE

from NL_TRANSACTIONS n
where NT_BATCH_FLAG = 1 and NT_RECUR_FLAG <> 1 
