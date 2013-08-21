CREATE PROCEDURE [dbo].[up_appointment]
	@anum int,
	@timings datetime
AS
	UPDATE dbo.appointment
	SET timings=@timings
	WHERE anum=@anum;
RETURN 0
