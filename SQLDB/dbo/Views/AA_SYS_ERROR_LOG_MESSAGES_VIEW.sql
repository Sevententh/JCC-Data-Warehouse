create view AA_SYS_ERROR_LOG_MESSAGES_VIEW
/*
** Couples all Error Log information with a fully languaged message
** Written:			17/03/04
** Last Amended:	22/4/2004 RL, 07/05/2004 DG 
**
*/
as

select 
err_log.ERROR_ID 
,dbo.AA_CREATE_SQL_ERROR_MESSAGE_F(MESSAGE,PARAM0,PARAM1,PARAM2,PARAM3,PARAM4,PARAM_DATA_TYPE0,PARAM_DATA_TYPE1,PARAM_DATA_TYPE2,PARAM_DATA_TYPE3,PARAM_DATA_TYPE4) as MESSAGE
,ERROR_GROUP_NUMBER   
,ERROR_SUB_GROUP_NUMBER 
,SP_NAME
,SEVERITY
,CREATED_DATE                                           
,CREATED_BY 
,[LANGUAGE]
,OBJECT_GUID
 
from SYS_ERROR_LOG err_log 
inner join SYS_SQL_ERROR_MESSAGES mess on mess.ERROR_ID = err_log.ERROR_ID
inner join SYS_SQL_ERROR_MESSAGE_DATATYPES dtypes on dtypes.ERROR_ID = mess.ERROR_ID

