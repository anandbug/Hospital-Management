CREATE TABLE [dbo].[patient]
(
	[pid] INT NOT NULL PRIMARY KEY, 
    [sex] NCHAR(10) NOT NULL, 
    [name] NVARCHAR(50) NOT NULL, 
    [address] NVARCHAR(50) NOT NULL, 
    [age] INT NOT NULL, 
    [did] INT NOT NULL, 
    CONSTRAINT [fk_patienttodoctor] FOREIGN KEY ([did]) REFERENCES [doctor]([did])
)
