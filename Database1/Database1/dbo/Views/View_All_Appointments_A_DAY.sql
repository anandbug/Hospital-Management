CREATE VIEW [dbo].[View_All_Appointments_A_DAY]
	AS 
	SELECT Id,Patient_id,Doctor_id,ConsultTime
	FROM dbo.Patient_Consult_Details
	WHERE DATEPART(DAYOFYEAR,ConsultTime)=33;