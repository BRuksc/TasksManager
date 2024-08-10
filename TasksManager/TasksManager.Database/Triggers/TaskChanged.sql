CREATE TRIGGER [TaskChanged]
	ON [dbo].[Tasks]
	AFTER UPDATE, INSERT, DELETE
	AS
	BEGIN
		BEGIN TRY

			SET NOCOUNT ON

			DECLARE @columnValue NVARCHAR(50)
			DECLARE @columnValueWasChanged BIT

			DECLARE @oldValue NVARCHAR(50)
			DECLARE @newValue NVARCHAR(50)

			IF UPDATE(Name) 
			BEGIN
				SET @columnValue = 'Name'
				SET @columnValueWasChanged = 1
			END
			IF UPDATE(Description) 
			BEGIN
				IF @columnValueWasChanged = 1 SET @columnValue += ', '
				SET @columnValue += 'Description'
				SET @columnValueWasChanged = 1
			END
			IF UPDATE(Owner)
			BEGIN
				IF @columnValueWasChanged = 1 SET @columnValue += ', '
				SET @columnValue += 'Owner'
				SET @columnValueWasChanged = 1
			END
			IF UPDATE(Shared)
			BEGIN
				IF @columnValueWasChanged = 1 SET @columnValue += ', '
				SET @columnValue += 'Shared'
			END

			IF EXISTS (SELECT * FROM deleted) AND EXISTS (SELECT * FROM inserted)
			BEGIN
				INSERT INTO [dbo].[TasksHistory] 
					([TaskId], [Column], [OperationType], [NewValue], [OldValue], [DateOfChange])
					SELECT
						i.TaskId,
						@columnValue,
						'Editing',
						@newValue,
						@oldValue,
						GETDATE()
					FROM
						inserted i 
					WHERE 
						EXISTS (SELECT * FROM deleted)
			  END

			  ELSE IF EXISTS (SELECT * FROM deleted)
			  BEGIN
				INSERT INTO [dbo].[TasksHistory] ([TaskId], [Column], [OperationType], [NewValue], [OldValue], [DateOfChange])
					SELECT
						d.TaskId,
						@columnValue,
						'Deletion',
						@newValue,
						@oldValue,
						GETDATE()
					FROM
						deleted d 
			  END

			  ELSE
			  BEGIN
				INSERT INTO [dbo].[TasksHistory] ([TaskId], [Column], [OperationType], [NewValue], [OldValue], [DateOfChange])
					SELECT
						i.TaskId,
						@columnValue,
						'Adding',
						@newValue,
						@oldValue,
						GETDATE()
					FROM
						inserted i 
			  END
		END TRY
		BEGIN CATCH
			THROW;
		END CATCH
	END
