﻿CREATE PROCEDURE [dbo].[AA_SYS_COMPADDR_INSERT_EDIT_S]
@PS_Default_String VARCHAR (100) NULL, @PS_Mode VARCHAR (1) NULL, @PS_Validate_Only BIT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Primary INT NULL OUTPUT, @PS_Code VARCHAR (13) NULL, @PS_CompanyName VARCHAR (40) NULL, @PS_Address VARCHAR (160) NULL, @PS_Address_User1 VARCHAR (30) NULL, @PS_Address_User2 VARCHAR (30) NULL, @PS_Post_Code VARCHAR (12) NULL, @PS_Phone VARCHAR (20) NULL, @PS_Fax VARCHAR (20) NULL, @PS_Email VARCHAR (64) NULL, @PS_Notes TEXT NULL, @PS_Contact VARCHAR (30) NULL, @PS_Purchase_Analysis VARCHAR (25) NULL, @PS_Default BIT NULL, @PS_Country VARCHAR (35) NULL, @PS_CC_Email VARCHAR (64) NULL, @PS_Source VARCHAR (1) NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_InstanceID BIGINT NULL OUTPUT, @PS_ObjectGuid UNIQUEIDENTIFIER NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


