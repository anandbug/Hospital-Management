CREATE TABLE [dbo].[patient]
(
	[pid] INT NOT NULL PRIMARY KEY, 
    [sex] NCHAR(10) NOT NULL, 
    [name] NVARCHAR(50) NOT NULL, 
    [address] NVARCHAR(50) NOT NULL, 
    [age] INT NOT NULL, 
    [did] INT NOT NULL, 
    [anum] INT NOT NULL, 
    CONSTRAINT [dbo.patient] FOREIGN KEY ([anum]) REFERENCES [appointment]([anum]), 
    CONSTRAINT [dbo.patient] FOREIGN KEY ([did]) REFERENCES [doctor]([did])
)
