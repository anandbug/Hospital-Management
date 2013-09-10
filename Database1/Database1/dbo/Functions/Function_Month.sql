CREATE FUNCTION [dbo].[Function_Month]
(
	
)
RETURNS TABLE AS RETURN
(
	SELECT SUM(Charge) AS MONTH_COLECTION
	FROM dbo.Patient_Consult_Details
	WHERE DATEPART(MONTH,ConsultTime)=2 AND Doctor_id=1
)