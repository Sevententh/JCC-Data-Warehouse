create view AA_PL_TRANSACTION_THREESIXTY_ORDER_VIEW
/*
** Returns order header line information to be used by the Three Sixty enquiry.
**
** Written:      22/09/2005 SH
** Last Amended: 
*/
as

select O.POH_ORDER_NUMBR as ORDER_NUMBER,
   O.POH_DATE,
   O.POH_GROSS,
   O.POH_GROSS_C,
   O.POH_CURR_CODE,
   O.POH_ACCOUNT,
   isnull(S.SUNAME,'') as SUNAME,
   A.PL_AD_ADDRESS as ORDER_ADDRESS,
   A1.PL_AD_ADDRESS as INVOICE_ADDRESS,
   case O.POH_DEL_ADD_POINT
      when 'CO' then CA.COAD_ADDRESS
      when 'SU' then A2.PL_AD_ADDRESS
      when 'CU' then A3.AD_ADDRESS
      else ''
   end as DELIVERY_ADDRESS,
   case O.POH_DEL_ADD_POINT
      when 'CO' then isnull(CA.COAD_NAME,'')
      else ''
   end as COMPANY_DELIVERY_NAME,
   case O.POH_DEL_ADD_POINT
      when 'CU' then isnull(C.CUCODE,'')
      else ''
   end as CUSTOMER_DELIVERY_ACCOUNT,
   case O.POH_DEL_ADD_POINT
      when 'CU' then isnull(C.CUNAME,'')
      else ''
   end as CUSTOMER_DELIVERY_NAME,
   isnull(O.POH_USER1,'') as POH_USER1,
   isnull(O.POH_USER2,'') as POH_USER2,
   isnull(O.POH_USER3,'') as POH_USER3
from POP_HEADER O
   inner join PL_ACCOUNTS S on S.SUCODE = O.POH_ACCOUNT
   inner join PL_ADDRESSES A on A.PL_AD_ACCCODE = O.POH_ACCOUNT
      and A.PL_AD_CODE = 1
   inner join PL_ADDRESSES A1 on A1.PL_AD_ACCCODE = O.POH_ACCOUNT
      and A1.PL_AD_CODE = O.POH_INV_ADD
   left join SYS_COMP_ADDRESS CA on CA.COAD_PRIMARY = O.POH_DEL_ADD and O.POH_DEL_ADD_POINT = 'CO'
   left join PL_ADDRESSES A2 on A2.PL_AD_ACCCODE = O.POH_ACCOUNT and A2.PL_AD_CODE = O.POH_DEL_ADD and O.POH_DEL_ADD_POINT = 'SU'
   left join SL_ADDRESSES A3 on A3.SL_AD_PRIMARY = O.POH_DEL_ADD
   left join SL_ACCOUNTS C on C.CUCODE = A3.AD_ACC_CODE