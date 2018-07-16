CREATE PROCEDURE tssp_get_sequence

-- tssp_get_sequence Version 1
-- Armstrong Consultants Ltd
-- Timesheet Module stored procedure used to retrieve the next primary number for a given table code.
-- This procedure will accept input parameters to denote the appopriate table
-- Error handling is performed by the return code
-- 
-- Version History:
-- Version 1  - Written By Sunny Aujla
-- Version 2  - Martin Lynch - 15/12/2010 - Changed to allow multiple sequnces

@ParTableCode  VARCHAR(255),  -- Table Code
@ParSequence  INT OUT,   -- Sequence Passed Back
@ParIncrement   smallint = 1   -- Increment value

AS

BEGIN
-- Prevent update of data used in the procedure by other users
set transaction isolation level repeatable read

begin transaction

	-- Retrieve the next sequence number
	update TB_ARM_SEQ_CONTROL 
	set SEQ_LAST_NO = SEQ_LAST_NO + @ParIncrement 
	   from TB_ARM_SEQ_CONTROL 
	where SEQ_TABLE_CODE = @ParTableCode

	if @@rowcount = 0
	   begin 
		  Rollback Transaction
		  Return -1
	   end

	-- Returns the next sequence number - the next available sequence number regardless of the increment.
	-- The client should then handle using the remaining sequence numbers based on the supplied increment number.
	select @ParSequence = (SEQ_LAST_NO - @ParIncrement + 1) 
	from TB_ARM_SEQ_CONTROL 
	where SEQ_TABLE_CODE=@ParTableCode

	if @@rowcount = 0
	   begin
		  Rollback Transaction
		  Return -1
	   end
	else
	   commit TRANSACTION
	   
END