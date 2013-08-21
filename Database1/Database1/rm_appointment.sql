CREATE PROCEDURE [dbo].[rm_appointment]
	@anum int
AS
	DELETE from dbo.appointment
	WHERE anum=@anum;
RETURN 0
