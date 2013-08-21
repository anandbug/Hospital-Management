CREATE PROCEDURE [dbo].[persistappointment]
	@anum int,
	@timings datetime,
    @charge int,
    @did int
AS
	INSERT into dbo.appointment(anum,timings,charge,did) values(@anum,@timings,@charge,@did);
RETURN 0
