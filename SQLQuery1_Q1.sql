USE [DCN-Miju];
GO

---------ANS NO: 01---------
CREATE OR ALTER PROCEDURE [dbo].[usp_GetEmployeeActivityLog]
    @EmployeeID VARCHAR(50) = NULL,
    @StartDate DATETIME2(0) = NULL,
    @EndDate DATETIME2(0) = NULL,
    @MaxRows INT = 100
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@MaxRows)
        al.Id AS LogID,
        e.FirstName,
        e.LastName,
        al.ActivityType,
        al.Action,
        al.UpdatedOn AS ActivityDate
    FROM [Main].[ActivityLog] al
    LEFT JOIN [Main].[Employee] e ON al.AccountId = e.AccountId
    WHERE (e.EmployeeId = @EmployeeID)
      AND (al.UpdatedOn IS NULL OR al.UpdatedOn >= @StartDate)
      AND (al.UpdatedOn IS NULL OR al.UpdatedOn <= @EndDate)
    ORDER BY al.UpdatedOn DESC;
END;
GO

--Test---
EXEC usp_GetEmployeeActivityLog @EmployeeID = 'EMP0402', @StartDate= '2020-04-03 05:17:59.0000000', @EndDate= '2021-06-04 01:56:22.0000000', @MaxRows = 2;