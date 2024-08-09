ALTER TABLE [dbo].[TasksHistory]
ADD CONSTRAINT FK_TasksHistory_TaskId FOREIGN KEY (TaskId) REFERENCES dbo.Tasks(Id)