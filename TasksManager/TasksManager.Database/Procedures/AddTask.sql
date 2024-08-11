CREATE PROCEDURE [dbo].[AddTask]
	@Name NVARCHAR(200) NULL,
	@Description NVARCHAR(MAX) NULL,
	@Owner UNIQUEIDENTIFIER NULL,
	@Shared BIT NULL,
	@Priority INT NULL,
	@StoryPointsEstimation INT NULL
AS
	BEGIN TRY
		IF (@Name IS NOT NULL AND @Shared IS NOT NULL AND @Priority IS NOT NULL)
		BEGIN
			INSERT INTO [dbo].[Tasks]
				(Id, Name, Description, Owner, Shared, Priority, StoryPointsEstimation)
			VALUES
				(NEWID(), @Name, @Description, @Owner, @Shared, @Priority, @StoryPointsEstimation)
		END
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
RETURN 0
