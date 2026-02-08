USE [DCN-Miju];
GO

--------ANS NO: 05-------------------
CREATE OR ALTER PROCEDURE [dbo].[usp_GetWorkflowParticipants]
    @WorkflowName NVARCHAR(255) 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        w.Name AS WorkflowName,
        wp.Id AS ParticipantID,
        e.FirstName,
        e.LastName,
        e.Email
    FROM [Workflow].[ProcessParticipant] wp
    JOIN [Workflow].[Workflow] w ON wp.WorkflowId = w.Id
    JOIN [Main].[Employee] e ON wp.EmployeeId = e.Id
    WHERE w.Name = @WorkflowName -- Filtering by Name column instead of ID
    ORDER BY wp.Id ASC;
END;
GO

EXEC usp_GetWorkflowParticipants @WorkflowName = 'Ordered workflow'; --Name and ID work like same