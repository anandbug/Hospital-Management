CREATE PROCEDURE [dbo].[up_patient]
	@pid int,
	@name nvarchar(50),
	@address nvarchar(50)
AS
	UPDATE dbo.patient
	SET name=@name,address=@address
	WHERE pid=@pid;
RETURN 0
