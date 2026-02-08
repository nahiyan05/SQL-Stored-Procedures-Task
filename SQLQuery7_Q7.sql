USE [DCN-Miju];
GO


-------------ANS NO: 07------------
CREATE OR ALTER PROCEDURE [dbo].[usp_GenerateActivityDashboard]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        e.FirstName,
        e.LastName,
        COUNT(al.Id) AS TotalActivities,
        MAX(al.UpdatedOn) AS LastActivityDate
    FROM [Main].[Employee] e
    LEFT JOIN [Main].[ActivityLog] al ON e.Id = al.Initiator
    GROUP BY e.Id, e.FirstName, e.LastName;
END;
GO

EXEC usp_GenerateActivityDashboard;