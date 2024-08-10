CREATE TRIGGER [ManagerIdVerification]
	ON dbo.Users
	AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON

	IF NOT EXISTS (
		SELECT Id FROM dbo.Users WHERE ManagerId NOT IN (
			SELECT Id FROM dbo.Users WHERE Position = 'Manager'
		))
	BEGIN
		DELETE FROM dbo.Users WHERE ManagerId NOT IN (
			SELECT Id FROM dbo.Users WHERE Position = 'Manager'
		)
	END
END
