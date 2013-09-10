CREATE VIEW [dbo].[View_Doctor_Revenue_Day]
AS
	SELECT *
	FROM Function_Day(),Function_Month(),Function_Year();