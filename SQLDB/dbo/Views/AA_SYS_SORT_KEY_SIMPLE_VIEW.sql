create view AA_SYS_SORT_KEY_SIMPLE_VIEW
/*
** Returns a table to be used specifically with AA_SYS_SORT_KEY_LIST_S
** Written:      10/05/04 NC
** Last Amended: 09/07/04 ROBB; 22/07/2004 DG, 26/08/04 NC; 20/04/2006 ROBB
*/
as

select

 TXT_PRIMARY as [PRIMARY]
,TXT_USER_TEXT
,TXT_SORT_ORDER
,TXT_DATE_PUTIN
,TXT_DATE_EDITED
,TXT_USER_PUTIN
,TXT_USER_EDITED
,case TXT_ORIGIN when 'CUSTSORT' then 1620
                 when 'CUSTU1'   then 1625
                 when 'CUSTU2'   then 1630
                 when 'CUSTU3'   then 1635
                 when 'SUPPSORT' then 2620
                 when 'SUPPU1'   then 2625
                 when 'SUPPU2'   then 2630
                 when 'SUPPU3'   then 2635
                 when 'STKSORT'  then 7620
                 when 'STKU1'    then 7625
                 when 'STKU2'    then 7630
                 when 'STKU3'    then 7635
                 when 'CSTSORT'  then 11620
                 when 'CSTU1'    then 11625
                 when 'CSTU2'    then 11630
                 when 'CSTU3'    then 11635
                 when 'CSTU4'    then 11640
                 when 'CSTU5'    then 11645
                 when 'CSTU6'    then 11650
                 when 'CPSSORT'  then 11608
                 when 'SASORT'   then 1640
                 when 'SAU1'     then 1645
                 when 'SAU2'     then 1650
                 when 'SAU3'     then 1655
                 when 'PASORT'   then 2640
                 when 'PAU1'     then 2645
                 when 'PAU2'     then 2650
                 when 'PAU3'     then 2655
                 when 'PRCSORT'  then 7640
                 when 'RSRCSORT' then 11655
                 when 'RSRCU1'   then 11660
                 when 'RSRCU2'   then 11665
                 when 'RSRCU3'   then 11670
                 when 'RSRCU4'   then 11675
                 when 'RSRCU5'   then 11680
                 when 'RSRCU6'   then 11685
                 when 'PROSU1'   then 10620
                 when 'PROSU2'   then 10625
                 when 'PROSU3'   then 10630
                 when 'PROSU4'   then 10635
                 when 'PROSU5'   then 10640
                 when 'PROSU6'   then 10645
                 when 'PROSU7'   then 10650
                 when 'PROSU8'   then 10655
                 when 'PROSU9'   then 10660
                 when 'PROSU10'  then 10665 else -1 end TXT_ORIGIN
from SYS_LOOKUP_TEXT