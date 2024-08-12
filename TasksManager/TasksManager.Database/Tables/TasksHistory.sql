CREATE TABLE [dbo].[TasksHistory]
(
    [Id] UNIQUEIDENTIFIER UNIQUE DEFAULT NEWSEQUENTIALID() NOT NULL PRIMARY KEY,
	[TasksHistoryId] INT UNIQUE IDENTITY(1,1) NOT NULL,
	[TaskId] UNIQUEIDENTIFIER NOT NULL,
	[OperationType] NVARCHAR(20) NOT NULL
		 CONSTRAINT CHK_OperationType CHECK (
			OperationType = 'Deletion' OR
			OperationType = 'Editing' OR 
			OperationType = 'Adding' OR
			OperationType = 'Resolving'),
	[Column] NVARCHAR(20) NOT NULL
		CONSTRAINT [CHK_Column] CHECK ([Column] = 'Name' OR [Column] = 'Description' 
		OR [Column] = 'Owner' OR [Column] = 'Shared' OR [Column] = 'Priority' 
		OR [Column] = 'StoryPointsEstimation'),
	[NewValue] NVARCHAR(MAX) NULL,
	[OldValue] NVARCHAR(MAX) NULL,
	[DateOfChange] DATETIME NOT NULL
)
