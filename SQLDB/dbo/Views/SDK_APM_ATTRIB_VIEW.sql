﻿create view    SDK_APM_ATTRIB_VIEW
as
select
   SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_NAME
,  SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_TYPE
,  SDK_RPTB_ATTR_DETAIL.RBATTR_PRIMARY
,  SDK_RPTB_ATTR_DETAIL.RBATTR_CHAR
,  SDK_RPTB_ATTR_DETAIL.RBATTR_DATE
,  SDK_RPTB_ATTR_DETAIL.RBATTR_VALUE
,  SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_HEADER
,  SDK_RPTB_ATTR_DETAIL.RBATTR_RBD_PRIMARY
,  SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_PRIMARY
,  RBSYSD_LOOKUP_CONTENT
,  RBSYSD_WRITE
,  RBSYSD_COMPULSORY
   from           
      SDK_RPTB_SYS_ATTR_DETAIL with(nolock)
         inner join  SDK_RPTB_SYS_ATTR_HEADER   with(nolock)   on RBSYSD_HEADER                             = RBSYST_PRIMARY 
         inner join  SDK_PLUGIN_ATTR_LINK       with(nolock)   on PIATTR_RBSYST_PRIMARY                     = RBSYST_PRIMARY 
         inner join  SDK_RPTB_ATTR_DETAIL       with(nolock)   on SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_PRIMARY   = SDK_RPTB_ATTR_DETAIL.RBATTR_TEMP_PRIMARY 
   where
      PIATTR_PLUGIN_CODE = 'APM'

union all

select
   SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_NAME
,  SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_TYPE
,  NULL as RBATTR_PRIMARY
,  NULL as RBATTR_CHAR
,  NULL as RBATTR_DATE
,  NULL as RBATTR_VALUE
,  SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_HEADER
,  NULL as RBATTR_RBD_PRIMARY
,  SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_PRIMARY
,  RBSYSD_LOOKUP_CONTENT
,  RBSYSD_WRITE
,  RBSYSD_COMPULSORY
   from
      SDK_RPTB_SYS_ATTR_DETAIL with(nolock)
         inner join  SDK_RPTB_SYS_ATTR_HEADER   with(nolock)   on RBSYSD_HEADER                             = RBSYST_PRIMARY 
         inner join  SDK_PLUGIN_ATTR_LINK       with(nolock)   on PIATTR_RBSYST_PRIMARY                     = RBSYST_PRIMARY 
         left  join  SDK_RPTB_ATTR_DETAIL       with(nolock)   on SDK_RPTB_SYS_ATTR_DETAIL.RBSYSD_PRIMARY   = SDK_RPTB_ATTR_DETAIL.RBATTR_TEMP_PRIMARY 
   where
      PIATTR_PLUGIN_CODE = 'APM'