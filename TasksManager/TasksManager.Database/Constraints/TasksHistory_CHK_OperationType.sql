ALTER TABLE [dbo].[TasksHistory]
ADD CONSTRAINT CHK_OperationType 
CHECK (
    [OperationType] = 'Deletion' OR
    [OperationType] = 'Editing' OR 
    [OperationType] = 'Adding' OR
    [OperationType] = 'Resolving'
);