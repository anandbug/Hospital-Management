CREATE FUNCTION [dbo].[Function_12]
(
	@Doctor_id int,
	@Datenum int
)
RETURNS TABLE AS RETURN
(
	SELECT Doctor_id AS DOCTOR_ID, ConsultTime AS CONSULT_DATE
	FROM dbo.Patient_Consult_Details
	WHERE Doctor_id=@Doctor_id AND DATEPART(DAYOFYEAR,ConsultTime)=@Datenum
)