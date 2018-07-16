CREATE PROCEDURE [dbo].[AA_WO_STAGE_INSERT_EDIT_S]
@PS_DefaultString NVARCHAR (100) NULL, @PS_Mode NVARCHAR (1) NULL, @PS_ValidateOnly BIT NULL, @PS_UserId NVARCHAR (4) NULL, @PS_RoutePrimary INT NULL, @PS_RouteCode NVARCHAR (10) NULL, @PS_Sequence INT NULL, @PS_Text NVARCHAR (30) NULL, @PS_StagePrimary INT NULL OUTPUT, @PS_Source NVARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


