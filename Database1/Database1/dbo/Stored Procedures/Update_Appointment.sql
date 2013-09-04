CREATE PROCEDURE [dbo].[Update_Appointment]
	@Patient_id int,
	@Doctor_id int,
	@ConsultTime datetime,
	@ModifiedBy varchar(20)
AS
	UPDATE dbo.Patient_Consult_Details
	SET ConsultTime=@ConsultTime,ModifiedBy=@ModifiedBy,ModifiedTime=GETDATE()
	WHERE Patient_id=@Patient_id AND Doctor_id=@Doctor_id;
RETURN 0