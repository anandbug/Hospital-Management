CREATE TABLE [dbo].[Doctor_Department] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [Doctor_id]     INT          NOT NULL,
    [Department_id] INT          NOT NULL,
    [CreatedBy]     VARCHAR (20) NOT NULL,
    [CreaTime]      DATETIME     DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]    VARCHAR (20) NULL,
    [ModifiedTime]  DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Doctor_Department_To_Department] FOREIGN KEY ([Department_id]) REFERENCES [dbo].[Department] ([Id]),
    CONSTRAINT [FK_Doctor_Department_To_Doctor] FOREIGN KEY ([Doctor_id]) REFERENCES [dbo].[Doctor] ([Id])
);

