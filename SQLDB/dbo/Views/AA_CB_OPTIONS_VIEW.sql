create view AA_CB_OPTIONS_VIEW
/*
** Written:      30/01/04 SRB
** Last Amended: 08/10/04 ROBB, 13/05/2005 SH
** Comments:     Returns Cash Book Options
*/
as

select

SYS_CB_TYPEFROMSIGN

from SYS_DATAINFO2
