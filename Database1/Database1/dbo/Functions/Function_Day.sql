CREATE FUNCTION [dbo].[Function_Day]
(
)
RETURNS TABLE AS RETURN
(
	SELECT SUM(Charge) AS DAY_COLLECTION
	FROM dbo.Patient_Consult_Details
	WHERE DATEPART(DAYOFYEAR,ConsultTime)=33 AND Doctor_id=1
)