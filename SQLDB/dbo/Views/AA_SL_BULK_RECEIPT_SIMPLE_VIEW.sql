create view AA_SL_BULK_RECEIPT_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SL_BULK_RECEIPT_LIST_S
** Written     :  12/01/2005 SH
** Last Amended:  25/04/2005 SRB, 25/07/2005 SRB, 05/12/2005 DB
**
*/
as

select S.ST_PRIMARY as [PRIMARY],
   C.CUCODE,
   C.CUNAME,
   S.ST_DATE,
   S.ST_HEADER_REF,
   S.ST_TRANTYPE,
   case ST_TRANTYPE
      when 'INV' then 0
      when 'CRN' then 1
      when 'PAY' then 2
      when 'ADR' then 3
      when 'ACR' then 4
   end as TRANSACTION_TYPE,
   --Nett
   case
      when HOME_CURR_SYMBL != ST_CURRENCYCODE then case
                                                      when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_CURR_NETT * -1
                                                      else
                                                         S.ST_CURR_NETT
                                                   end
      else
         case
            when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_NETT * -1
            else
               S.ST_NETT
         end
   end as ST_NETT,
   --Gross
   case
      when HOME_CURR_SYMBL != ST_CURRENCYCODE then case
                                                      when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_CURR_VALU * -1
                                                      else
                                                         S.ST_CURR_VALU
                                                   end
      else
         case
            when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_GROSS * -1
            else
               S.ST_GROSS
         end
   end as ST_GROSS,
   --Unallocated
   case
      when HOME_CURR_SYMBL != ST_CURRENCYCODE then case
                                                      when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_CURR_UNAL * -1
                                                      else
                                                         S.ST_CURR_UNAL
                                                   end
      else
         case
            when S.ST_TRANTYPE in ( 'PAY', 'CRN', 'ACR' ) then S.ST_UNALLOCATED * -1
            else
               S.ST_UNALLOCATED
         end
   end as ST_UNALLOCATED,
   S.ST_SETT_DISC_1,
   S.ST_SETT_DAYS_1,
   S.ST_SETT_DISC_2,
   S.ST_SETT_DAYS_2,
   S.ST_QUERY_FLAG,
   S.ST_DUEDATE,
   S.ST_ANTICPAYDATE,
   S.ST_CURRENCYCODE,
   C.CUSORT,
   S.ST_USER1,
   S.ST_USER2,
   S.ST_USER3,
   S2.STT_USRCHAR1,
   S2.ST_USRCHAR2,
   S2.ST_USRCHAR3,
   S2.ST_USRCHAR4,
   S2.ST_USRNUM1,
   S2.ST_USRNUM2,
   S2.ST_USRDATE1,
   S2.ST_USRDATE2,
   S.ST_SUB_LEDGER,
   S2.ST_USRFLAG1,
   S2.ST_USRFLAG2,
   isnull( C2.CU_LEVEL, 0 ) as CU_LEVEL,
   S.ST_YEAR,
   S.ST_PERIODNUMBER

   from SL_TRANSACTIONS S
      left join SL_TRANSACTIONS2 S2 on S2.ST_PRIMARY_2 = S.ST_PRIMARY
      inner join SL_ACCOUNTS C on C.CUCODE = S.ST_COPYCUST
      inner join SL_ACCOUNTS2 C2 on C2.CU_PRIMARY_2 = C.CU_PRIMARY
      left join SYS_DATAINFO D on D.SYS_PRIMARY = 1
      left join SYS_DATAINFO2 D2 on D2.SYS_PRIMARY_2 = D.SYS_PRIMARY

   where S.ST_ALOC_POINTER like '0%' and S.ST_BATCH_FLAG <> 1