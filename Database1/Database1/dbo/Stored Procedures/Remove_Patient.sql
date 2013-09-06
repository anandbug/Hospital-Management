CREATE PROCEDURE [dbo].[Remove_Patient]
	@Patient_id int
AS
	DELETE FROM dbo.Patient
	WHERE Id=@Patient_id;
RETURN 0