ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT CHK_Priority 
CHECK ([Priority] >= 1 AND [Priority] <= 3);