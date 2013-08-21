CREATE VIEW [dbo].[viewappointment]
	AS 
	SELECT *
	FROM [appointment]
	WHERE DATEPART(DAYOFYEAR,timings)=237