CREATE PROCEDURE [dbo].[InsertTestData]
AS
	DECLARE @iteration AS INT = 10
	DECLARE @id UNIQUEIDENTIFIER
	DECLARE @userIteration INT
	DECLARE @taskIteration INT
	DECLARE @userId UNIQUEIDENTIFIER

	WHILE @iteration > 0
	BEGIN
		SET @id = NEWID()

		INSERT INTO [dbo].[Companies]
			([Id], [Name], [NipNumber])
		VALUES
			(@id, 'Test', 1111111111)

		SET @userIteration = 10

		WHILE @userIteration > 0
		BEGIN
			SET @userId = NEWID()

			INSERT INTO [dbo].[Users]
				([Id], [Name], [Surname], [Position], [CompanyId])
			VALUES
				(@userId, 'Test', 'Test', 'Manager', @id)

			SET @taskIteration = 1000

			WHILE @taskIteration > 0
			BEGIN
				INSERT INTO [dbo].[Tasks]
					([Name], [Description], [Owner], [Priority], 
					[Shared], [StoryPointsEstimation])
				VALUES
					('Test', 'Test description', @userId, 1, 0, 3)

				SET @taskIteration -= 1
			END

			SET @userIteration -= 1
		END

		SET @iteration -= 1
	END

RETURN 0
