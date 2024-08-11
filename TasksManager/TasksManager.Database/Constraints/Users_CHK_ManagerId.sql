ALTER TABLE [dbo].[Users]
ADD CONSTRAINT CHK_ManagerId 
CHECK ([ManagerId] IS NULL OR [Position] = 'Worker');