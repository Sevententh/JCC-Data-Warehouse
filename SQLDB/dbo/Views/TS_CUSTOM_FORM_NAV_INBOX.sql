﻿CREATE VIEW [TS_CUSTOM_FORM_NAV_INBOX] AS

      SELECT 
      [USER_ID] as [TSU_USERID],
      (SELECT count(*) FROM TS_CUSTOM_FORM_INBOX WHERE [__APPROVERID] = [USER_ID] AND __STATUSCODE = 1) AS [INBOX_QTY]

      FROM [SYS_USER]