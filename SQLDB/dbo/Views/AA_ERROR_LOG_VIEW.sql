create view AA_ERROR_LOG_VIEW
( ErrorGroupId
, ErrorHeaderId
, ErrorLogSequence
, ErrorDetailId
, DatabaseName
, WorkStation
, Origin
, ErrorDate
, Module
, TransHeaderLink
, Process_User
, Entered_User
, Account
, ErrorCode
, ErrorName
, ErrorDescription
, SeverityCode
, SeverityDescription
, ErrorCategory
, ErrorOutcome
, ExtraInfo
, TransDetailLineNo
, TransDetailLink
, DetailDateTime
, DetailSequence
, Language
)
as
select 
  ErrorGroupId
  , ErrorHeaderId
  , ErrorLogSequence
  , ErrorDetailId
  , DatabaseName
  , WorkStation
  , Origin
  , ErrorDate
  , Module
  , TransHeaderLink
  , Process_User
  , Entered_User
  , Account
  , ErrorCode
  , ErrorName
  , ErrorDescription
  , SeverityCode
  , SeverityDescription
  , ErrorCategory
  , ErrorOutcome
  , ExtraInfo
  , TransDetailLineNo
  , TransDetailLink
  , DetailDateTime
  , DetailSequence
  , Language
from AA_ERROR_LOG_DEBUG_VIEW
where VerbosenessCode = 255