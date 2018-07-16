create view AA_NL_TRANSACTION_EDIT_VIEW
/*
** Written: 24/05/05 SR
** Last Amended: 01/06/05 SR, 25/10/05 JC, 16/11/05 JC
*/
as

select
 DET_PRIMARY as [PRIMARY],                                                                                      
 DET_ACCOUNT,
 substring(DET_HEADER_KEY,1,1) as NTYPE,
 coalesce(case substring(DET_HEADER_KEY,1,1) when 'S' then isnull(SL_ACCOUNTS.CUNAME,'')
                                             when 'P' then isnull(PL_ACCOUNTS.SUNAME,'') end,'') as ACCOUNT_NAME,
 DET_HEADER_REF,
 cast(DET_PRIMARY as int) as DET_PRIMARY,
 DET_USER_PUTIN,
 DET_DATE_PUTIN,
 DET_SUB_LEDGER,
 DET_BATCH_REF,
 dbo.AA_VALUE_DPS_F(DET_NETT) as HOME_VALUE,
 dbo.AA_VALUE_DPS_F(DET_CURR_NETT) as CURRENCY_VALUE,
 dbo.AA_VALUE_DPS_F(DET_NETT_BASE2) as BASE2_VALUE,
 DET_CURR_CODE,
 DET_JNL_LINEREF,
 DET_DIMENSION1,
 DET_DIMENSION2,
 DET_DIMENSION3,
 DET_ARCHIVE_FLG as DET_ARCHIVE_FLAG,
 DET_USRCHAR1,
 DET_USRCHAR2,
 DET_USRCHAR3,
 DET_USRCHAR4,
 DET_USRFLAG1,
 DET_USRFLAG2,
 DET_USRDATE1,
 DET_USRDATE2,
 DET_USRNUM1,
 DET_USRNUM2,
 DET_DESCRIPTION
                                        
from SL_PL_NL_DETAIL
 left outer join SL_PL_NL_DETAIL2 on DET_PRIMARY_2 = DET_PRIMARY
 left outer join SL_ACCOUNTS on CUCODE = DET_ACCOUNT
 left outer join PL_ACCOUNTS on SUCODE = DET_ACCOUNT