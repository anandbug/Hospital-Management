CREATE FUNCTION [dbo].[Function_Year]
(
)
RETURNS TABLE AS RETURN
(
	SELECT SUM(Charge) AS YEAR_COLLECTION
	FROM dbo.Patient_Consult_Details
	WHERE DATEPART(YEAR,ConsultTime)=2013 AND Doctor_id=1
)