CREATE VIEW TS_LOOKUP_COSTCENTRE AS
-- TS_LOOKUP_COSTCENTRE Version 1
-- Written by Paul McNamara 12/01/2010
-- View used by custom forms cost centre lookup
-- Version History:
-- v1 – Initial version created by Paul McNamara 12/01/2010 for use with FP version 3.6.06
SELECT
CC_CODE 'Code',
CC_NAME 'Name',
CC_USER_SUBTOT 'Subtotal',
CC_CODE '__CODE',
CC_NAME '__NAME',
CC_USER_SUBTOT '__USER_SUBTOT',
CC_COPYHEADER '__PROJECT',
CC_STATUS '__STATUS'
FROM CST_COSTCENTRE