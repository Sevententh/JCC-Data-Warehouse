CREATE QUEUE [dbo].[delta_integration_Queue]
    WITH ACTIVATION (STATUS = ON, PROCEDURE_NAME = [dbo].[delta_integration_Receive], MAX_QUEUE_READERS = 1, EXECUTE AS OWNER);

