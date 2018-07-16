CREATE VIEW TS_LOOKUP_COUNTRY AS
      -- TS_LOOKUP_COUNTRY Version 1
      -- Written by Martin Lynch 25/02/2011
      -- View used by custom forms country code lookup
      -- Version History:
      -- v1 – Initial version created by Martin Lynch 25/02/2011 for use with FP version 3.2.00 and Workflow Forms V1.3
      SELECT [CO_CODE]	'__CODE'
            ,[CO_NAME]	'__NAME'
            ,[CO_CODE]	'Code'
            ,[CO_SYMBOL]	'Symbol'
            ,[CO_NAME]	'Name'
        FROM [SYS_COUNTRY]