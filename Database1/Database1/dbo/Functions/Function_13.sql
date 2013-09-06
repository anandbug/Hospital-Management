CREATE FUNCTION [dbo].[Function_13]
(
	@Patient_id int,
	@Doctor_id int 
)
RETURNS TABLE AS RETURN
(
	SELECT @Patient_id AS PATIENT_ID, Doctor_id AS DOCTOR_ID,Treatment AS TREATMENT,Daignosis AS DAIGNOSIS
	FROM dbo.Prescription AS P,dbo.Patient_Consult_Details AS C
	WHERE C.Doctor_id=@Doctor_id AND C.Patient_id=@Patient_id
)