CREATE VIEW [TS_CF_STATUS] AS
      SELECT
      APAL_RECORD_TYPE '__RECORDTYPE',
      APAL_RECORD_LINK '__RECORDLINK',
      APAL_STATUS As '__STATUSCODE',
      APAL_PREV_ACTION '__PREVIOUSACTIONCODE',
      APAL_APAS_PRIMARY '__STAGEID',
      CASE APAL_STATUS
       WHEN 0 THEN 'Pending'
       WHEN 1 THEN 'Awaiting Approval'
       WHEN 2 THEN 'Approved'
       WHEN 3 THEN 'Posted'
       WHEN 4 THEN 'Rejected'
       WHEN 5 THEN 'Cancelled'
       WHEN 6 THEN 'Deleted'
       WHEN 7 THEN 'Reopened'
      END '__STATUSTEXT',
      CASE APAL_STATUS
       WHEN 0 THEN 'Pending'
       WHEN 1 THEN 'Awaiting Approval'
       WHEN 2 THEN 'Approved'
       WHEN 3 THEN 'Posted'
       WHEN 4 THEN 'Rejected'
       WHEN 5 THEN 'Cancelled'
       WHEN 6 THEN 'Deleted'
       WHEN 7 THEN 'Reopened'
      END 'Status',
      COALESCE(APAS_NAME,'') 'Stage'
      FROM TS_APPROVAL_LOG 
      LEFT JOIN TS_APPROVAL_STAGE ON APAL_APAS_PRIMARY = APAS_PRIMARY
      WHERE APAL_CURRENT = 1