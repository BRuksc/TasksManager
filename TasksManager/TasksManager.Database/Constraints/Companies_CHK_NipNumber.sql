ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [CHK_NipNumber]
CHECK (LEN([NipNumber] AS VARCHAR) = 10)