CREATE PROCEDURE [dbo].[TSSP_CHECK_USER_DELETE]
/*
------------------------------------------------------------------------------------------------------------------------------
Written BY: Stefan Smidak on 03/06/2013
Checks whether user is allowed to be deleted.

Version History:
v1 Initial version
------------------------------------------------------------------------------------------------------------------------------
*/
  @User_ID VARCHAR(4)

AS

DECLARE @LsCount    Int

SELECT @LsCount = COUNT(*) FROM
		(SELECT APAL_PREV_ACTION_USERID 'USERID'
		FROM TS_APPROVAL_LOG
		WHERE APAL_PREV_ACTION_USERID = @User_ID
		UNION
		SELECT APAL_THIS_ACTION_USERID 'USERID'
		FROM TS_APPROVAL_LOG
		WHERE APAL_THIS_ACTION_USERID = @User_ID
		UNION
		SELECT APAL_ACTIONED_BY_USERID 'USERID'
		FROM TS_APPROVAL_LOG
		WHERE APAL_ACTIONED_BY_USERID = @User_ID
		UNION
		SELECT APAL_ORIGINAL_THIS_ACTION_USERID 'USERID'
		FROM TS_APPROVAL_LOG
		WHERE APAL_ORIGINAL_THIS_ACTION_USERID = @User_ID
		UNION
		SELECT APAU_USERID 'USERID'
		FROM TS_APPROVAL_LOG_USER
		WHERE APAU_USERID = @User_ID
		UNION
		SELECT APAU_ORIGINAL_USERID 'USERID'
		FROM TS_APPROVAL_LOG_USER
		WHERE APAU_ORIGINAL_USERID = @User_ID) as AppRecs

		IF @LsCount>0
		 BEGIN
			RAISERROR('TSSP_CHECK_USER_DELETE: Cannot delete user. Approval records exist for this user.',16,1)
			RETURN 99
		 END
		else
		RETURN 0