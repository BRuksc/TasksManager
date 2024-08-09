CREATE TABLE [dbo].[TasksHistory]
(
	[Id] UNIQUEIDENTIFIER UNIQUE DEFAULT NEWSEQUENTALID() NOT NULL,
	[TasksHistoryId] INT UNIQUE IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[TaskId] UNIQUEIDENTIFIER NOT NULL 
		FOREIGN KEY (TaskId) REFERENCES dbo.Tasks(Id),
	[Column] NVARCHAR(20) NOT NULL
		CONSTRAINT [Column] CHECK ([Column] = 'Name' OR [Column] = 'Description' 
		OR [Column] = 'Owner' OR [Column] = 'Shared' OR [Column] = 'Priority' 
		OR [Column] = 'StoryPointsEstimation'),
	[NewValue] NVARCHAR(MAX) NOT NULL,
	[OldValue] NVARCHAR(MAX) NOT NULL
)
