CREATE TABLE [dbo].[prescription]
(
	[pid] INT NOT NULL , 
    [did] INT NOT NULL, 
    [prescription] NVARCHAR(MAX) NULL, 
    CONSTRAINT [fk_prescription_doctor] FOREIGN KEY ([did]) REFERENCES [doctor]([did])
)
