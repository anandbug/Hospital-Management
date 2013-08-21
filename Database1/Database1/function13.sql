CREATE FUNCTION [dbo].[function13]
(
	@pid int,
	@did int
)
RETURNS TABLE AS RETURN
(
	SELECT *
	FROM dbo.prescription
	WHERE pid=@pid 
	AND did=@did
)
