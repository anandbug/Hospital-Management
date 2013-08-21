CREATE FUNCTION [dbo].[Function14d]
(
	@day int
)
RETURNS TABLE AS RETURN
(
	SELECT SUM(charge) as sum_day
	FROM dbo.appointment
	WHERE DATEPART(DAYOFYEAR,timings)=@day
)
