CREATE TABLE [dbo].[Frequency] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Value]        VARCHAR (20) NOT NULL,
    [CreatedBy]    VARCHAR (20) NOT NULL,
    [CreatedTime]  DATETIME     DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARCHAR (20) NULL,
    [ModifiedTime] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

