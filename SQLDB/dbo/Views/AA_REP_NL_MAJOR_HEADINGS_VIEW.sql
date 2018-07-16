CREATE VIEW AA_REP_NL_MAJOR_HEADINGS_VIEW
/*
** Written:     10/11/2005 RV   
** Last Amended: 
** Comments: returns nominal major heading codes for crystal reports
*/
AS

SELECT     
NL_MAJORCODE, 
NL_MAJORNAME, 
NL_MAJORMARKER 

FROM NL_MAJORHEADING