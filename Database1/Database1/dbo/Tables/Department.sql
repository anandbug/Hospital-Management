CREATE TABLE [dbo].[Department] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (10)   NOT NULL,
    [Description]  VARCHAR (50)   NOT NULL,
    [CraetedBy]    VARCHAR (20)   NOT NULL,
    [CreatedTime]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARBINARY (20) NULL,
    [ModifiedTime] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

