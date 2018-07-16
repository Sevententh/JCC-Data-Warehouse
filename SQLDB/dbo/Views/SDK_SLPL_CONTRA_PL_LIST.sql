create view SDK_SLPL_CONTRA_PL_LIST

/*
**
** SP PL Contas
** PL List
**
** Written     :  Plug-Ins Team
** Last Amended:  19/07/2010 SM
**
*/

as
select
   PT_PRIMARY
,  PT_TRANTYPE
,  PT_HEADER_REF
,  PT_BATCH_FLAG
,  PT_COPYSUPP
,  PT_DATE
,  PT_DUEDATE
,  PT_CURRENCYCODE
,  PT_SETT_DISC1
,  PT_SETT_DISC2
,  PT_SETT_DAYS1
,  PT_SETT_DAYS2
,  case 
      when PT_TRANTYPE='INV' or PT_TRANTYPE='ACR' then PT_UNALLOCATED 
      else 
         PT_UNALLOCATED*-1 
   end as PT_UNALLOCATED
,  case 
      when PT_TRANTYPE='INV' or PT_TRANTYPE='ACR' then PT_GROSS 
      else 
         PT_GROSS*-1 
   end as PT_GROSS
,  case 
      when PT_TRANTYPE='INV' or PT_TRANTYPE='ACR' then PT_CURR_UNAL 
      else 
         PT_CURR_UNAL*-1 
   end as PT_CURR_UNAL
,  case 
      when PT_TRANTYPE='INV' or PT_TRANTYPE='ACR' then PT_CURR_VALU 
      else 
         PT_CURR_VALU*-1 
   end as PT_CURR_VALU
,  case 
      when PT_TRANTYPE='INV' or PT_TRANTYPE='ACR' then PT_CURR_NETT 
      else 
         PT_CURR_NETT*-1 
   end as PT_CURR_NETT
,  case 
      when PT_TRANTYPE='INV' or PT_TRANTYPE='ACR' then PT_NETT 
      else 
         PT_NETT*-1 
   end as PT_NETT
   from
      PL_TRANSACTIONS