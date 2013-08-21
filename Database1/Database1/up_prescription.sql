CREATE PROCEDURE [dbo].[up_prescription]
	@pid int,
	@prescription nvarchar(MAX)
AS
	UPDATE dbo.prescription
	SET prescription=@prescription
	WHERE pid=@pid;
RETURN 0
