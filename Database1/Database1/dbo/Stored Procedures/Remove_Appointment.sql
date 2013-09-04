CREATE PROCEDURE [dbo].[Remove_Appointment]
	@Patient_id int,
	@Doctor_id int
AS
	DELETE FROM dbo.Patient_Consult_Details
	WHERE Patient_id=@Patient_id AND Doctor_id=@Doctor_id;
RETURN 0