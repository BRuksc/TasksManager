CREATE TRIGGER [TaskChanged]
ON [dbo].[Tasks]
AFTER UPDATE, INSERT, DELETE
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        DECLARE @columnValue NVARCHAR(50) = '';
        DECLARE @oldValue NVARCHAR(MAX);
        DECLARE @newValue NVARCHAR(MAX);

        IF UPDATE(Name) 
        BEGIN
            SET @columnValue += 'Name';
        END
        IF UPDATE(Description) 
        BEGIN
            IF LEN(@columnValue) > 0 SET @columnValue += ', ';
            SET @columnValue += 'Description';
        END
        IF UPDATE(Owner)
        BEGIN
            IF LEN(@columnValue) > 0 SET @columnValue += ', ';
            SET @columnValue += 'Owner';
        END
        IF UPDATE(Shared)
        BEGIN
            IF LEN(@columnValue) > 0 SET @columnValue += ', ';
            SET @columnValue += 'Shared';
        END

        IF EXISTS (SELECT * FROM deleted) AND EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO [dbo].[TasksHistory] 
                ([Id], [TaskId], [Column], [OperationType], [NewValue], [OldValue], [DateOfChange])
                SELECT
                    NEWID(),
                    i.Id,
                    @columnValue,
                    'Editing',
                    CASE WHEN i.Name IS NOT NULL THEN i.Name ELSE '' END,
                    CASE WHEN d.Name IS NOT NULL THEN d.Name ELSE '' END,
                    GETDATE()
                FROM
                    inserted i 
                JOIN
                    deleted d ON i.Id = d.Id;
        END
        ELSE IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO [dbo].[TasksHistory] 
                ([Id], [TaskId], [Column], [OperationType], [NewValue], [OldValue], [DateOfChange])
                SELECT
                    NEWID(),
                    d.Id,
                    @columnValue,
                    'Deletion',
                    '',
                    d.Name,
                    GETDATE()
                FROM
                    deleted d;
        END
        ELSE
        BEGIN
            INSERT INTO [dbo].[TasksHistory] 
                ([Id], [TaskId], [Column], [OperationType], [NewValue], [OldValue], [DateOfChange])
                SELECT
                    NEWID(),
                    i.Id,
                    @columnValue,
                    'Adding',
                    i.Name,
                    '',
                    GETDATE()
                FROM
                    inserted i;
        END
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;