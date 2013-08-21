CREATE FUNCTION [dbo].[Function14m]
(
	@month int
)
RETURNS TABLE AS RETURN
(
	SELECT SUM(charge) as sum_month
	FROM dbo.appointment
	WHERE DATEPART(MONTH,timings)=@month
)
