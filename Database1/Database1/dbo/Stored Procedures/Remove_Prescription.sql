CREATE PROCEDURE [dbo].[Remove_Prescription]
	@Consult_id int
AS
	DELETE FROM dbo.Prescription
	WHERE Consult_id=@Consult_id;
RETURN 0