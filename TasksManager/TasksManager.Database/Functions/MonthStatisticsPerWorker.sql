CREATE FUNCTION [dbo].[MonthEditPerWorker] (@workerId UNIQUEIDENTIFIER)
RETURNS TABLE
AS
	RETURN SELECT 
    t.Owner AS WorkerId, 
    COUNT(th.TaskId) AS ChangeCount
    FROM 
        dbo.Tasks t
    INNER JOIN 
        dbo.TasksHistory th ON t.Id = th.TaskId
    WHERE 
        th.DateOfChange >= DATEADD(MONTH, -1, GETDATE())
        AND th.DateOfChange < GETDATE()
        AND th.OperationType = 'Resolving'
    GROUP BY 
        t.Owner;