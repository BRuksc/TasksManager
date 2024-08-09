ALTER TABLE [dbo].[Workers]
ADD CONSTRAINT FK_Workers_ManagerId FOREIGN KEY ([ManagerId]) REFERENCES dbo.Workers(Id)