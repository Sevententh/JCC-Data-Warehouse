CREATE PROCEDURE [dbo].[AA_NLTRN_POST_S]
@PS_Trn_Primary INT NULL, @PS_Post_Origin TINYINT NULL, @PS_User_Id VARCHAR (4) NULL, @PS_Trn_Period_Number TINYINT NULL, @PS_Trn_Year CHAR (1) NULL, @PS_Posting_Number INT NULL, @PS_Next_Posting_Date DATETIME NULL, @PS_Date_Posted DATETIME NULL, @PS_Source VARCHAR (1) NULL, @PS_Header_Key VARCHAR (20) NULL, @PS_Origin BIT NULL, @PS_ErrorHandlingMethod TINYINT NULL, @PS_ErrorInstanceID BIGINT NULL OUTPUT, @PS_JournalOrigin VARCHAR (5) NULL
WITH ENCRYPTION
AS
BEGIN
--The script body was encrypted and cannot be reproduced here.
    RETURN
END


