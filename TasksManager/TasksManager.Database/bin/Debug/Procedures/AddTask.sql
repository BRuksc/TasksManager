CREATE PROCEDURE [dbo].[AddTask]
	@Name NVARCHAR(200) NOT NULL,
	@Description NVARCHAR(MAX) NULL,
	@Owner UNIQUEIDENTIFIER NULL,
	@Shared BIT NOT NULL,
	@Priority INT NOT NULL,
	@StoryPointsEstimation INT NULL
AS
	BEGIN TRY
		INSERT INTO [dbo].[Tasks]
			(Name, Description, Owner, Shared, Priority, StoryPointsEstimation)
		VALUES
			(@Name, @Description, @Owner, @Shared, @Priority, @StoryPointsEstimation)
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
RETURN 0
