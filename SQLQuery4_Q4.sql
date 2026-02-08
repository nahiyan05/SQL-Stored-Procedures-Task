USE [DCN-Miju];
GO

----ANS NO: 04----------------
CREATE OR ALTER PROCEDURE [dbo].[usp_SearchContacts]
    @SearchTerm NVARCHAR(100) = NULL,
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;

    SELECT 
         Id, 
        Name, 
        Email, 
        Phone
        INTO #tempResult 
    FROM [Main].[Contact]
    WHERE (@SearchTerm IS NULL 
           OR Name LIKE '%' + @SearchTerm + '%' 
           OR Email LIKE '%' + @SearchTerm + '%');

    -- 1. Search Results
    SELECT 
        Id, 
        Name, 
        Email, 
        Phone
    FROM #tempResult
    ORDER BY Id
    OFFSET @Offset ROWS
    FETCH NEXT @PageSize ROWS ONLY;

    -- 2. Total Count
    SELECT COUNT(1) AS TotalCount
    FROM #tempResult
END;
GO

---Test-----
EXEC usp_SearchContacts @SearchTerm='a', @Pagenumber=2, @Pagesize=5;