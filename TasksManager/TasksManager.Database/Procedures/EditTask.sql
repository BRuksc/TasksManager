CREATE PROCEDURE [dbo].[EditTask]
	@Id INT NULL,
	@TaskId INT NULL,
	@NewTaskName NVARCHAR(200) NULL,
	@NewTaskDescription NVARCHAR(MAX) NULL,
	@NewOwner UNIQUEIDENTIFIER NULL,
	@NewShared BIT NULL,
	@NewPriority INT NULL,
	@NewStoryPointsEstimation INT NULL
AS
BEGIN TRANSACTION
	BEGIN TRY
		IF @Id IS NULL AND @TaskId IS NULL
			THROW 1, 'All of procedure parameters are null', 40;

			IF @NewTaskName IS NOT NULL 
				UPDATE dbo.Tasks SET Name = @NewTaskName;
			IF @NewTaskDescription IS NOT NULL 
				UPDATE dbo.Tasks SET Description = @NewTaskDescription;
			IF @NewOwner IS NOT NULL
				UPDATE dbo.Tasks SET Owner = @NewOwner;
			IF @NewShared IS NOT NULL
				UPDATE dbo.Tasks SET Shared = @NewShared;
			IF @NewPriority IS NOT NULL
				UPDATE dbo.Tasks SET Priority = @NewPriority;
			IF @NewStoryPointsEstimation IS NOT NULL
				UPDATE dbo.Tasks SET StoryPointsEstimation = @NewStoryPointsEstimation;

		COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH
RETURN 0
