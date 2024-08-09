CREATE TABLE [dbo].[TasksHistory]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL PRIMARY KEY,
	[TasksHistoryId] INT UNIQUE IDENTITY(1,1) NOT NULL,
	[TaskId] UNIQUEIDENTIFIER NOT NULL 
		FOREIGN KEY (TaskId) REFERENCES dbo.Tasks(Id),
	[OperationType] NVARCHAR(20) NOT NULL
		 CONSTRAINT CHK_OperationType CHECK (
			OperationType = 'Deletion' OR
			OperationType = 'Editing' OR 
			OperationType = 'Adding'),
	[Column] NVARCHAR(20) NOT NULL
		CONSTRAINT [CHK_Column] CHECK ([Column] = 'Name' OR [Column] = 'Description' 
		OR [Column] = 'Owner' OR [Column] = 'Shared' OR [Column] = 'Priority' 
		OR [Column] = 'StoryPointsEstimation'),
	[NewValue] NVARCHAR(MAX) NOT NULL,
	[OldValue] NVARCHAR(MAX) NOT NULL,
	[DataOfChange] DATETIME NOT NULL
)
