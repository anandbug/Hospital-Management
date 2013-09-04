CREATE TABLE [dbo].[Doctor_Contact_Details] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Doctor_id]    INT            NOT NULL,
    [Type_id]      INT            NOT NULL,
    [Value]        VARBINARY (50) NULL,
    [CreatedBy]    VARCHAR (20)   NOT NULL,
    [CreatedTime]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARCHAR (20)   NULL,
    [ModifiedTime] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Doctor_Contact_Details_To_Contact_Type] FOREIGN KEY ([Type_id]) REFERENCES [dbo].[Contact_Type] ([Id]),
    CONSTRAINT [FK_Doctor_Contact_Details_To_Doctor] FOREIGN KEY ([Doctor_id]) REFERENCES [dbo].[Doctor] ([Id])
);

