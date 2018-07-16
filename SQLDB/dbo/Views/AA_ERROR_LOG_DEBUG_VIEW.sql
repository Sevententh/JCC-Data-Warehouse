create view AA_ERROR_LOG_DEBUG_VIEW
(
   ErrorGroupId
,  ErrorHeaderId
,  ErrorDetailId
,  ErrorLogSequence
,  WorkStation
,  DatabaseName
,  Process_User
,  Entered_User
,  ErrorDate
,  Module
,  Origin
,  Account
,  ErrorCategory
,  ErrorCode
,  ErrorName
,  ErrorDescription
,  ExtraInfo
,  SeverityCode
,  SeverityDescription
,  VerbosenessCode
,  VerbosenessDescription
,  ErrorOutcome
,  DetailSequence
,  DetailDateTime
,  TransHeaderLink
,  TransDetailLineNo
,  TransDetailLink
,  Language
)
as
select
   H0
,  ELH_PRIMARY
,  DetailLink
,  Sequence
,  ELT_WORKSTATION_NAME
,  ELT_DESTINATION_DATASET
,  ELH_PROCESS_USERID
,  ELH_ENTERED_USERID
,  ELH_DATE
,  ELH_MODULE
,  (
      case isnull(ELH_GENERATED_FROM,'')
         when 'LEL_REF_SOP_ORDERS_BATCH'       then LEL_REF_SOP_ORDERS_BATCH
         when 'LEL_REF_POP_ORDERS_BATCH'       then LEL_REF_POP_ORDERS_BATCH
         when 'LEL_REF_SOP_CREDITNOTES_BATCH'  then LEL_REF_SOP_CREDITNOTES_BATCH
         when 'LEL_REF_POP_CREDITNOTES_BATCH'  then LEL_REF_POP_CREDITNOTES_BATCH
         when 'LEL_REF_SOP_ESTIMATES_BATCH'    then LEL_REF_SOP_ESTIMATES_BATCH
         when 'LEL_REF_SL_STATEMENTS'          then LEL_REF_SL_STATEMENTS
         when 'LEL_REF_PL_STATEMENTS'          then LEL_REF_PL_STATEMENTS
         when 'LEL_REF_PL_REMITTANCES'         then LEL_REF_PL_REMITTANCES
         when 'LEL_REF_SOP_DELIVERY_LIVE'      then LEL_REF_SOP_DELIVERY_LIVE
         when 'LEL_REF_SOP_PROFORMA_BATCH'     then LEL_REF_SOP_PROFORMA_BATCH
         when 'LEL_REF_SOP_ESTIMATE_LIVE'      then LEL_REF_SOP_ESTIMATE_LIVE
         when 'LEL_REF_CRM_PIPELINE'           then LEL_REF_CRM_PIPELINE
         when ''                               then ''
         else
            ELH_GENERATED_FROM -- 'Unrecognized Process being Logged'
      end
   )
,  ELH_ACCOUNT_CODE
,  (
      case isnull(ELD_CATEGORY_LANG_LBL,'')
         when 'LEL_CAT_ACD'      then LEL_CAT_ACD
         when 'LEL_CAT_ADMS'     then LEL_CAT_ADMS
         when 'LEL_CAT_EMAIL'    then LEL_CAT_EMAIL
         when 'LEL_CAT_FAX'      then LEL_CAT_FAX
         when 'LEL_CAT_PRINT'    then LEL_CAT_PRINT
         when 'LEL_CAT_PROCESS'  then LEL_CAT_PROCESS
         when 'LEL_CAT_SQL'      then LEL_CAT_SQL
         when 'LEL_CAT_PDF'      then LEL_CAT_PDF
         when 'LEL_CAT_XML'      then LEL_CAT_XML
         when 'LEL_CAT_FILE'     then LEL_CAT_FILE
         when ''                 then ''
         else
            ELD_CATEGORY_LANG_LBL --'Unrecognized Error Description'
      end
   )
,  ELD_CODE
,  ELD_NAME
,  (
      case isnull(ELD_DESCRIPTION_LANG_LBL,'')
         when 'LEL_LBL_PRINTING_STARTED'            then LEL_LBL_PRINTING_STARTED
         when 'LEL_LBL_PRINTING_FINISHED'           then LEL_LBL_PRINTING_FINISHED
         when 'LEL_LBL_BATCH_STARTED'               then LEL_LBL_BATCH_STARTED
         when 'LEL_LBL_BATCH_FINISHED'              then LEL_LBL_BATCH_FINISHED
         when 'LEL_LBL_PROCESSING_STARTED'          then LEL_LBL_PROCESSING_STARTED
         when 'LEL_LBL_PROCESSING_FINISHED'         then LEL_LBL_PROCESSING_FINISHED
         when 'LEL_LBL_DELIVERY'                    then LEL_LBL_DELIVERY
         when 'LEL_LBL_INVOICE'                     then LEL_LBL_INVOICE
         when 'LEL_LBL_PICKING_LIST'                then LEL_LBL_PICKING_LIST
         when 'LEL_LBL_HARDCOPIES_STARTED'          then LEL_LBL_HARDCOPIES_STARTED
         when 'LEL_LBL_HARDCOPIES_FINISHED'         then LEL_LBL_HARDCOPIES_FINISHED
         when 'LEL_LBL_CREDIT_NOTE'                 then LEL_LBL_CREDIT_NOTE
         when 'LEL_LBL_WFF'                         then LEL_LBL_WFF
         when 'LAE_CRYSTAL_ERROR'                   then LAE_CRYSTAL_ERROR
         when 'LAE_DATA_SRC_NAME_NOT_SPCFD'         then LAE_DATA_SRC_NAME_NOT_SPCFD
         when 'LAE_DEFAULT_LOGON_FAILED'            then LAE_DEFAULT_LOGON_FAILED
         when 'LAE_DLL_NOT_FOUND'                   then LAE_DLL_NOT_FOUND
         when 'LAE_INCORRECT_DLL_VER'               then LAE_INCORRECT_DLL_VER
         when 'LAE_INVALID_PRINT_JOB_NO'            then LAE_INVALID_PRINT_JOB_NO
         when 'LAE_INVALID_SESSION_NAME'            then LAE_INVALID_SESSION_NAME
         when 'LAE_LOGON_FAILED'                    then LAE_LOGON_FAILED
         when 'LAE_NO_PRINT_ENGINE'                 then LAE_NO_PRINT_ENGINE
         when 'LAE_PRINT_ENGINE_FAILED'             then LAE_PRINT_ENGINE_FAILED
         when 'LAE_PRINT_ENGINE_MISMATCH'           then LAE_PRINT_ENGINE_MISMATCH
         when 'LAE_PRINT_JOB_FAILED'                then LAE_PRINT_JOB_FAILED
         when 'LAE_QUERY_UPDATE_FAILED'             then LAE_QUERY_UPDATE_FAILED
         when 'LAE_REPORT_NOT_FOUND'                then LAE_REPORT_NOT_FOUND
         when 'LAE_UNKNOWN_REPORT'                  then LAE_UNKNOWN_REPORT
         when 'LAE_UNKNOWN_STAGE'                   then LAE_UNKNOWN_STAGE
         when 'LAE_UNKNOWN_TABLE'                   then LAE_UNKNOWN_TABLE
         when 'LAE_TABLE_UPDATE_FAILED'             then LAE_TABLE_UPDATE_FAILED
         when 'LAE_PRINT_JOBS_STILL_OPEN'           then LAE_PRINT_JOBS_STILL_OPEN
         when 'LAE_PRINT_JOB_NOT_OPEN'              then LAE_PRINT_JOB_NOT_OPEN
         when 'LAE_NO_TABLES_ON_REPORT'             then LAE_NO_TABLES_ON_REPORT
         when 'LAE_HOSTNAME_MISSING'                then LAE_HOSTNAME_MISSING
         when 'LAE_CLOSE_SUBRPT_FAILED'             then LAE_CLOSE_SUBRPT_FAILED
         when 'LAE_OPEN_SUBRPT_FAILED'              then LAE_OPEN_SUBRPT_FAILED
         when 'LAE_GET_SUBRPT_INFO_FAILED'          then LAE_GET_SUBRPT_INFO_FAILED
         when 'LAE_UNABLE_TO_OPEN_JOB'              then LAE_UNABLE_TO_OPEN_JOB
         when 'LAE_GET_TABLE_LOC_FAILED'            then LAE_GET_TABLE_LOC_FAILED
         when 'LAE_SET_TABLE_LOC_FAILED'            then LAE_SET_TABLE_LOC_FAILED
         when 'LAE_GET_TBL_LOGON_INFO_FAILED'       then LAE_GET_TBL_LOGON_INFO_FAILED
         when 'LAE_SET_TBL_LOGON_INFO_FAILED'       then LAE_SET_TBL_LOGON_INFO_FAILED
         when 'LAE_GET_QUERY_FAILED'                then LAE_GET_QUERY_FAILED
         when 'LAE_SET_QUERY_FAILED'                then LAE_SET_QUERY_FAILED
         when 'LAE_TABLE_CONNECTION_FAILED'         then LAE_TABLE_CONNECTION_FAILED
         when 'LAE_VERIFY_DATABASE_FAILED'          then LAE_VERIFY_DATABASE_FAILED
         when 'LAE_INVLD_REC_SLCTN_FORMULA'         then LAE_INVLD_REC_SLCTN_FORMULA
         when 'LAE_INVLD_GRP_SLCTN_FORMULA'         then LAE_INVLD_GRP_SLCTN_FORMULA
         when 'LAE_DESTINATION_NOT_SET'             then LAE_DESTINATION_NOT_SET
         when 'LAE_FAILED_ODBC_CONNECTION'          then LAE_FAILED_ODBC_CONNECTION
         when 'LAE_TEMPLATE_PROBLEM'                then LAE_TEMPLATE_PROBLEM
         when 'LAE_CRPE_INI_NOT_FOUND'              then LAE_CRPE_INI_NOT_FOUND
         when 'LAE_DIRECTORY_NOT_FOUND'             then LAE_DIRECTORY_NOT_FOUND
         when 'LAE_UNABLE_TO_CREATE_COMMAND_FILE'   then LAE_UNABLE_TO_CREATE_COMMAND_FILE
         when 'LAE_RETRIEVE_USER_ERROR'             then LAE_RETRIEVE_USER_ERROR
         when 'LAE_EXTERNAL_DOC_NOT_FOUND'          then LAE_EXTERNAL_DOC_NOT_FOUND
         when 'LAE_USER_CREATION_ERROR'             then LAE_USER_CREATION_ERROR
         when 'LAE_STOCK_PICTURE_NOT_FOUND'         then LAE_STOCK_PICTURE_NOT_FOUND
         when 'LAE_DOCUMENT_UPDATE_FAILED'          then LAE_DOCUMENT_UPDATE_FAILED
         when 'LAE_OPEN_COMMAND_FILE_FAILED'        then LAE_OPEN_COMMAND_FILE_FAILED
         when 'LAE_UPDATE_COMMAND_FILE_FAILED'      then LAE_UPDATE_COMMAND_FILE_FAILED
         when 'LAE_CLOSE_COMMAND_FILE_FAILED'       then LAE_CLOSE_COMMAND_FILE_FAILED
         when 'LAE_READ_STATUS_FILE_FAILED'         then LAE_READ_STATUS_FILE_FAILED
         when 'LAE_UNABLE_TO_LAUNCH_APPLICATION'    then LAE_UNABLE_TO_LAUNCH_APPLICATION
         when 'LAE_STATUS_FILE_MISSING'             then LAE_STATUS_FILE_MISSING
         when 'LAE_WEB_SERVICE_INVALID'             then LAE_WEB_SERVICE_INVALID
         when 'LAE_USER_LOGON_FAILED'               then LAE_USER_LOGON_FAILED
         when 'LAE_UNABLE_TO_CREATE_STATUS_FILE'    then LAE_UNABLE_TO_CREATE_STATUS_FILE
         when 'LAE_UNABLE_TO_COMMUNICATE_WITH_ADMS' then LAE_UNABLE_TO_COMMUNICATE_WITH_ADMS
         when 'LAE_UNABLE_TO_SAVE_DOCUMENT'         then LAE_UNABLE_TO_SAVE_DOCUMENT
         when 'LAE_WEB_ADDRESS_NO_RESPONSE'         then LAE_WEB_ADDRESS_NO_RESPONSE
         when 'LEE_ACCESS_DENIED'                   then LEE_ACCESS_DENIED
         when 'LEE_AMBIGUOUS_RECIPIENT'             then LEE_AMBIGUOUS_RECIPIENT
         when 'LEE_ATTCHMNT_NOT_FOUND'              then LEE_ATTCHMNT_NOT_FOUND
         when 'LEE_ATTCHMNT_OPEN_FAILED'            then LEE_ATTCHMNT_OPEN_FAILED
         when 'LEE_ATTCHMNT_WRITE_FAILED'           then LEE_ATTCHMNT_WRITE_FAILED
         when 'LEE_BAD_PARAMS'                      then LEE_BAD_PARAMS
         when 'LEE_BAD_RECIPIENT_TYPE'              then LEE_BAD_RECIPIENT_TYPE
         when 'LEE_DISK_FULL'                       then LEE_DISK_FULL
         when 'LEE_EXTERNAL_LIST_EMPTY'             then LEE_EXTERNAL_LIST_EMPTY
         when 'LEE_FIELD_NOT_FOUND'                 then LEE_FIELD_NOT_FOUND
         when 'LEE_FUNCTION_NOT_SUPPORTED'          then LEE_FUNCTION_NOT_SUPPORTED
         when 'LEE_GENERAL_FAILURE'                 then LEE_GENERAL_FAILURE
         when 'LEE_INSUFFICIENT_MEMORY'             then LEE_INSUFFICIENT_MEMORY
         when 'LEE_INSUFFICIENT_MEMORY_EXT'         then LEE_INSUFFICIENT_MEMORY_EXT
         when 'LEE_INVALID_EDIT_FIELD_PARAM'        then LEE_INVALID_EDIT_FIELD_PARAM
         when 'LEE_INVALID_MESSAGE'                 then LEE_INVALID_MESSAGE
         when 'LEE_INVALID_MESSAGE_HANDLE'          then LEE_INVALID_MESSAGE_HANDLE
         when 'LEE_INVALID_RECIPIENTS'              then LEE_INVALID_RECIPIENTS
         when 'LEE_INVALID_SESSION'                 then LEE_INVALID_SESSION
         when 'LEE_LOGIN_FAILURE'                   then LEE_LOGIN_FAILURE
         when 'LEE_MESSAGE_IN_USE'                  then LEE_MESSAGE_IN_USE
         when 'LEE_NETWORK_FAILURE'                 then LEE_NETWORK_FAILURE
         when 'LEE_NO_MESSAGES'                     then LEE_NO_MESSAGES
         when 'LEE_NO_RECIPIENTS'                   then LEE_NO_RECIPIENTS
         when 'LEE_NOT_LOGGED_ON'                   then LEE_NOT_LOGGED_ON
         when 'LEE_PDF_DRIVER_NOT_FOUND'            then LEE_PDF_DRIVER_NOT_FOUND
         when 'LEE_PDF_FAILED_TO_INITIALISE'        then LEE_PDF_FAILED_TO_INITIALISE
         when 'LEE_SAVE_EXTERNAL_FAILED'            then LEE_SAVE_EXTERNAL_FAILED
         when 'LEE_TEXT_TOO_LARGE'                  then LEE_TEXT_TOO_LARGE
         when 'LEE_TOO_MANY_FILES'                  then LEE_TOO_MANY_FILES
         when 'LEE_TOO_MANY_RECIPIENTS'             then LEE_TOO_MANY_RECIPIENTS
         when 'LEE_TOO_MANY_SESSIONS'               then LEE_TOO_MANY_SESSIONS
         when 'LEE_TYPE_NOT_SUPPORTED'              then LEE_TYPE_NOT_SUPPORTED
         when 'LEE_UNDEFINED_CODE_7'                then LEE_UNDEFINED_CODE_7
         when 'LEE_UNKNOWN_RECIPIENT'               then LEE_UNKNOWN_RECIPIENT
         when 'LEE_USER_CANCELLED_OPERATION'        then LEE_USER_CANCELLED_OPERATION
         when 'LEE_EMAIL_DISABLED'                  then LEE_EMAIL_DISABLED
         when 'LEE_EMAIL_FAILED_TO_SEND'            then LEE_EMAIL_FAILED_TO_SEND
         when 'LEE_FAILED_TO_FIND_ACCESS_MAIL'      then LEE_FAILED_TO_FIND_ACCESS_MAIL
         when 'LEE_FAILED_TO_FIND_CONFIG'           then LEE_FAILED_TO_FIND_CONFIG
         when 'LEE_FAILED_TO_LAUNCH_ACCESS_MAIL'    then LEE_FAILED_TO_LAUNCH_ACCESS_MAIL
         when 'LEE_FAILED_TO_LOAD_CONFIG'           then LEE_FAILED_TO_LOAD_CONFIG
         when 'LEE_FAILED_TO_LOAD_BODY'             then LEE_FAILED_TO_LOAD_BODY
         when 'LEE_FAILED_TO_FIND_BODY'             then LEE_FAILED_TO_FIND_BODY
         when 'LEE_FAILED_TO_DELETE_CONFIG'         then LEE_FAILED_TO_DELETE_CONFIG
         when 'LEE_FAILED_TO_DELETE_BODY'           then LEE_FAILED_TO_DELETE_BODY
         when 'LEE_CONFIG_XML_MALFORMED'            then LEE_CONFIG_XML_MALFORMED
         when 'LEE_UNEXPECTED_PARAMETERS'           then LEE_UNEXPECTED_PARAMETERS
         when 'LEE_CALLING_PROCESS_ID_REQUIRED'     then LEE_CALLING_PROCESS_ID_REQUIRED
         when 'LEE_FAILED_TO_GENERATE_EMAIL'        then LEE_FAILED_TO_GENERATE_EMAIL
         when 'LEE_FAILED_TO_DELETE_EMAIL_FILE'     then LEE_FAILED_TO_DELETE_EMAIL_FILE
         when 'LEE_SETTINGS_NOT_CONFIGURED'         then LEE_SETTINGS_NOT_CONFIGURED
         when 'LEE_HOST_ADDRESS_MISSING'            then LEE_HOST_ADDRESS_MISSING
         when 'LEE_INVALID_PORT_NUMBER'             then LEE_INVALID_PORT_NUMBER
         when 'LEE_USERNAME_MISSING'                then LEE_USERNAME_MISSING
         when 'LEE_INVALID_TIMEOUT_PERIOD'          then LEE_INVALID_TIMEOUT_PERIOD
         when 'LFE_INVALID_SOFTWARE_LINK'           then LFE_INVALID_SOFTWARE_LINK
         when 'LFE_LABELS_NOT_DEFINED'              then LFE_LABELS_NOT_DEFINED
         when 'LFE_NO_FAX_NUMBER'                   then LFE_NO_FAX_NUMBER
         when 'LFE_PRINT_DRIVER_NOT_FOUND'          then LFE_PRINT_DRIVER_NOT_FOUND
         when 'LFE_FAX_DISABLED'                    then LFE_FAX_DISABLED
         when 'LFE_UNKNOWN_DEFAULT_EXP_LIST'        then LFE_UNKNOWN_DEFAULT_EXP_LIST
         when 'LFE_UNKNOWN_OLD_EXP_CODE'            then LFE_UNKNOWN_OLD_EXP_CODE
         when 'LFE_UNKNOWN_EXP_FORMAT'              then LFE_UNKNOWN_EXP_FORMAT
         when 'LFE_NO_VALID_EXP_FORMATS'            then LFE_NO_VALID_EXP_FORMATS
         when 'LFE_INVALID_PATH'                    then LFE_INVALID_PATH
         when 'LFE_INVALID_FILENAME'                then LFE_INVALID_FILENAME
         when 'LFE_CREATE_FOLDER_FAILED'            then LFE_CREATE_FOLDER_FAILED
         when 'LFE_CREATE_FILE_FAILED'              then LFE_CREATE_FILE_FAILED
         when 'LGE_INTERNAL_ERROR'                  then LGE_INTERNAL_ERROR
         when 'LGE_SQL_ERROR'                       then LGE_SQL_ERROR
         when 'LGE_MULTI_USER_LOCKING_PRBLM'        then LGE_MULTI_USER_LOCKING_PRBLM
         when 'LGE_CONSTANT_MISMATCH'               then LGE_CONSTANT_MISMATCH
         when 'LGE_INITIALISATION_FAILED'           then LGE_INITIALISATION_FAILED
         when 'LGE_PARAMETER_MISSING'               then LGE_PARAMETER_MISSING
         when 'LGE_SWITCHED_OFF'                    then LGE_SWITCHED_OFF
         when 'LGE_UNEXPECTED_PARAM_TYPE'           then LGE_UNEXPECTED_PARAM_TYPE
         when 'LGE_UNKNOWN_COMMAND'                 then LGE_UNKNOWN_COMMAND
         when 'LGE_UNKNOWN_ERROR_CODE'              then LGE_UNKNOWN_ERROR_CODE
         when 'LGE_UNKNOWN_SEVERITY'                then LGE_UNKNOWN_SEVERITY
         when 'LGE_UNKNOWN_VALUE'                   then LGE_UNKNOWN_VALUE
         when 'LGE_UNKNOWN_VERBOSENESS'             then LGE_UNKNOWN_VERBOSENESS
         when 'LGE_USER_CANCELLED'                  then LGE_USER_CANCELLED
         when 'LGE_NO_SERIAL_NUMBER'                then LGE_NO_SERIAL_NUMBER
         when 'LGE_PROBLEM_CREATING_FILE'           then LGE_PROBLEM_CREATING_FILE
         when 'LGE_DELIVERY_CHARGE_ON_OWN'          then LGE_DELIVERY_CHARGE_ON_OWN
         when 'LGE_BATCH_PROCESS_CANCELLED'         then LGE_BATCH_PROCESS_CANCELLED
         when 'LGE_NO_SUB_ANALYSIS'                 then LGE_NO_SUB_ANALYSIS
         when 'LGE_DEL_ALREADY_PRINTED'             then LGE_DEL_ALREADY_PRINTED
         when 'LGE_NOT_AUTHORISED'                  then LGE_NOT_AUTHORISED
         when 'LGE_PROCESS_BY_ANOTHER_USER'         then LGE_PROCESS_BY_ANOTHER_USER
         when 'LGE_ORDER_CLOSED'                    then LGE_ORDER_CLOSED
         when 'LGE_ORDER_ON_HOLD'                   then LGE_ORDER_ON_HOLD
         when 'LGE_MULTIPLE_SUB_ANALYSIS'           then LGE_MULTIPLE_SUB_ANALYSIS
         when 'LGE_ORDER_ACC_ON_STOP'               then LGE_ORDER_ACC_ON_STOP
         when 'LGE_DELIVERY_NOTE_NOT_PRINTED'       then LGE_DELIVERY_NOTE_NOT_PRINTED
         when 'LGE_INVOICE_NOT_PRINTED'             then LGE_INVOICE_NOT_PRINTED
         when 'LGE_NOT_ENOUGH_STOCK'                then LGE_NOT_ENOUGH_STOCK
         when 'LGE_NO_CREDIT_CARD'                  then LGE_NO_CREDIT_CARD
         when 'LGE_NO_SWITCH_DETAILS'               then LGE_NO_SWITCH_DETAILS
         when 'LGE_NL_PERIODEND_RUNNING'            then LGE_NL_PERIODEND_RUNNING
         when 'LGE_PL_PERIODEND_RUNNING'            then LGE_PL_PERIODEND_RUNNING
         when 'LGE_SL_PERIODEND_RUNNING'            then LGE_SL_PERIODEND_RUNNING
         when 'LGE_INVOICE_WITHOUT_DELIVERY'        then LGE_INVOICE_WITHOUT_DELIVERY
         when 'LGE_PRICE_RECORD_ON_OWN'             then LGE_PRICE_RECORD_ON_OWN
         when 'LGE_DELIVERY_ADDRESS_NOTUSED'        then LGE_DELIVERY_ADDRESS_NOTUSED
         when 'LGE_SOP_ADDRESSES_NOTUSED'           then LGE_SOP_ADDRESSES_NOTUSED
         when 'LGE_POP_ADDRESSES_NOTUSED'           then LGE_POP_ADDRESSES_NOTUSED
         when 'LGE_INVOICE_ADDRESS_NOTUSED'         then LGE_INVOICE_ADDRESS_NOTUSED
         when 'LGE_ORDER_ADDRESS_NOTUSED'           then LGE_ORDER_ADDRESS_NOTUSED
         when 'LGE_CRASH_DETECTED'                  then LGE_CRASH_DETECTED
         when 'LGE_INV_ALREADY_PRINTED'             then LGE_INV_ALREADY_PRINTED
         when 'LGE_DEL_ALREADY_UPDATED'             then LGE_DEL_ALREADY_UPDATED
         when 'LGE_INV_ALREADY_UPDATED'             then LGE_INV_ALREADY_UPDATED
         when 'LGE_NOTHING_TO_PRINT_ON_PLIST'       then LGE_NOTHING_TO_PRINT_ON_PLIST
         when 'LGE_NO_CARD_EXPIRY'                  then LGE_NO_CARD_EXPIRY
         when 'LGE_STOCK_NOT_ALLOCATED'             then LGE_STOCK_NOT_ALLOCATED
         when 'LGE_VALUE_READ_ONLY'                 then LGE_VALUE_READ_ONLY
         when 'LGE_VALUE_WRITE_ONLY'                then LGE_VALUE_WRITE_ONLY
         when 'LGE_VALUE_UNAVAILABLE'               then LGE_VALUE_UNAVAILABLE
         when 'LGE_NEGATIVE_CHEQUE_VALUE'           then LGE_NEGATIVE_CHEQUE_VALUE
         when 'LGE_CHEQUE_VALUE_TOO_LARGE'          then LGE_CHEQUE_VALUE_TOO_LARGE
         when 'LGE_SQL_SESSION_CLOSED'              then LGE_SQL_SESSION_CLOSED
         when 'LGE_EXCEEDED_CREDIT_LIMIT'           then LGE_EXCEEDED_CREDIT_LIMIT
         when 'LGE_INSUFFICIENT_SERIAL_NOS'         then LGE_INSUFFICIENT_SERIAL_NOS
         when 'LGE_NO_STOCK_ANALYSIS'               then LGE_NO_STOCK_ANALYSIS
         when 'LGE_DELIVERY_ACC_ON_STOP'            then LGE_DELIVERY_ACC_ON_STOP
         when 'LGE_INVOICE_ACC_ON_STOP'             then LGE_INVOICE_ACC_ON_STOP
         when 'LGE_CREDIT_NOTE_NOT_PROCESSED'       then LGE_CREDIT_NOTE_NOT_PROCESSED
         when 'LGE_CREDIT_NOTE_NOT_COMPLETED'       then LGE_CREDIT_NOTE_NOT_COMPLETED
         when 'LGE_PROJECT_STATUS_INVALID'          then LGE_PROJECT_STATUS_INVALID
         when 'LGE_COSTCENTRE_STATUS_INVALID'       then LGE_COSTCENTRE_STATUS_INVALID
         when 'LGE_D_CHRGE_AND_PRC_REC_ON_OWN'      then LGE_D_CHRGE_AND_PRC_REC_ON_OWN
         when 'LGE_PRICE_RECORDS_ON_OWN'            then LGE_PRICE_RECORDS_ON_OWN
         when 'LGE_DO_NOT_PART_DELIVER'             then LGE_DO_NOT_PART_DELIVER
         when 'LGE_CRN_ALREADY_PRINTED'             then LGE_CRN_ALREADY_PRINTED
         when 'LGE_CRN_NOT_PRINTED'                 then LGE_CRN_NOT_PRINTED
         when 'LGE_PARAMETER_LIST_EMPTY'            then LGE_PARAMETER_LIST_EMPTY
         when 'LGE_USER_DOES_NOT_EXIST'             then LGE_USER_DOES_NOT_EXIST
         when 'LGE_INV_CONSOLIDATION_ERROR'         then LGE_INV_CONSOLIDATION_ERROR
         when 'LGE_WFF_REJECTED'                    then LGE_WFF_REJECTED
         when 'LGE_WFF_PENDING'                     then LGE_WFF_PENDING
         when 'LGE_PROJECT_IS_A_CONTRACT'           then LGE_PROJECT_IS_A_CONTRACT
         when 'LPDFE_CALL_FAILED'                   then LPDFE_CALL_FAILED
         when 'LPDFE_FAILED_TO_INITIALISE'          then LPDFE_FAILED_TO_INITIALISE
         when 'LPDFE_DRIVER_UNRECOGNISED'           then LPDFE_DRIVER_UNRECOGNISED
         when 'LPDFE_DRIVER_NOT_FOUND'              then LPDFE_DRIVER_NOT_FOUND
         when 'LPDFE_JOB_NOT_STARTED'               then LPDFE_JOB_NOT_STARTED
         when 'LPDFE_JOB_ALREADY_STARTED'           then LPDFE_JOB_ALREADY_STARTED
         when 'LPDFE_SELECT_PRINTER_FAILED'         then LPDFE_SELECT_PRINTER_FAILED
         when 'LPE_ACD_ERROR'                       then LPE_ACD_ERROR
         when 'LPE_CBACK_EXISTS'                    then LPE_CBACK_EXISTS
         when 'LPE_EMAIL_ERROR'                     then LPE_EMAIL_ERROR
         when 'LPE_FAX_ERROR'                       then LPE_FAX_ERROR
         when 'LPE_INVLD_ACD_INIT'                  then LPE_INVLD_ACD_INIT
         when 'LPE_INVLD_PRINT_DEST'                then LPE_INVLD_PRINT_DEST
         when 'LPE_INVLD_SQL_STMNT'                 then LPE_INVLD_SQL_STMNT
         when 'LPE_INVLD_SQL_STMNT_CONDTN'          then LPE_INVLD_SQL_STMNT_CONDTN
         when 'LPE_INVLD_SQL_STMNT_GROUP'           then LPE_INVLD_SQL_STMNT_GROUP
         when 'LPE_LANGCODE_FIELD_NOT_SPCFD'        then LPE_LANGCODE_FIELD_NOT_SPCFD
         when 'LPE_MIXED_SQL_STMNT_DEF'             then LPE_MIXED_SQL_STMNT_DEF
         when 'LPE_MULTIDOC_FIELD_NOT_SPCFD'        then LPE_MULTIDOC_FIELD_NOT_SPCFD
         when 'LPE_MULTI_USR_LOCK_PRBLM'            then LPE_MULTI_USR_LOCK_PRBLM
         when 'LPE_NO_REP_TEMPLATES'                then LPE_NO_REP_TEMPLATES
         when 'LPE_NOTHING_TO_PRINT'                then LPE_NOTHING_TO_PRINT
         when 'LPE_PREP_FOR_PRINT_FAILED'           then LPE_PREP_FOR_PRINT_FAILED
         when 'LPE_PRINT_DEST_DISABLED'             then LPE_PRINT_DEST_DISABLED
         when 'LPE_PRINT_REC_NOT_SPCFD'             then LPE_PRINT_REC_NOT_SPCFD
         when 'LPE_PRINT_REC_FAILED'                then LPE_PRINT_REC_FAILED
         when 'LPE_REC_VLDATION_ALRDY_DEFD'         then LPE_REC_VLDATION_ALRDY_DEFD
         when 'LPE_REPDESTFLD_IDX_NOT_SPCFD'        then LPE_REPDESTFLD_IDX_NOT_SPCFD
         when 'LPE_REPDESTFLD_NOT_SPCFD'            then LPE_REPDESTFLD_NOT_SPCFD
         when 'LPE_REP_TEMPLATE_ALRDY_ADDED'        then LPE_REP_TEMPLATE_ALRDY_ADDED
         when 'LPE_SAVE_EXT_DOC_FAILED'             then LPE_SAVE_EXT_DOC_FAILED
         when 'LPE_SORT_FLD_ALRDY_SPCFD'            then LPE_SORT_FLD_ALRDY_SPCFD
         when 'LPE_SQL_STMNT_NOT_DEFD'              then LPE_SQL_STMNT_NOT_DEFD
         when 'LPE_TOO_MANY_PRINT_REC'              then LPE_TOO_MANY_PRINT_REC
         when 'LPE_UNKNWN_CBACK'                    then LPE_UNKNWN_CBACK
         when 'LPE_VLD_TEMPLATE_NOT_SPCFD'          then LPE_VLD_TEMPLATE_NOT_SPCFD
         when 'LPE_END_PRINT_FAILED'                then LPE_END_PRINT_FAILED
         when 'LPE_FILE_ERROR'                      then LPE_FILE_ERROR
         when 'LPE_INVALID_SORT_CONDITION'          then LPE_INVALID_SORT_CONDITION
         when 'LPE_SQL_TABLE_NOT_FOUND'             then LPE_SQL_TABLE_NOT_FOUND
         when 'LPE_TABLE_ALREADY_EXISTS'            then LPE_TABLE_ALREADY_EXISTS
         when 'LPE_TABLE_JOIN_UNSUPPORTED'          then LPE_TABLE_JOIN_UNSUPPORTED
         when 'LPE_INVALID_JOIN'                    then LPE_INVALID_JOIN
         when 'LPE_PDF_ERROR'                       then LPE_PDF_ERROR
         when 'LPE_NO_PRINTER'                      then LPE_NO_PRINTER
         when 'LPE_PRINT_DRIVER_FAILED_INIT'        then LPE_PRINT_DRIVER_FAILED_INIT
         when 'LPE_CALLBACK_RECORDED_ERROR'         then LPE_CALLBACK_RECORDED_ERROR
         when 'LXMLE_FAILED_TO_INITIALISE'          then LXMLE_FAILED_TO_INITIALISE
         when ''                                    then ''
         else
            ELD_DESCRIPTION_LANG_LBL --'Unrecognized Error Description'
      end
   )
,  ELD_EXTRA_INFO
,  ELD_SEVERITY
,  (
      case ELD_SEVERITY
         when 255  then 'Fatal'
         when 224  then 'AbortBatch'
         when 192  then 'AbortOrder'
         when 186  then 'AbortInvoice'
         when 184  then 'AbortInvoiceUpdate'
         when 182  then 'AbortInvoicePrint'
         when 181  then 'AbortDelivery'
         when 179  then 'AbortDeliveryUpdate'
         when 177  then 'AbortDeliveryPrint'
         when 176  then 'AbortPickingList'
         when 160  then 'AbortDetailLine'
         when 16   then 'Continue'
         when 1    then 'ExtraInfo'
         when 0    then 'Ignore'
         else
            'unknown'
      end
   )
,  ELD_VERBOSENESS
,  (
      case ELD_VERBOSENESS
         when 255  then 'Always'
         when 127  then 'Developer'
         when 2    then 'ExtraInfo'
         when 1    then 'Debug'
         when 0    then 'Unrecorded'
         else
            'unknown'
      end
   )
,  (
      case isnull(ELD_OUTCOME_LANG_LBL,'')
         when 'LEL_OUTCOME_IGNORED'                then LEL_OUTCOME_IGNORED
         when 'LEL_OUTCOME_CONTINUED'              then LEL_OUTCOME_CONTINUED
         when 'LEL_OUTCOME_SKIPPED'                then LEL_OUTCOME_SKIPPED
         when 'LEL_OUTCOME_ABORTED'                then LEL_OUTCOME_ABORTED
         when 'LEL_OUTCOME_FATAL'                  then LEL_OUTCOME_FATAL
         when 'LEL_OUTCOME_TERMINATED'             then LEL_OUTCOME_TERMINATED
         when 'LEL_OUTCOME_USE_DEFAULT_ADDRESS'    then LEL_OUTCOME_USE_DEFAULT_ADDRESS
         when 'LEL_OUTCOME_USE_DEFAULT_ADDRESSES'  then LEL_OUTCOME_USE_DEFAULT_ADDRESSES
         when 'LEL_OUTCOME_PART_PROCESSED'         then LEL_OUTCOME_PART_PROCESSED
         when 'LEL_OUTCOME_PLIST_SKPPD'            then LEL_OUTCOME_PLIST_SKPPD
         when 'LEL_OUTCOME_DNOTE_SKPPD'            then LEL_OUTCOME_DNOTE_SKPPD
         when 'LEL_OUTCOME_INV_SKPPD'              then LEL_OUTCOME_INV_SKPPD
         when 'LEL_OUTCOME_DNOTE_PRNT_SKPPD'       then LEL_OUTCOME_DNOTE_PRNT_SKPPD
         when 'LEL_OUTCOME_INV_PRNT_SKPPD'         then LEL_OUTCOME_INV_PRNT_SKPPD
         when 'LEL_OUTCOME_DNOTE_UPD_SKPPD'        then LEL_OUTCOME_DNOTE_UPD_SKPPD
         when 'LEL_OUTCOME_INV_UPD_SKPPD'          then LEL_OUTCOME_INV_UPD_SKPPD
         when ''                                   then ''
         else
            ELD_OUTCOME_LANG_LBL --'Unrecognized Error Description'
      end
   )
,  ELD_SEQUENCE_NO
,  ELD_DATETIME
,  ELH_HEADER_LINK
,  ELD_DETAIL_LINE_NO
,  ELD_DETAIL_LINK
,  LANGCODE_ERR_LOG_LABELS
   from
      (
         AA_ERROR_LOG_TREE_VIEW
            inner join ERR_LOG_HEADER        on ELH_PRIMARY =  case
                                                                  when isnull(H4,0)>0 then H4
                                                                  when isnull(H3,0)>0 then H3
                                                                  when isnull(H2,0)>0 then H2
                                                                  when isnull(H1,0)>0 then H1
                                                                  else
                                                                     H0
                                                               end
            inner join ERR_LOG_TAG           on ELT_PRIMARY =  TagLink
            inner join ERR_LOG_DETAIL        on ELD_PRIMARY =  DetailLink
      )
      cross join
      (
         LANG_GENERAL_ERRORS
            left  join LANG_ERR_LOG_LABELS   on LANGCODE_ERR_LOG_LABELS = LANGCODE_GENERAL_ERRORS
            left  join LANG_FILE_ERRORS      on LANGCODE_FILE_ERRORS    = LANGCODE_GENERAL_ERRORS
            left  join LANG_FAX_ERRORS       on LANGCODE_FAX_ERRORS     = LANGCODE_GENERAL_ERRORS
            left  join LANG_EMAIL_ERRORS     on LANGCODE_EMAIL_ERRORS   = LANGCODE_GENERAL_ERRORS
            left  join LANG_ACD_ERRORS       on LANGCODE_ACD_ERRORS     = LANGCODE_GENERAL_ERRORS
            left  join LANG_ADMS_ERRORS      on LANGCODE_ADMS_ERRORS    = LANGCODE_GENERAL_ERRORS
            left  join LANG_PDF_ERRORS       on LANGCODE_PDF_ERRORS     = LANGCODE_GENERAL_ERRORS
            left  join LANG_PRINT_ERRORS     on LANGCODE_PRINT_ERRORS   = LANGCODE_GENERAL_ERRORS
            left  join LANG_XML_ERRORS       on LANGCODE_XML_ERRORS     = LANGCODE_GENERAL_ERRORS
      )
