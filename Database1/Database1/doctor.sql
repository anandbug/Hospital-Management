CREATE TABLE [dbo].[doctor]
(
	[did] INT NOT NULL PRIMARY KEY, 
    [name] NVARCHAR(50) NOT NULL, 
    [charge] MONEY NOT NULL, 
    [dep] NVARCHAR(50) NOT NULL, 
    [desc] NVARCHAR(MAX) NOT NULL, 
    [sex] NCHAR(10) NOT NULL
)
