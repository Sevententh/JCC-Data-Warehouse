CREATE VIEW TS_LOOKUP_CURRENCY AS
      -- TS_LOOKUP_CURRENCY Version 1
      -- Written by Martin Lynch 25/02/2011
      -- View used by custom forms currency code lookup
      -- Version History:
      -- v1 – Initial version created by Martin Lynch 25/02/2011 for use with FP version 3.2.00 and Workflow Forms V1.3
      SELECT [CURR_CODE]		'__CODE'
            ,[CURR_SYMBOL]	'__SYMBOL'
            ,[CURR_CODE]		'Code'
            ,[CURR_SYMBOL]	'Symbol'
            ,[CURR_RATE]		'Rate'
            ,[CURR_RATEDATE]	'Date'
        FROM [SYS_CURRENCY]