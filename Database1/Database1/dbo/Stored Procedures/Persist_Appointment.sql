CREATE PROCEDURE [dbo].[Persist_Appointment]
	@Patient_id int,
	@Doctor_id int,
	@ConsultTime datetime,
	@CreatedBy varchar(20)
AS
	INSERT into dbo.Patient_Consult_Details(Patient_id,Doctor_id,ConsultTime,CreatedBy) values(@Patient_id,@Doctor_id,@ConsultTime,@CreatedBy);
RETURN 0