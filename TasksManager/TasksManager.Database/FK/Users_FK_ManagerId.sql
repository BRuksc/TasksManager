ALTER TABLE [dbo].[Users]
ADD CONSTRAINT FK_Workers_ManagerId FOREIGN KEY ([ManagerId]) REFERENCES dbo.Users(Id)