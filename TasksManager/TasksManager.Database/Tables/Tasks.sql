CREATE TABLE [dbo].[Tasks]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL PRIMARY KEY,
    [TaskId] INT IDENTITY(1,1) NOT NULL,
    [Name] NVARCHAR(200) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Owner] UNIQUEIDENTIFIER NOT NULL,
    [Shared] BIT NOT NULL,
    [Priority] INT NOT NULL 
        CONSTRAINT CHK_Priority CHECK ([Priority] >= 1 AND [Priority] <= 3),
    [StoryPointsEstimation] INT NULL
);
