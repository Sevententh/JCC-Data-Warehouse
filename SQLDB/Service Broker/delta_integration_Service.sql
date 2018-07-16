CREATE SERVICE [delta_integration_Service]
    AUTHORIZATION [dbo]
    ON QUEUE [dbo].[delta_integration_Queue]
    ([delta_integration_MessageContract]);

