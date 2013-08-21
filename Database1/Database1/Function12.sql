CREATE FUNCTION [dbo].[Function12]
(
	
)
RETURNS TABLE AS RETURN
(
	SELECT *
	FROM dbo.appointment
	where DATEPART(DAYOFYEAR,timings)=237 
	AND did=3
)
