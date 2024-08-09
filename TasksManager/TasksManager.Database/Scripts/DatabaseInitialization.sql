DECLARE @Cmd  AS NVARCHAR(255) = 'dir /A-D /B "\TasksManager.Database\Tables" | find /c /v ""'

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

CREATE TABLE #FileCount (Line NVARCHAR(255))

INSERT INTO #FileCount
EXEC xp_cmdshell @Cmd

SET @Cmd = 'dir "\TasksManager.Database\Tables" /b /a-d';

CREATE TABLE #FilesList (
    FileName NVARCHAR(255)
);

INSERT INTO #FilesList (FileName)
EXEC xp_cmdshell @Cmd;

DELETE FROM #FilesList WHERE FileName IS NULL;

DECLARE @FileName NVARCHAR(255);

SELECT * FROM #FilesList ORDER BY FileName DESC;

DECLARE FileCursor CURSOR FOR
SELECT FileName FROM #FilesList;

OPEN FileCursor;

FETCH NEXT FROM FileCursor INTO @FileName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Cmd = 'sqlcmd -S localhost -d TasksManager -E -i \TasksManager.Database\Tables\'+ @FileName +'.sql';
    EXEC xp_cmdshell @Cmd;

    FETCH NEXT FROM FileCursor INTO @FileName;
END

CLOSE FileCursor;

DEALLOCATE FileCursor;

DROP TABLE #FileCount
DROP TABLE #FilesList