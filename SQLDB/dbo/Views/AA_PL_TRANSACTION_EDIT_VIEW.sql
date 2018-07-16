create view AA_PL_TRANSACTION_EDIT_VIEW
/*
** Written     :  29/04/2005 SR
** Last Amended:  25/07/2005 DB
*/
as

select
   PT_PRIMARY as [PRIMARY]
,  (
      case PT_TRANTYPE
         when 'INV' then 0
         when 'CRN' then 1
         when 'PAY' then 2
         when 'ADR' then 3
         when 'ACR' then 4
      end
   )                                as PT_TRANTYPE
,  PT_COPYSUPP
,  isnull(SUNAME,'')                as SUNAME
,  isnull(PT_HEADER_REF,'')         as PT_HEADER_REF
,  cast(PT_PRIMARY as int)          as PT_AUDIT_NO
,  PT_USER_PUTIN
,  PT_DATE_PUTIN
,  isnull(PT_SUB_LEDGER,'')         as PT_SUB_LEDGER
,  isnull(PT_ALLOC_XREF,'')         as PT_ALLOC_XREF
,  isnull(PT_BATCH_REF,'')          as PT_BATCH_REF
,  isnull(PT_DESCRIPTION,'')        as PT_DESCRIPTION
,  PT_DUEDATE
,  PT_ANTICPAYDATE
,  isnull(PT_USER1,'')              as PT_USER1
,  isnull(PT_USER2,'')              as PT_USER2
,  isnull(PT_USER3,'')              as PT_USER3
,  PT_ARCHIVE_FLAG
,  PT_QUERY_FLAG
,  isnull(PT_USRCHAR1,'')           as PT_USRCHAR1
,  isnull(PT_USRCHAR2,'')           as PT_USRCHAR2
,  isnull(PT_USRCHAR3,'')           as PT_USRCHAR3
,  isnull(PT_USRCHAR4,'')           as PT_USRCHAR4
,  PT_USRFLAG1
,  PT_USRFLAG2
,  PT_USRDATE1
,  PT_USRDATE2
,  dbo.AA_VALUE_DPS_F(PT_USRNUM1)   as PT_USRNUM1
,  dbo.AA_VALUE_DPS_F(PT_USRNUM2)   as PT_USRNUM2
,  PT_NOTE
,  PT_GROSS
,  PT_CURR_VALU
,  PT_CURRENCYCODE                  as PT_CURRENCYSYMBOL
,  (
      case PT_ORIGIN
         when 'PO' then (
                           case isnull(POH_BUDGET_STATUS,'')
                              when 'AA'   then 1   -- Required authorisation due to Authorise All option
                              when 'U M'  then 2   -- User maximum order budget exceeded
                              when 'UP'   then 8   -- User period budget exceeded
                              when 'UY'   then 12  -- User year budget exceeded
                              when 'NP'   then 32  -- Nominal period budget exceeded
                              when 'NY'   then 48  -- Nominal year budget exceeded
                              when 'NU'   then 40  -- Nominal and User budgets exceeded
                              when 'UPM'  then 10  -- User period and maximum order budgets exceeded
                              when 'UYM'  then 14  -- User year and maximum order budgets exceeded
                              when 'NPM'  then 34  -- Nominal period and maximum order budgets exceeded
                              when 'NYM'  then 50  -- Nominal year and maximum order budgets exceeded
                              when 'NUM'  then 42  -- Nominal, User and maximum order budgets exceeded
                              when ''     then 0   -- No authorisation was required
                              else
                                 128               -- Error
                           end
                        )
         else
            0
      end
   )                                as POH_BUDGET_STATUS
,  (
      case PT_ORIGIN
         when 'PO' then isnull(POH_AUTHORISER_ID,'')
         else
            ''
      end
   )                                as POH_AUTHORISER_ID
   from
      PL_TRANSACTIONS
         inner join        PL_ACCOUNTS          on PT_COPYSUPP       = SUCODE
         left outer join   PL_TRANSACTIONS2     on PT_PRIMARY_2      = PT_PRIMARY
         left outer join   PL_TRANSACTION_NOTES on PT_COPY_HEADERKEY = 'P' + convert(nvarchar,PT_PRIMARY)
         left outer join   POP_HEADER           on POH_ORDER_NUMBR   = PT_ORDER_NUMBER and PT_ORIGIN = 'PO'