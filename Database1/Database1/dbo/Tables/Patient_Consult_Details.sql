CREATE TABLE [dbo].[Patient_Consult_Details] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Patient_id]   INT          NOT NULL,
    [Doctor_id]    INT          NOT NULL,
    [ConsultTime]  DATETIME     NOT NULL,
    [Charge]       INT          NOT NULL,
    [CreatedBy]    VARCHAR (20) NOT NULL,
    [CreatedTime]  DATETIME     DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]   VARCHAR (20) NULL,
    [ModifiedTime] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Patient_Consult_Details_To_Doctor] FOREIGN KEY ([Doctor_id]) REFERENCES [dbo].[Doctor] ([Id]),
    CONSTRAINT [FK_Patient_Consult_Details_To_Patient] FOREIGN KEY ([Patient_id]) REFERENCES [dbo].[Patient] ([Id])
);

