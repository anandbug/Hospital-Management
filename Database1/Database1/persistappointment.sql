CREATE PROCEDURE [dbo].[persistappointment]
	@anum int,
	@timings datetime,
	@daignosis nvarchar(MAX),
	@nextmeet datetime, 
    @charge int,
    @did int
AS
	INSERT into dbo.appointment(anum,timings,daignosis,nextmeet,charge,did) values(@anum,@timings,@daignosis,@nextmeet,@charge,@did);
RETURN 0
