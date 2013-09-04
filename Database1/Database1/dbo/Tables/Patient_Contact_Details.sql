CREATE TABLE [dbo].[Patient_Contact_Details] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Patient_id]   INT          NOT NULL,
    [Type_id]      INT          NOT NULL,
    [Value]        VARCHAR (50) NULL,
    [CreatedBy]    VARCHAR (20) NOT NULL,
    [CratedTime]   DATETIME     DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARCHAR (20) NULL,
    [ModifiedTime] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Patient_Contact_Details_To_Contact_Type] FOREIGN KEY ([Type_id]) REFERENCES [dbo].[Contact_Type] ([Id]),
    CONSTRAINT [FK_Patient_Contact_Details_To_Patient] FOREIGN KEY ([Patient_id]) REFERENCES [dbo].[Patient] ([Id])
);

