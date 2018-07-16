create view AA_SYS_RESOURCE_RATES_LIST_VIEW

/*
** Written:      09/02/2006 JC
** Last Amended: 
*/
as

select
    R_RATE_NUMBER
,   R_DESCRIPTION
,   R_IN_USE

   from
       SYS_RESOURCE_RATES



