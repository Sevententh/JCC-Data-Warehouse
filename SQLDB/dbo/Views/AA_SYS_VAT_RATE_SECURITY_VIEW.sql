create view AA_SYS_VAT_RATE_SECURITY_VIEW
/*
** Written     :  25/07/2005 DB
** Last Amended:
** Comments    :  Returns Security Profile settings for System Control >> VAT >> Vat Rates
*/
as
select
   UP_CODE     as PROFILECODE
,  UP_MODULE   as PROFILEMODULE
,  cast(substring(UP_RECORDMASK, 2, 1) as tinyint) as ALLOWEDACCESS
,  (
      case
         when substring(UP_REC_OPTIONS2, 2, 1) = 'F' then cast(1 as tinyint)
         else
            cast(0 as tinyint)
      end
   ) as [INSERT]
,  (
      case
         when substring(UP_REC_OPTIONS2, 2, 1) = 'F' then cast(1 as tinyint)
         else
            cast(0 as tinyint)
      end
   ) as EDIT
,  (
      case
         when substring(UP_REC_OPTIONS2, 2, 1) = 'F' then cast(1 as tinyint)
         else
            cast(0 as tinyint)
      end
   ) as [DELETE]
/*
,  UP_LEVEL_RECENTRY1   as ENTERAMENDLEVEL
,  UP_LEVEL_RECVIEW1    as WORKWITHLEVEL
,  UP_LEVEL_EXACT1      as EXACTLEVEL
*/
   from
      SYS_USER_PROFILE
   where
      UP_MODULE = 'SYS'


