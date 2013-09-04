CREATE TABLE [dbo].[Drugs_Given] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Prescription_id] INT            NOT NULL,
    [Drug_Name]       VARBINARY (20) NOT NULL,
    [Frequency_id]    INT            NOT NULL,
    [CreatedBy]       VARCHAR (20)   NOT NULL,
    [CreatedTime]     DATETIME       DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]      VARCHAR (20)   NULL,
    [ModifiedTIme]    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Table_To_Frequency] FOREIGN KEY ([Frequency_id]) REFERENCES [dbo].[Frequency] ([Id]),
    CONSTRAINT [FK_Table_To_Prescription] FOREIGN KEY ([Prescription_id]) REFERENCES [dbo].[Prescription] ([Id])
);

