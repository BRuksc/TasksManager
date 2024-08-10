ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT FK_Tasks_Owner FOREIGN KEY ([Owner]) REFERENCES dbo.Users(Id)