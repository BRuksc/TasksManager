CREATE TABLE [dbo].[TasksHistory]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL PRIMARY KEY,
	[TasksHistoryId] INT UNIQUE IDENTITY(1,1) NOT NULL,
	[TaskId] UNIQUEIDENTIFIER NOT NULL,
	[OperationType] NVARCHAR(20) NOT NULL
		 CONSTRAINT CHK_OperationType CHECK (
			OperationType = 'Deletion' OR
			OperationType = 'Editing' OR 
			OperationType = 'Adding' OR
			OperationType = 'Resolving'),
	[Column] NVARCHAR(MAX) NULL,
	[NewValue] NVARCHAR(MAX) NULL,
	[OldValue] NVARCHAR(MAX) NULL,
	[DateOfChange] DATETIME NOT NULL
)
