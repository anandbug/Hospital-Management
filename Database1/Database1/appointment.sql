CREATE TABLE [dbo].[appointment]
(
	[anum] INT NOT NULL PRIMARY KEY, 
    [timings] DATETIME NOT NULL, 
    [charge] INT NOT NULL, 
    [did] INT NOT NULL, 
    CONSTRAINT [fk_appointmenttodoctor] FOREIGN KEY ([did]) REFERENCES [doctor]([did]) 
)
