﻿CREATE VIEW TS_LOOKUP_STOCK_CF AS
-- TS_LOOKUP_STOCK_CF Version 1
-- Written by Paul McNamara 12/01/2010
-- View used by custom forms stock lookup
-- Version History:
-- v1 – Initial version created by Paul McNamara 12/01/2010 for use with FP version 3.6.06
SELECT
STKCODE 'Code',
STKNAME 'Name',
STK_BASEPRICE '~~Sell Price',
STK_COSTPRICE '~~Cost Price',
STK_PHYSICAL - STK_RESERVE_OUT '~~Free',
STK_RESERVE_OUT '~~Reserve Out',
STK_PHYSICAL '~~Physical',
STK_SORT_KEY 'Sort Key',
STK_SORT_KEY1 'Sort Key 1',
STK_SORT_KEY2 'Sort Key 2',
STK_SORT_KEY3 'Sort Key 3',
STKCODE '__CODE',
STKNAME '__NAME',
STK_SORT_KEY '__SORT_KEY',
STK_SORT_KEY1 '__SORT_KEY1',
STK_SORT_KEY2 '__SORT_KEY2',
STK_SORT_KEY3 '__SORT_KEY3',
STK_USRCHAR1 '__USRCHAR1',
STK_USRCHAR2 '__USRCHAR2',
STK_USRCHAR5 '__USRCHAR5',
STK_USRCHAR6 '__USRCHAR6',
STK_USRCHAR7 '__USRCHAR7',
STK_USRCHAR8 '__USRCHAR8'
FROM STK_STOCK
LEFT JOIN STK_STOCK3 ON STKCODE3 = STKCODE