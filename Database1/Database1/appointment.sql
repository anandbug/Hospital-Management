CREATE TABLE [dbo].[appointment]
(
	[anum] INT NOT NULL PRIMARY KEY, 
    [timings] DATETIME NOT NULL, 
    [daignosis] NVARCHAR(MAX) NULL, 
    [nextmeet] DATETIME NULL, 
    [charge] INT NOT NULL, 
    [did] INT NOT NULL
)
