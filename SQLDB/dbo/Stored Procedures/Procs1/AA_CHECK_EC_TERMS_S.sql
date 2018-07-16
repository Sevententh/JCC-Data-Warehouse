CREATE PROCEDURE [dbo].[AA_CHECK_EC_TERMS_S]
@PS_DefaultString VARCHAR (3) NULL, @PS_Df_EcDelTerms VARCHAR (3) NULL, @PS_Df_EcTranNat VARCHAR (2) NULL, @PS_Df_EcTranMode VARCHAR (1) NULL, @PS_En_EcDelTerms VARCHAR (3) NULL OUTPUT, @PS_En_EcTranNat VARCHAR (2) NULL OUTPUT, @PS_En_EcTranMode VARCHAR (1) NULL OUTPUT, @PS_Transaction BIT NULL, @PS_Reject_Invalid BIT NULL, @PS_User_Id NVARCHAR (4) NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ErrorHandlingMethod TINYINT NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


