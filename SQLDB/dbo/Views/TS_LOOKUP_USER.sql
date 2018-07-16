CREATE VIEW TS_LOOKUP_USER AS
-- TS_LOOKUP_USER Version 1
-- Written by Paul McNamara 12/01/2010
-- View used by custom forms user lookup
-- Version History:
-- v1 – Initial version created by Paul McNamara 12/01/2010 for use with FP version 3.6.06
SELECT
USER_ID 'ID',
USER_NAME 'Name',
USER_PROFILE_CODE 'Profile'
FROM SYS_USER