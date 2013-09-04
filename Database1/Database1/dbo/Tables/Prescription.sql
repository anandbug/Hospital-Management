CREATE TABLE [dbo].[Prescription] (
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [Consult_id]        INT          NOT NULL,
    [Daignosis]         VARCHAR (50) NOT NULL,
    [Treatment_for]     VARCHAR (50) NOT NULL,
    [Rest_adviced_days] INT          NULL,
    [CratedBy]          VARCHAR (10) NOT NULL,
    [CreatedTime]       DATETIME     DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]        VARCHAR (10) NULL,
    [ModifiedTime]      DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Prescription_To_Patient_Consult] FOREIGN KEY ([Consult_id]) REFERENCES [dbo].[Patient_Consult_Details] ([Id])
);

