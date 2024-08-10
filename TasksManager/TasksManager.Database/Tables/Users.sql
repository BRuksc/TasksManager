CREATE TABLE [dbo].[Users]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL PRIMARY KEY,
	[UserId] INT UNIQUE IDENTITY(1,1) NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[Surname] VARCHAR(50) NOT NULL,
	[Position] NVARCHAR(50) NOT NULL
		CONSTRAINT [Position] 
		CHECK ([Position] = 'Worker' OR [Position] = 'Manager'),
	[ManagerId] UNIQUEIDENTIFIER NULL 
		CONSTRAINT [ManagerId] CHECK ([Position] = 'Worker')
)
