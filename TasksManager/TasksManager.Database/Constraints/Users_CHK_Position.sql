ALTER TABLE [dbo].[Users]
ADD CONSTRAINT CHK_Position 
CHECK ([Position] = 'Worker' OR [Position] = 'Manager');