CREATE TABLE [dbo].[Doctor] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [First_Name]   VARCHAR (20) NOT NULL,
    [Middle_Name]  VARCHAR (20) NULL,
    [Last_Name]    VARCHAR (20) NOT NULL,
    [Sex]          VARCHAR (10) NOT NULL,
    [DOB]          DATE         NOT NULL,
    [CreatedBy]    VARCHAR (20) NOT NULL,
    [CreatedTime]  DATETIME     DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARCHAR (20) NULL,
    [ModifiedTime] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

