CREATE TABLE [dbo].[appointment]
(
	[anum] INT NOT NULL PRIMARY KEY, 
    [timings] DATETIME NOT NULL, 
    [daignosis] VARCHAR(MAX) NULL, 
    [nextmeet] DATETIME NULL, 
    [charge] INT NOT NULL, 
    [did] INT NOT NULL
)
