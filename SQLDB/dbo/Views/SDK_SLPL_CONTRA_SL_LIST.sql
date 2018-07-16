create view SDK_SLPL_CONTRA_SL_LIST

/*
**
** SP PL Contas
** SL List
**
** Written     :  Plug-Ins Team
** Last Amended:  19/07/2010 SM
**
*/

as
select
   ST_PRIMARY
,  ST_TRANTYPE
,  ST_HEADER_REF
,  ST_BATCH_FLAG
,  ST_COPYCUST
,  ST_DATE
,  ST_DUEDATE
,  ST_CURRENCYCODE
,  ST_SETT_DISC_1
,  ST_SETT_DISC_2
,  ST_SETT_DAYS_1
,  ST_SETT_DAYS_2
,  case 
      when ST_TRANTYPE='INV' or ST_TRANTYPE='ADR' then ST_UNALLOCATED 
      else 
         ST_UNALLOCATED*-1 
   end as ST_UNALLOCATED
,  case 
      when ST_TRANTYPE='INV' or ST_TRANTYPE='ADR' then ST_GROSS 
      else 
         ST_GROSS*-1 
   end as ST_GROSS
,  case 
      when ST_TRANTYPE='INV' or ST_TRANTYPE='ADR' then ST_CURR_UNAL 
      else 
         ST_CURR_UNAL*-1 
   end as ST_CURR_UNAL
,  case 
      when ST_TRANTYPE='INV' or ST_TRANTYPE='ADR' then ST_CURR_VALU 
      else 
         ST_CURR_VALU*-1 
   end as ST_CURR_VALU
,  case 
      when ST_TRANTYPE='INV' or ST_TRANTYPE='ADR' then ST_CURR_NETT 
      else 
         ST_CURR_NETT*-1 
   end as ST_CURR_NETT
,  case 
      when ST_TRANTYPE='INV' or ST_TRANTYPE='ADR' then ST_NETT 
      else 
         ST_NETT*-1 
   end as ST_NETT
   from
      SL_TRANSACTIONS