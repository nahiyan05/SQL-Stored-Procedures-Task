USE [DCN-Miju];
GO
------ANS NO: 02----------
CREATE OR ALTER PROCEDURE [dbo].[usp_GetEmployeeSummary]
    @AccountID BIGINT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        COUNT(1) AS TotalEmployees,
        SUM(CASE WHEN Archived = 0 THEN 1 ELSE 0 END) AS ActiveEmployees, --Active represents Archived = 0
        SUM(CASE WHEN Archived = 1 THEN 1 ELSE 0 END) AS ArchivedEmployees --Archived represents Archived = 1

    FROM [Main].[Employee]
    WHERE (@AccountID IS NULL OR AccountId = @AccountID);
END;
GO

EXEC usp_GetEmployeeSummary @AccountId=8; --Filtering by AccountId
--EXEC usp_GetEmployeeSummary