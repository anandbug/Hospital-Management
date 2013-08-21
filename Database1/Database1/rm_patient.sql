CREATE PROCEDURE [dbo].[rm_patient]
	@pid int
AS
	DELETE from dbo.patient
	WHERE pid=@pid;
RETURN 0
