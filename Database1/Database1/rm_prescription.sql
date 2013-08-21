CREATE PROCEDURE [dbo].[rm_prescription]
	@pid int
AS
	DELETE from dbo.prescription
	WHERE pid=@pid;
RETURN 0
