CREATE PROCEDURE [dbo].[persistprescription]
	@pid int,
	@did int,
	@prescription nvarchar(MAX)
AS
	INSERT into dbo.prescription(pid,did,prescription) values(@pid,@did,@prescription);
RETURN 0
