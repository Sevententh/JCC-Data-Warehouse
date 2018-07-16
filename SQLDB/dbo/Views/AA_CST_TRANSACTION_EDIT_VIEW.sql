create view AA_CST_TRANSACTION_EDIT_VIEW
/*
** Only shows transactions entered through the Costing Module.
** Note: If a column is compulsory in all costing transaction types then a default is not provided.
**
** Written     :  09/03/2006 SR
** Last Amended:  13/03/2006 SR
*/
as

select
   isnull(CT_ACCOUNT,'')                                    as CT_ACCOUNT                 -- Customer/Supplier/Nominal Code
,  isnull(CUNAME,'')                                        as CUNAME                     -- Customer Name
,  isnull(SUNAME,'')                                        as SUNAME                     -- Supplier Name
,  isnull(NNAME,'')                                         as NNAME                      -- Nominal Name
,  CT_ARCHIVE_FLG                                                                         -- Archive Transaction
,  cast(CT_PRIMARY as int)                                  as AUDIT_NUMBER               -- Audit Number
,  isnull(CT_BATCH_REF,'')                                  as CT_BATCH_REF               -- Batch Reference
,  isnull(CT_USER_PUTIN,'')                                 as CT_USER_PUTIN              -- User ID of this transaction's creator
-- Currency Gross
,  CT_CURR_CODE                                                                           -- Curr Symbol
,  isnull(CT_USRCHAR1,'')                                   as CT_USRCHAR1                -- User Char 1
,  isnull(CT_USRCHAR2,'')                                   as CT_USRCHAR2                -- User Char 2
,  isnull(CT_USRCHAR3,'')                                   as CT_USRCHAR3                -- User Char 3
,  isnull(CT_USRCHAR4,'')                                   as CT_USRCHAR4                -- User Char 4
,  CT_USRDATE1                                                                            -- User Date 1
,  CT_USRDATE2                                                                            -- User Date 2
,  isnull(CT_USRFLAG1,0)                                    as CT_USRFLAG1                -- User Flag 1
,  isnull(CT_USRFLAG2,0)                                    as CT_USRFLAG2                -- User Flag 2
,  dbo.AA_VALUE_DPS_F(CT_USRNUM1)                           as CT_USRNUM1                 -- User Number 1
,  dbo.AA_VALUE_DPS_F(CT_USRNUM2)                           as CT_USRNUM2                 -- User Number 2
,  CT_DATE_PUTIN                                                                          -- Date Entered
,  isnull(CT_DESCRIPTION,'')                                as CT_DESCRIPTION             -- Description
,  isnull(CT_DETAIL,'')                                     as CT_DETAIL                  -- Detail
-- Edited By
,  CT_GROSS                                                 as CT_GROSS					  -- Home Gross
,  CT_PRIMARY                                               as [PRIMARY]                  -- Costing Detail Primary
,  isnull(CT_HEADER_REF,'')                                 as CT_HEADER_REF              -- Reference
,  case CT_TRANTYPE
      when 'MSC' then 0
      when 'SAL' then 1
      when 'TIM' then 2
   end                                                      as CT_TRANTYPE                -- Transaction Type
,  dbo.AA_VALUE_DPS_F(CT_CURR_RATE * CT_GROSS)              as CT_CURR_GROSS              -- Currency Gross

   from
      CST_DETAIL
         left outer join CST_DETAIL2                        on CT_PRIMARY_2               = CT_PRIMARY
         left outer join SL_ACCOUNTS                        on CUCODE                     = CT_ACCOUNT
         left outer join PL_ACCOUNTS                        on SUCODE                     = CT_ACCOUNT
         left outer join NL_ACCOUNTS                        on NCODE                      = CT_ACCOUNT

   where
      CT_PUTIN_LEDGER   = 'CST'