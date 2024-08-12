ALTER TABLE [dbo].[Users]
	ADD CONSTRAINT [FK_CompanyId]
	FOREIGN KEY (CompanyId)
	REFERENCES [dbo].[Companies] ([Id])
