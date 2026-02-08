USE [DCN-Miju];
GO
-------ANS NO: 03-----------
CREATE OR ALTER PROCEDURE [dbo].[usp_GetActivityReport]
    @StartDate DATETIME2(0),
    @EndDate DATETIME2(0)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ActivityType,
        Action,
        COUNT(1) AS ActivityCount
    FROM [Main].[ActivityLog]
    WHERE UpdatedOn BETWEEN @StartDate AND @EndDate
    GROUP BY ActivityType, Action
    ORDER BY ActivityType, ActivityCount DESC;
END;
GO

--Test-----
EXEC usp_GetActivityReport @StartDate='2025-08-25 19:30:03.0000000', @EndDate='2025-08-25 20:58:23.0000000'