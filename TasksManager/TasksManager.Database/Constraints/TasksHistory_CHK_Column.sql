ALTER TABLE [dbo].[TasksHistory]
ADD CONSTRAINT CHK_Column 
CHECK (
    [Column] = 'Name' OR 
    [Column] = 'Description' OR 
    [Column] = 'Owner' OR 
    [Column] = 'Shared' OR 
    [Column] = 'Priority' OR 
    [Column] = 'StoryPointsEstimation'
);