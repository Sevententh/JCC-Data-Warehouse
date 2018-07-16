CREATE VIEW AA_REP_SUPPLIER_VAT_VIEW
/*
** Written:     29/04/2005 RV   
** Last Amended: 
** Comments: returns selected suppliers with missing vat numbers for crystal reports
*/
AS
SELECT     

SUCODE, 
SUNAME, 
SU_VAT_REG_NO, 
SU_COUNTRY_CODE, 
SU_IMPORT_CODE, 
SUSORT, 
SUUSER1, 
SUUSER2, 
SUUSER3, 
SUCURRENCYCODE, 
SU_TAX_CODE, 
SU_COUNTRY

FROM PL_ACCOUNTS

WHERE  (SU_VAT_REG_NO IS NULL OR SU_VAT_REG_NO = '') 