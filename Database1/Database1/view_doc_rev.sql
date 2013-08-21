CREATE VIEW [dbo].[view_doc_revenue]
	
AS 
	SELECT did,SUM(charge) as yearrev
	FROM dbo.appointment
	GROUP BY did