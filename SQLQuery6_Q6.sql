USE [DCN-Miju];
GO

-----ANS NO: 06-----------------
CREATE OR ALTER PROCEDURE [dbo].[usp_GetEmployeeLoginHistory]
    @StartDate DATETIME2(0) = NULL,
    @EndDate DATETIME2(0) = NULL,
    @ShowInactiveOnly BIT = 0 
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @RecentThreshold DATETIME2(0) = DATEADD(DAY, -30, GETUTCDATE());

    SELECT 
        Id AS EmployeeID,
        FirstName,
        LastName,
        LastLogin
    FROM [Main].[Employee]
    WHERE (@StartDate IS NULL OR LastLogin >= @StartDate)
      AND (@EndDate IS NULL OR LastLogin <= @EndDate)
      AND (@ShowInactiveOnly = 0 OR (@ShowInactiveOnly = 1 AND (LastLogin < @RecentThreshold OR LastLogin IS NULL)));
END;
GO

EXEC usp_GetEmployeeLoginHistory @StartDate='2022-09-29 18:43:35', @EndDate='2022-09-30 18:43:35', @ShowInactiveOnly= 0;
