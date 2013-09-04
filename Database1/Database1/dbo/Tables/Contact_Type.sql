CREATE TABLE [dbo].[Contact_Type] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Type]         VARCHAR (10)   NOT NULL,
    [CreatedBy]    VARBINARY (20) NOT NULL,
    [CreatedTime]  DATETIME       DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARBINARY (20) NULL,
    [ModifiedTime] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

